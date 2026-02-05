import logging
import time
import datetime
import stat

import os
import glob
import subprocess

from src.scasp_functions import scaspharness
from src.simulators import simulator_virtualhome
from src.main_helpers import run, check_results, task_helper
from src.counterfactual_analysis import counterfactual_checker

def fix_end_and_perms(script_paths):
    """
    fix line endings / executability for scripts because Windows bug
    traced from get_relevant() -> program.run_query -> failing to properly spawn casp.
    """
    
    for script in script_paths:
        if not os.path.exists(script):
            print(f"  Warning: Script not found - {script}")
            continue
        
        print(f"\n  Processing: {os.path.basename(script)}")
        os.chmod(script, 0o755)
        
        try:
            with open(script, 'rb') as f:
                original = f.read()
                
            has_crlf = b'\r\n' in original
            has_cr = b'\r' in original and not has_crlf
            has_lf = b'\n' in original
            
            if has_crlf or has_cr:
                converted = original.replace(b'\r\n', b'\n').replace(b'\r', b'\n')
                with open(script, 'wb') as f:
                    f.write(converted)
            print(f"Conv success")
        except Exception as e:
            print(f"FAILED to process {script}: {e}")
            
################
if __name__ == '__main__':
    print("DEBUG: Testing SCASP installation...")
    test_result = subprocess.run(["which", "scasp"], capture_output=True, text=True)
    print(f"which scasp: {test_result.stdout.strip()}")

    test_result = subprocess.run(["scasp", "--version"], capture_output=True, text=True)
    print(f"scasp --version: {test_result.stdout} {test_result.stderr}")

    # Check if the shell script exists
    script_path = "scasp_knowledge_base/scasp_runner.sh"
    script_path = script_path.strip()
    
    if os.path.exists(script_path):
        # Check if it's executable
        if not os.access(script_path, os.X_OK):
            print(f"DEBUG: Setting execute permission for {script_path}")
            # Get current permissions
            st = os.stat(script_path)
            # Add execute permission for owner (you can also add group/others if needed)
            os.chmod(script_path, st.st_mode | stat.S_IEXEC)  
    print(f"Script exists: {os.path.exists(script_path)}")
    print(f"Script is executable: {os.access(script_path, os.X_OK)}")
    
    # make sure it can run AGAIN
    print(f"File exists: {os.path.exists(script_path)}")
    print(f"Is file: {os.path.isfile(script_path)}")
    print(f"Is executable: {os.access(script_path, os.X_OK)}")
    print(f"Absolute path: {os.path.abspath(script_path)}")
    print(f"Real path: {os.path.realpath(script_path)}")
    
    # get the directory of the current script
    current_dir = os.path.dirname(os.path.abspath(__file__))
    kb_dir = os.path.join(current_dir, "scasp_knowledge_base")
    
    if not os.path.isdir(kb_dir):
        print(f"ERROR: Directory not found: {kb_dir}")
        exit(1)

    # find all .sh files
    sh_scripts = glob.glob(os.path.join(kb_dir, "*.sh"))
    
    if not sh_scripts:
        print(f"Warning: No .sh files found in {kb_dir}")
    else:
        print(f"Found {len(sh_scripts)} scripts. Fixing line endings and permissions...")
        fix_end_and_perms(sh_scripts)
    
    
    # try to run the shell script directly
    if os.path.exists(script_path):
        # this didn't work sometimes
        '''
        test_result = subprocess.run(
            ['bash', '-c', f'source ~/.bashrc && scasp -a --no_nmr ./scasp_knowledge_base/generated_scasp.pl'],
            capture_output=True, 
            text=True,
            cwd=os.getcwd()  # Set current working directory
        )
        '''
        test_result = subprocess.run(['bash', script_path], capture_output=True, text=True)
        print("subprocess.run 'bash' works:")
        print(f"Shell script output: {test_result.stdout}")
        print(f"Shell script error: {test_result.stderr}")
        print(f"Shell script return code: {test_result.returncode}")
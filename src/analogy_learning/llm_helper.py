import ollama
import requests
import logging

from abc import ABC, abstractmethod
class LLM(ABC):
    def __init__(self, model="mistral"):
        self.model = model

    @abstractmethod
    def ask_llm(self, question):
        pass

class LocalLLM(LLM):
    def ask_llm(self, question):
        logging.debug("Question for LLM: " + question)
        response = ollama.chat(
            model=self.model,
            messages=[
                {"role": "user", "content": question}
                ]
            )
        logging.debug("Answer from LLM: " + response["message"]["content"])
        return response["message"]["content"]

class InternetLLM(LLM):
    def ask_llm(self, question):
        logging.debug("Question for LLM: " + question)
        response = requests.post(
            "http://localhost:11434/api/generate",
            json={
                "model": self.model,
                "prompt": question,
                "stream": False
            }
        )
        logging.debug("Answer from LLM: " + response.json()["response"])
        return response.json()["response"]

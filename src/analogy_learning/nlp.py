import gensim
import math
from collections import Counter
import re

WORD = re.compile(r"\w+")

# Code in this file heavily borrowed from
# https://github.com/Alexandara/nlp_techniques_chatbot_project/blob/main/chatbot_project/utilities.py
def get_cosine(vec1, vec2):
	intersection = set(vec1.keys()) & set(vec2.keys())
	numerator = sum([vec1[x] * vec2[x] for x in intersection])

	sum1 = sum([vec1[x] ** 2 for x in list(vec1.keys())])
	sum2 = sum([vec2[x] ** 2 for x in list(vec2.keys())])
	denominator = math.sqrt(sum1) * math.sqrt(sum2)

	if not denominator:
		return 0.0
	else:
		return float(numerator) / denominator

def text_to_vector(text):
	words = WORD.findall(text)
	return Counter(words)


def get_similar(task, dict_of_tasks):
	"""
	Calculates the most similar sentence in sentences to the one in sent using cosine similarity
	:param sent: original sentence
	:param sentences: array of sentences to check against
	:return:
	"""
	max_sim = 0
	similar = ""
	sim_key = ""
	for key in dict_of_tasks:
		sentence = dict_of_tasks[key].task
		if task != sentence:
			v1 = text_to_vector(task)
			v2 = text_to_vector(sentence)
			similarity = get_cosine(v1, v2)
			if similarity >= max_sim:
				max_sim = similarity
				similar = sentence
				sim_key = key
	return sim_key, similar

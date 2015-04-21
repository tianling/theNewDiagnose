#__author__ = 'tianling'

import matplotlib.pyplot as plt
from sklearn import datasets
from sklearn import svm
import xmlGet
import sys
import json

diagData = xmlGet.get_xml_data()

labels = diagData['label']
vectors = diagData['vector']

clf = svm.SVC()
clf = svm.SVC(gamma = 0.001,C=100)

X,y = vectors,labels

clf.fit(X,y)

pre = json.loads(sys.argv[1])

print(clf.predict(pre))


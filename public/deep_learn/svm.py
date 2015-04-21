#__author__ = 'tianling'


import matplotlib.pyplot as plt
from sklearn import datasets
from sklearn import svm

digits = datasets.load_digits()

print(type(digits.data[1]))
#print (digits.target)

clf = svm.SVC()
clf = svm.SVC(gamma = 0.001,C=100)


X,y = digits.data[:-10],digits.target[:-10]

clf.fit(X,y)
#print digits.data[-4]
#print(clf.predict(digits.data[-4]))

#plt.imshow(digits.images[-4], cmap=plt.cm.gray_r, interpolation='nearest')
#plt.show()

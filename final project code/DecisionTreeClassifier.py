#!/usr/bin/env python
# coding: utf-8

# In[59]:


import pandas as pd
import numpy as np
from sklearn.tree import DecisionTreeClassifier # Import Decision Tree Classifier
from sklearn.model_selection import train_test_split # Import train_test_split function
from sklearn import metrics #Import scikit-learn metrics module for accuracy calculation
from sklearn.naive_bayes import MultinomialNB


# In[37]:


raw_training1= pd.read_csv("/Users/liuj/desktop/trainset.csv")
raw_test1=pd.read_csv("/Users/liuj/desktop/testset.csv")


# In[38]:


#turn to dummy variables
raw_training2=pd.get_dummies(raw_training1)
raw_test2=pd.get_dummies(raw_test1)


# In[39]:


raw_training2


# In[40]:


raw_training2.columns.values.tolist()
raw_test2.columns.values.tolist()


# In[41]:


col_training=raw_training2.columns.values.tolist()


# In[42]:


col_training_=col_training


# In[43]:


col_training_


# In[44]:


del col_training_[763]#get the colnames without cogscore


# In[45]:


col_name_no_score=col_training_


# In[46]:


col_name_no_score


# In[47]:



#X = raw_training2[col_name_no_score] # Features
#y = raw_test2.cogscore # Target variable


# In[94]:


#X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=1) # 70% training and 30% test
X_train=raw_training2[col_name_no_score] 
X_test=raw_test2[col_name_no_score] 
y_train=raw_training2.cogscore
y_test=raw_test2.cogscore


# In[95]:


# Create Decision Tree classifier object
clf = DecisionTreeClassifier()

# Train Decision Tree Classifer
clf = clf.fit(X_train,y_train)

#Predict the response for test dataset
y_pred = clf.predict(X_test)


# In[97]:



print("Accuracy:",metrics.accuracy_score(y_test, y_pred))
print("Precision:",metrics.precision_score(y_test, y_pred))
print("Recall:",metrics.recall_score(y_test, y_pred))
print("F1_score:",metrics.f1_score(y_test, y_pred))


# In[85]:



print("Accuracy:",metrics.accuracy_score(y_test, y_pred))


# In[86]:


print("F1_score:",metrics.f1_score(y_test, y_pred))


# In[87]:


import_level = clf.feature_importances_ 
x_columns =col_name_no_score
index = np.argsort(import_level)[::-1]
for each in range(X_train.shape[1]):
    print('The important level of '+ x_columns[index[each]]+ ':      '+ str(import_level[index[each]]))


# In[99]:


def cv_score(d):
    clf = DecisionTreeClassifier(max_depth=d)
    clf.fit(X_train, y_train)
    return(clf.score(X_train, y_train), clf.score(X_test, y_test))


# In[100]:


from sklearn.model_selection import train_test_split

depths = np.arange(1,10)
scores = [cv_score(d) for d in depths]
tr_scores = [s[0] for s in scores]
te_scores = [s[1] for s in scores]

tr_best_index = np.argmax(tr_scores)
te_best_index = np.argmax(te_scores)

print("bestdepth:", te_best_index+1, " bestdepth_score:", te_scores[te_best_index], '\n')


# In[101]:


model = DecisionTreeClassifier(max_depth=5)
model.fit(X_train, y_train)

y_pred = model.predict(X_test)
print("Accuracy:",metrics.accuracy_score(y_test, y_pred))
print("Precision:",metrics.precision_score(y_test, y_pred))
print("Recall:",metrics.recall_score(y_test, y_pred))
print("F1_score:",metrics.f1_score(y_test, y_pred))


# In[60]:


nb = MultinomialNB()
nb.fit(X_train, y_train)


# In[62]:


y_predicted = nb.predict(X_test)


# In[63]:


from sklearn.metrics import accuracy_score

accuracy_score(y_test, y_predicted) 


# In[ ]:





#!/usr/bin/env python
# coding: utf-8

# In[3]:


import matplotlib.pyplot as plt

Query = ['Pre-Index', 'Post Index']
Execution = [6.8, 0.32]

plt.bar(Query, Execution)
plt.title('Query Execution Time')
plt.xlabel('Query')
plt.ylabel('Execution Time (miliseconds)')
plt.show()



# In[ ]:





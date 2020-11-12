#!/usr/bin/env python
# coding: utf-8

# In[3]:


import matplotlib.pyplot as plt

Query = ['Pre-Index', 'Post Index']
Execution = [0.0068, 0.00032]

plt.bar(Query, Execution)
plt.title('Query Execution Time')
plt.xlabel('Query')
plt.ylabel('Execution Time (seconds)')
plt.show()


# In[ ]:





import matplotlib.pyplot as plt 
import numpy as np

file_name = "mer_histo.histo"
x_list = []
y_list = []
file1 = open(file_name) 

with open(file_name) as file:
	i = 0
	for line in file:
		line = line.split()
		x_list.append(int(line[0]))
		y_list.append(int(line[1]))
		i += 1
		if i > 200:
			break		

plt.plot(x_list,y_list)
plt.savefig('e_coli_hist_k7.jpg')

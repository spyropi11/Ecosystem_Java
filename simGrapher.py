import matplotlib.pyplot as plt

coordListX = []
coordListY = []

with open('simData.txt','r') as file:
  
    # reading each line   
    for line in file:
        # reading each word
        index = 0;
        for word in line.split():
            
            
            if (index == 0):
                coordListX.append(int(word))

            if (index == 1):
                coordListY.append(int(word))

            index = index + 1
            
plt.plot(coordListX,coordListY)
plt.show()

import matplotlib.pyplot as plt
framesList = []
numberOfBunniesList = []
numberOfWolvesList = []

fig, ax = plt.subplots()

with open('simData.txt','r') as file:
  
    # reading each line   
    for line in file:
        # reading each word
        index = 0;
        for word in line.split():
            
            
            if (index == 0):
                framesList.append(int(word))

            if (index == 1):
                numberOfBunniesList.append(int(word))

            if (index == 2):
                numberOfWolvesList.append(int(word))

            index = index + 1
            
plt.plot(numberOfBunniesList,'-b', label='Bunnies')
plt.plot(numberOfWolvesList, '-r', label='Wolves')

leg = ax.legend();

plt.show()

import sys

import numpy as np
import matplotlib.pyplot as plt

times=[sys.argv[1],sys.argv[2],sys.argv[3],sys.argv[4],sys.argv[5]]
divs=np.array([1,10,20,50,100])
plt.plot(divs,times)
plt.savefig("tiempos.pdf")
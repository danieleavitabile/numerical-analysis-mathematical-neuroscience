import numpy as np
import matplotlib.pyplot as plt
from scipy.io import loadmat

# Set path for input data (must be an absolute path)
dataPath = '/Users/daniele/GitHub/utrecht-css-mathneuro-masterclass/Data/Spots-Disk/'

# Load mesh
fileName = dataPath + 'mesh.mat'
mesh = loadmat(fileName)

# Extract mesh data
nodes = mesh['nodes']
elements = mesh['elements']

# Plot mesh
x, y, z = nodes[:, 0], nodes[:, 1], nodes[:, 2]

# Plot function
theta, rho = np.arctan2(y, x), np.sqrt(x**2 + y**2)
a, b, omega = 10, 0.05, 4
u = a * np.exp(-b * rho) * (b * np.cos(rho) + np.sin(rho)) * np.cos(omega * theta)

fig = plt.figure()
ax = fig.add_subplot(111, projection='3d')
fh = ax.plot_trisurf(x, y, elements-1, u, cmap='viridis')

ax.view_init(90, 0)
plt.axis('equal')
plt.colorbar(fh)
plt.show()


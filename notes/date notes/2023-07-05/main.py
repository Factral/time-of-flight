from Camera import Camera
import numpy as np
import matplotlib.pyplot as plt

if __name__ == "__main__":
    depth_img = np.load('../sample_data/yo_depth.npy') + 6

    freq = 15 * 1e6 # in MHz
    camera = Camera(freq)

    depth_simulated = camera.simulate(depth_img)

    fig, axs = plt.subplots(1, 3, sharex=True, sharey=True)
    #show colorbar for all images
    im0 = axs[0].imshow(depth_img)
    fig.colorbar(im0, ax=axs[0])
    im1 = axs[1].imshow(depth_simulated)
    fig.colorbar(im1, ax=axs[1])
    im2 = axs[2].imshow(depth_simulated - depth_img)
    fig.colorbar(im2, ax=axs[2])
    plt.show()
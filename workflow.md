# Workflow

## Preparation Phase

- Acquire true rgb and depth images with ipad
- Rescale depth image to match the resolution of the RGB image.
- build the dataset to asses our framework

## Reconstruction and Analysis Phase

- define spectral-material datasets
- Train/validate the network for spectral reconstruction with a given dataset
- understand mst++ in depth+
- Prepare/curate the material library with reference spectra. 
- train material segmentation (using depth and spectra)
- Optimize results

## Construction and Visualization Phase

- Merge the segmentation with depth data to generate the point cloud. (multishot)
- Develop or utilize tools to visualize the point cloud with overlaid classifications.

# Documentation

- Document the entire process, results, challenges, and solutions.

# Optional

- research and understand about coreML
- merge multishot images

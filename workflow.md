# Workflow

## Preparation Stage

- Acquire true rgb and depth images with ipad
    - Adapt the app to take png images with the intensity in meters (based on the video aplication)
    - Calibrate the shots, see what is the maximum depth, define the fov
    - Save the confidence map

- Rescale depth image to match the resolution of the RGB image.
    - Investigate existing methods and algorithms for rgb depth alignment.
    - Traditional methods vs deep learning methods
    - Define the best method for our case
    - Refine the algorithm for our case
    - Test in ipad ( optional )

- build the dataset to asses our framework
    - Specify the desired resolution, variety, and quantity of data.
    - Data Annotation and Labeling ( optional or if required )

## Reconstruction and Analysis Stage

- Prepare/curate the material library with reference spectra.
    - Define the structure of material classes
    - Define the number of materials
    - Specify the range of spectra for materials
    - Source Collection / Merge existing libraries

- Retrieve Spectra from images
    - Research existing methods to extract spectral information from RGB images. (MST++)
    - Recognize how depth data can provide additional context or improve the accuracy of spectral extraction.
    - Propose the method to use
    - Train/validate the network for spectral reconstruction with a given dataset

- Material Segmentation
    - Define the dataset
    - how to join with depth data
    - Understand the challenges and limitations associated with different approaches.
    - Propose the methgod to use
    - Train/validate the network for material segmentation

- Optimize results

## Construction and Visualization Stage

- Merge the segmentation with depth data to generate the point cloud. (multishot)
    - investigate methods (INR or others)
- Develop or utilize tools to visualize the point cloud with overlaid classifications.
    - investigate existing tools

# Documentation

- Document the entire process, results, challenges, and solutions.

# Optional

- research and understand about coreML
- merge multishot images

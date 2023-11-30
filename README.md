![blue-lines-png-7](https://user-images.githubusercontent.com/94915927/148304988-76a4f426-a045-402c-bebe-aec0dfccf02c.png)
# sL_QN_TR
> #### Stochastic Quasi-Newton Methods in a Trust Region Framework (MATLAB Implementation)


The repository "sL_QN_TR" contains programs of s-LBFGS-TR and s-LSR1-TR which are stochastic algorithms based on two well-known quasi-Newton updates, i.e., 
limited memory BFGS and limited memory SR1, in a Trust Region Framework. 
These algorithms, their performance in training deep neural networks in image classification, and their implementation points of algorithms from creating a network to training are described in the following paper: 

### Deep Neural Networks Training by Stochastic Quasi-Newton Trust-Region Methods 
**Mahsa Yousefi** and **Angeles Martinez Calomardo** 


[Read and Download the Paper.](https://www.researchgate.net/publication/374848670_Deep_Neural_Networks_Training_by_Stochastic_Quasi-Newton_Trust-Region_Methods)

Download the supplementary material of the paper for more numerical results.


### A MATLAB-based tutorial on implementing training loops for a deep neural network
**Mahsa Yousefi** and **Angeles Martinez Calomardo** 

This tutorial shows you how to define a convolutional neural network (CNN) and how to create and customize your own training loops. If you are a MATLAB user who would like to implement your own training algorithm for which the MATLAB built-in function does not exist, read this tutorial. 

[Read and Download the Tutorial.](https://www.researchgate.net/publication/360689841_A_MATLAB-based_tutorial_on_implementing_custom_loops_for_training_a_deep_neural_network)

![blue-lines-png-7](https://user-images.githubusercontent.com/94915927/148304988-76a4f426-a045-402c-bebe-aec0dfccf02c.png)
In this repository
* All programs have been written in MATLAB using the DL toolbox.
* There are four main programs:
  - sL_BFGS_TR.mlx
  - sL_SR1_TR.mlx
  - sL_BFGS_TR_noBN.mlx
  - sL_SR1_TR_noBN.mlx
* Every single program in ```.mlx``` format (live script of MATLAB) provides a step-by-step guideline for users. 
* **Architectures** with and without batch normalization (BN) layers:
  - *LeNet-like*, *ResNet-20* and *ConvNet3FC2* **without** BN layers are included in ```sL_BFGS_TR_noBN.mlx``` and ```sL_SR1_TR_noBN.mlx```  
  - *ResNet-20* and *ConvNet3FC2* **with** BN layers are considered in ```sL_BFGS_TR.mlx``` and ```sL_SR1_TR.mlx```. 
* The folder `Subroutines` includes required functions (```.m``` files) for running programs.
* The folder `Datasets` consists of three folders associated with standard benchmarks MNIST, Fashion-MNIST, and CIFAR10 with their own loading file.
* For executing, put together main programs  with all .m files and required files from `Subroutines` and `Datasets`, respectively.

![blue-lines-png-7](https://user-images.githubusercontent.com/94915927/148304988-76a4f426-a045-402c-bebe-aec0dfccf02c.png)
#### Please contact me if you have any questions, suggestions, requests, or bug-reports.
mahsa.yousefi@phd.units.it

![blue-lines-png-7](https://user-images.githubusercontent.com/94915927/148304988-76a4f426-a045-402c-bebe-aec0dfccf02c.png)
# sL_QN_TR
> #### Stochastic Quasi-Newton Methods in a Trust Region Framework (MATLAB Implementation)


The repository "sL_QN_TR" contains programs of s-LBFGS-TR and s-LSR1-TR which are stochastic algorithms based on two well-known quasi-Newton updates, i.e., 
limited memory BFGS and limited memory SR1, in a Trust Region Framework. 
These algorithms and their performance in training deep neural networks for image classification tasks are described in the following article: 

### Deep Neural Networks Training by Stochastic Quasi-Newton Trust-Region Methods 
**Mahsa Yousefi** and **Angeles Martinez Calomardo** 


[Download and Read the Paper.](https://www.researchgate.net/publication/374848670_Deep_Neural_Networks_Training_by_Stochastic_Quasi-Newton_Trust-Region_Methods)

Read the supplementary material of the paper for more numerical results.


### A MATLAB-based tutorial on implementing training loops for a deep neural network
**Mahsa Yousefi** and **Angeles Martinez Calomardo** 

This tutorial shows how to define a convolutional neural network (CNN) and how to create and customize your training loops. If you are a MATLAB user who would like to implement your training algorithm for which the MATLAB built-in function does not exist, read this tutorial. 

[Download and Read the Tutorial.](https://www.researchgate.net/publication/360689841_A_MATLAB-based_tutorial_on_implementing_custom_loops_for_training_a_deep_neural_network)

![blue-lines-png-7](https://user-images.githubusercontent.com/94915927/148304988-76a4f426-a045-402c-bebe-aec0dfccf02c.png)

In this repository,
* all programs have been written in MATLAB using the DL toolbox.
* there are four main programs as below:
  - ```sL_BFGS_TR.mlx```
  - ```sL_SR1_TR.mlx```
  - ```sL_BFGS_TR_noBN.mlx```
  - ```sL_SR1_TR_noBN.mlx```
* every single program in ```.mlx``` format (live script of MATLAB) provides a step-by-step guideline for users. 
* the folder `Subroutines` includes required functions (```.m``` files) for running programs.
* the folder `Datasets` consists of three folders associated with standard benchmarks MNIST, Fashion-MNIST, and CIFAR10 with their loading file.
* three considered main architectures with and without batch normalization layers are:
  - ```LeNet-like```
  - ```ResNet-20```
  - ```ConvNet3FC2```
* the networks *without* batch normalization layers are included in ```sL_BFGS_TR_noBN.mlx``` and ```sL_SR1_TR_noBN.mlx``` programs.   

**Remark:** For executing, put together main programs  with all .m files and required files from `Subroutines` and `Datasets`, respectively.

![blue-lines-png-7](https://user-images.githubusercontent.com/94915927/148304988-76a4f426-a045-402c-bebe-aec0dfccf02c.png)
#### Please contact me if you have any questions, suggestions, requests, or bug reports.
mahsa.yousefi@phd.units.it

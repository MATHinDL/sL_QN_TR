![blue-lines-png-7](https://user-images.githubusercontent.com/94915927/148304988-76a4f426-a045-402c-bebe-aec0dfccf02c.png)
# sL_QN_TR
> #### Stochastic Quasi-Newton Methods in a Trust Region Framework (MATLAB Implementation)


The repository "sL_QN_TR" contains programs of s-LBFGS-TR and s-LSR1-TR which are stochastic algorithms based on two well-known quasi-Newton updates, i.e., 
limited memory BFGS and limited memory SR1, in a Trust Region Framework. 
These algorithms, their performance to train deep neural networks in image classification and their implementation points of algorithms from creating a network to training are described in the following paper: 

### On the efficiency of Stochastic Quasi-Newton Methods for Deep Learning
**Mahsa Yousefi** and **Angeles Martinez Calomardo** 

[ Download ](https://github.com/MATHinDL/sL_QN_TR/files/8703140/Efficient_QN_for_DL.pdf) this paper.

### A MATLAB-based tutorial on implementing of training loops for a deep neural network
**Mahsa Yousefi** and **Angeles Martinez Calomardo** 

This tutorial can help you how to define a convolutional neural network (CNN) and how to create customize your own training loops. If you are a MATLAB user who would like to implement their own training algorithm for which MATLAB built-in functions do not exist, [read this tutorial](https://github.com/MATHinDL/sL_QN_TR). 

![blue-lines-png-7](https://user-images.githubusercontent.com/94915927/148304988-76a4f426-a045-402c-bebe-aec0dfccf02c.png)
In this repository
* All programs have been written in MATLAB using the DL toolbox.
* There are four main programs:
  - [sL_BFGS_TR.mlx](https://rawgit.com/MATHinDL/sL_QN_TR/main/HTML/sL_BFGS_TR.html)
  - [sL_SR1_TR.mlx](https://rawgit.com/MATHinDL/sL_QN_TR/main/HTML/sL_SR1_TR.html)
  - [sL_BFGS_TR_noBN](https://rawgit.com/MATHinDL/sL_QN_TR/main/HTML/sL_BFGS_TR_noBN.html)
  - [sL_SR1_TR_noBN.mlx](https://rawgit.com/MATHinDL/sL_QN_TR/main/HTML/sL_SR1_TR_noBN.html)
* Every single program in ```.mlx``` format (live script of MATLAB) provides a step-by-step guideline for users. 
* **Architectures** with and without batch normalization (BN) layers:
  - *LeNet-like*, *ResNet-20* and *ConvNet3FC2* **without** BN layers are included in ```sL_BFGS_TR_noBN.mlx``` and ```sL_SR1_TR_noBN.mlx```  
  - *ResNet-20* and *ConvNet3FC2* **with** BN layers are considered in ```sL_BFGS_TR.mlx``` and ```sL_SR1_TR.mlx```. 
* The folder `Subroutines` includes required functions (```.m``` files) for running programs.
* The folder `Datasets` consists three folders associated with standard benchmarks MNIST, Fashion-MNIST and CIFAR10 with their own loading file.
* The following file provides methods for producing figures to illusterate comparisions between sL_BFGS_TR and sL_SR1_TR:
  - [Build_Figure.mlx](https://rawgit.com/MATHinDL/sL_QN_TR/main/HTML/Build_Figures.html)
* To create figures for the example described in `Build Figure.mlx`, the values of loss, accuracy, and training time stored in the folder `Info` are required.
* For executing, put together main programs  with all .m files and required files from `Subroutines` and `Datasets`, respectively.

![blue-lines-png-7](https://user-images.githubusercontent.com/94915927/148304988-76a4f426-a045-402c-bebe-aec0dfccf02c.png)
#### Please contact us if you have any questions, suggestions, requests or bug-reports.
mahsa.yousefi@phd.units.it

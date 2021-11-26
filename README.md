# sL_QN_TR
> Stochastic Quasi-Newton Methods in a Trust Region Framework (Matlab Implementation)


The repository "sL_QN_TR" contains programs of s-LBFGS-TR and s-LSR1-TR which are stochastic algorithms based on two well-known quasi-Newton updates, i.e., 
limited memory BFGS and limited memory SR1, in a Trust Region Framework. 
These algorithms and their performance to train deep neural networks in image classification have been described in following paper. 

### DNNs Training by Stochastic Quasi-Newton Methods: an empirical study
#### Mahsa Yousefi and Angeles Martinez Calomardo 

* All programs have been written in Matlab (latest release) by using the DL toolbox.
* All implementation points of algorithms from creating a network to training are provided in this paper.
* The paper will be linked [_here_](https://github.com/MATHinDL/sL_QN_TR) soon.

In this repository
* There are four main programs as training algorithms named ```sL_BFGS_TR.m```, ```sL_SR1_TR.m```, ```sL_BFGS_TR_noBN.m ``` and ```sL_SR1_TR_noBN.m```. 
* Every single program has been written in ```.mlx``` format (live script of Matlab) so that it provides a step-by-step guideline for users. 
* LeNet-like, ResNet-20 and ConvNet3FC2 architectures without batch normalization layers are included in ```sL_BFGS_TR_noBN.m``` and ```sL_SR1_TR_noBN.m``` 
and ResNet-20 and ConvNet3FC2 architectures with batch normalization layers are considered in ``` sL_BFGS_TR.m ``` and ```sL_SR1_TR.m```.
* Users can choose one of architectures and make comment (`%`) others.
* The folder `Subroutines` includes required functions for running programs.
* The folder `Datasets` consists three folders associated with standard benchmarks MNIST, Fashion-MNIST and CIFAR10 with their own loading file. 
* Datasets are included in each program.
* Users can choose one of them and make comment (`%`) others.
* This file provides two diffrent methods for producing figures to illusterate comparisions between ```sL_BFGS_TR.m``` and ```sL_SR1_TR.m```. 
* To produce figures of an example described in `Build_Figure.mlx`, if needed, the folder `Info` includes histories of loss, accuracy and training time in `.mat` formats for each algorithm.
* To use these programs, put them together with all functions in `Subroutines` and all files/folders in a specific forder included in `Datasets`. 


#### Please contact us if you have any questions, suggestions, requests or bug-reports.
`mahsa.yousefi@phd.units.it`

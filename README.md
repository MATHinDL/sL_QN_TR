# sL_QN_TR
> **Stochastic Quasi-Newton Methods in a Trust Region Framework (MATLAB Implementation)**


The repository "sL_QN_TR" contains programs of s-LBFGS-TR and s-LSR1-TR which are stochastic algorithms based on two well-known quasi-Newton updates, i.e., 
limited memory BFGS and limited memory SR1, in a Trust Region Framework. 
These algorithms, their performance to train deep neural networks in image classification and their implementation points of algorithms from creating a network to training are described in the following paper. 

### DNNs Training by Stochastic Quasi-Newton Methods: an empirical study
#### Mahsa Yousefi and Angeles Martinez Calomardo 

_The paper will be linked [_here_](https://github.com/MATHinDL/sL_QN_TR) soon._

![blue-divider](https://user-images.githubusercontent.com/94915927/148303771-e4632de8-83a4-46d4-ad93-2973e9f2b801.png)

In this repository
* There are four main programs associated with training algorithms sL-BFGS-TR and sL-SR1-TR: 

     ```sL_BFGS_TR.mlx```, ```sL_SR1_TR.mlx```, ```sL_BFGS_TR_noBN.mlx ```,```sL_SR1_TR_noBN.mlx```
* All programs have been written in Matlab (latest release) by using the DL toolbox.
* Architectures of LeNet-like, ResNet-20 and ConvNet3FC2 without batch normalization layers are included in ```sL_BFGS_TR_noBN.mlx``` and ```sL_SR1_TR_noBN.mlx``` 
and those of ResNet-20 and ConvNet3FC2 architectures with batch normalization layers are considered in ```sL_BFGS_TR.mlx``` and ```sL_SR1_TR.mlx```. Users can choose one of architectures and make comment (`%`) others.
* Every single program has been written in ```.mlx``` format (live script of MATLAB) so that it provides a step-by-step guideline for users. 
* The folder `Subroutines` includes required functions for running programs.
* The folder `Datasets` consists three folders associated with standard benchmarks MNIST, Fashion-MNIST and CIFAR10 with their own loading file. All datasets are included in each program. Users can choose one of them and make comment (`%`) others.
* The file `Build_Figure.mlx` provides methods for producing figures to illusterate comparisions between sL_BFGS_TR and sL_SR1_TR. 
* To produce figures of an example described in `Build_Figure.mlx`, if needed, the folder `Info` includes histories of loss, accuracy and training time in `.mat` formats for each algorithm.
* To use programs, put them together with all functions in `Subroutines` and all files of the required dataset specified in `Datasets`.

#### Please contact us if you have any questions, suggestions, requests or bug-reports.
`mahsa.yousefi@phd.units.it`

# PCA_mnist

### Highlights:
- Given the MNIST dataset, Principal Component Analysis was performed on the images of each digit to visualize 
their principal modes of variation of the digits about the mean (by fitting a MultiVariate Gaussian) 
- Also, the number of principal eigenvalues were found to decide on the number of degrees of freedom on
images of each digit
- Attributed reasons to why the number of significant eigenvalues are far lesser than total, and also 
concluded behavioural patterns in writing digits based on the principal modes of variation.

Instructions to run code and interesting comments are given in the report.

### Detailed Problem Statement:

Multivariate Gaussian fitting for Principal Component Analysis.

Download the [dataset](http://yann.lecun.com/
exdb/mnist) comprising images of handwritten digits; this has been downloaded in the folder “data” and stored as “mnist.mat”.
Each image is stored as a matrix ( 28 × 28 ) of numbers. You can visualize these images (or
matrices) in MATLAB using the functions imagesc() or imshow(). 

**Constraint:** Cannot used the functions mean(), cov(), and pca() of MATLAB.

For every digit, from 0 to 9, compute:
1. the mean μ ,
2. the covariance matrix C , and
3. the first mode of variation determined by the eigenvector v 1 and the corresponding eigenvalue

λ 1 (where λ 1 is the largest of all eigenvalues) of the covariance matrix C 

*Note:* Before computing the mean and covariance matrix, convert each 28×28 pixel image matrix
to a 28^2 × 1 vector by concatenating its columns. To visualize the 28^2 × 1 mean vector, convert
it back to a matrix and then visualize it using imagesc(). Use the reshape() function to change
matrices to vectors and vice versa. The covariance matrix will be of size 28^2 × 28^2 .

• For each digit, I have sorted the 28^2 eigenvalues of the covariance matrix and have plotted them as
a graph. 

•  For each digit, I have showed the 3 images side by side: 
1. μ− λ 1 v 1,
2. μ, and
3. μ+ λ 1 v 1,
to show the principal mode of variation of the digits around their mean. 

All graphs are shown in result

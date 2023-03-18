# Problem-Sets
This problem set was completed by Kayla Stephenson. I worked by myself and consulted Professor Varner. This problem set implements a build function that builds a matrix and a right handside vector, solves for equations using Jacobi and Gauss-Seidel iterations, and solves for the error between the solutions for Case 1, 2, and 3, fulfilling all the tasks outlined in the README.md. Thank you.

$$
\begin{pmatrix}
1 & 0 & 0 & 0 \\
(\kappa{h} - 1) & 1 & 0 & 0 \\
0 & (\kappa{h} - 1) & 1 & 0 \\
0 & 0 & (\kappa{h} - 1) & 1
\end{pmatrix}
\begin{pmatrix}
C_{A,1} \\
C_{A,2} \\
C_{A,3} \\
C_{A,N}
\end{pmatrix} = 
\begin{pmatrix}
C_{A,0}\left(1-h\kappa\right) \\
0 \\
0\\
0 
\end{pmatrix}
$$
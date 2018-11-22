data {  
  int <lower=0> N; // Number of data points. 
  int <lower=0> F; // Number of features
  real y[N]; // Price
  matrix[N,F] x; // Feature values
}
parameters {
  real intercept;
  vector[F] theta;
  real sigma;
}
model {
  vector[N] y_mean;
  y_mean <- intercept + x*theta;
  y ~ normal(y_mean,sigma);
}

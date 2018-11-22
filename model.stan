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
transformed parameters{
  vector[N] y_mean;
  y_mean <- intercept + x*theta;
}
model {
  y ~ normal(y_mean,sigma);
}
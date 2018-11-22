data {  
  int <lower=0> N; // Number of data points. 
  int <lower=0> F; // Number of features
  real y[N]; // Price
  matrix[N,F] x;// Feature values
  matrix[1000,F] x_test; //Test feautures
}
parameters {
  real intercept;
  vector[F] theta;
  real sigma;
}
transformed parameters{
  vector[N] y_mean;
  y_mean = intercept + x*theta;
}
model {
  y ~ normal(y_mean,sigma);
}
generated quantities {
  real ypred[1000];
  vector[1000] y_predicted;
  for (i in 1:1000){
    y_predicted[i] = intercept + x_test[i]*theta;
    ypred[i] = normal_rng(y_predicted[i], sigma);
    }
}


data {
    int<lower=0> N; // number of data points
    int<lower=0> K; // number of groups
    int<lower=1,upper=K> x[N]; // group indicator
    vector[N] y; //
}
parameters {
    real[18] mu0;             // prior mean
    real[18]<lower=0> sigma0; // prior std
    real[K][18] mu;         // group means
    real<lower=0> sigma;  // common std
}
model {
  mu ~ normal(mu0, sigma0); // population prior with unknown parameters
  y ~ normal(mu[x,:]*y[x], sigma);
}
generated quantities{
  real ypred7;
  real mu7;
  mu7 = normal_rng(mu0, sigma0);
  ypred7 = normal_rng(mu7, sigma);
}
data {
  int N;
  array[N] int y;
}

parameters {
  real<lower=0> lambda;
  real<lower=0, upper=1> p;
}

model {
  lambda ~ gamma(4, 0.6);
  p ~ beta(2, 4);
  for(n in 1:N){
    // Poisson truncada en 14:
    real lpdf = poisson_lpmf(y[n] | lambda) - poisson_lcdf(14 | lambda);
    if(y[n] == 0){
      target += log_mix(p, 0, lpdf);
    } else {
      target += log(1-p) + lpdf;
    }
  }
}

generated quantities {

}

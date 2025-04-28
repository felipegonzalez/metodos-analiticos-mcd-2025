data {
  int N;
}

generated quantities {
  real<lower=0> lambda;
  real<lower=0, upper=1> p;
  array[N] int y;

  // Simular configuracion del modelo a partir de inicial
  lambda = gamma_rng(4, 0.6);
  p = beta_rng(2, 4);
  // Simular datos del modelo observacional
  for (n in 1:N){
    y[n] = 0;
    if(!bernoulli_rng(p)){
      y[n] = poisson_rng(lambda);
    }
  }
}

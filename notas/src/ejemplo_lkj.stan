
data{}
parameters {}
model {}
generated quantities {
  matrix[2,2] Omega_02;
  matrix[2,2] Omega_2;
  matrix[2,2] Omega_20;
  Omega_02 = lkj_corr_rng(2, 0.2);
  Omega_2 = lkj_corr_rng(2, 2);
  Omega_20 = lkj_corr_rng(2, 20);
}


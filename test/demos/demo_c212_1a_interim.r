library(c212)

set.seed(1)

data(c212.trial.interval.data1)
# Remove some rows to lower memory requirements

c212.trial.data <- c212.trial.interval.data1[ c212.trial.interval.data1$B %in% c("Bdy-sys_1", "Bdy-sys_2", "Bdy-sys_3", "Bdy-sys_4", "Bdy-sys_5"),]


print(head(c212.trial.data))

# 1. Fit the model:

mod.1a <- c212.1a.interim(c212.trial.data, nchains = 2)

# 2. Assess convergence
conv <- c212.convergence.diag(mod.1a)

# Printing a convergence summary will indicate if there are any obvious issues
# Any reported statistics that are greater than about 1.1 may indicate an issue.
c212.print.convergence.summary(conv)

print(max(conv$theta.conv.diag$stat))
# [1]  1.001372

# 3. If required calculate summary statistics (mean/median/hpi)
summ <- c212.summary.stats(mod.1a)
c212.print.summary.stats(summ)

# These may be accessed directly for model parameters:
print(head(summ$theta))
print(summ$theta[1,]$mean)
# [1] 0.1175958
hpi <- c(summ$theta[1,]$hpi_lower, summ$theta[1,]$hpi_upper)
print(hpi)
# [1] -0.1196092  0.3650302

# 4. Assuming the model have converged assess which AEs may be associated with treatment.
# The model paramter theta is used for this purpose.
theta.post.prob <- c212.ptheta(mod.1a)

# A large (posterior) probability that theta is > 0 is an indication that an adverse event is associated with treamtment.

print(theta.post.prob[ theta.post.prob$ptheta > 0.95,])

#       interval         B        AE    ptheta
# 19    0.0-180.0 Bdy-sys_3 Adv-Ev_19 1.0000000
# 20    0.0-180.0 Bdy-sys_3 Adv-Ev_20 1.0000000
# 21    0.0-180.0 Bdy-sys_3 Adv-Ev_21 1.0000000
# 22    0.0-180.0 Bdy-sys_3 Adv-Ev_22 1.0000000
# 23    0.0-180.0 Bdy-sys_3 Adv-Ev_23 1.0000000
# 24    0.0-180.0 Bdy-sys_3 Adv-Ev_24 1.0000000
# 25    0.0-180.0 Bdy-sys_3 Adv-Ev_25 1.0000000
# 51  180.0-360.0 Bdy-sys_1  Adv-Ev_8 0.9633167
# 61  180.0-360.0 Bdy-sys_3 Adv-Ev_19 0.9999667
# 63  180.0-360.0 Bdy-sys_3 Adv-Ev_21 1.0000000
# 64  180.0-360.0 Bdy-sys_3 Adv-Ev_22 0.9955333
# 66  180.0-360.0 Bdy-sys_3 Adv-Ev_24 0.9999167
# 67  180.0-360.0 Bdy-sys_3 Adv-Ev_25 0.9936667
# 70  180.0-360.0 Bdy-sys_4 Adv-Ev_28 0.9874667
# 75  180.0-360.0 Bdy-sys_4 Adv-Ev_33 0.9768333
# 135 540.0-720.0 Bdy-sys_1  Adv-Ev_8 0.9659167
# 159 540.0-720.0 Bdy-sys_4 Adv-Ev_33 0.9653667


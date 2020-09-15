library(c212)

set.seed(1)

data(c212.trial.data)

print(head(c212.trial.data))

# 1. Fit the model:

mod.BB <- c212.BB(c212.trial.data)

# 2. Assess convergence
conv <- c212.convergence.diag(mod.BB)

# Printing a convergence summary will indicate if there are any obvious issues
# Any reported statistics that are greater than about 1.1 may indicate an issue.
c212.print.convergence.summary(conv)

print(max(conv$theta.conv.diag$stat))
# [1] 1.01467

# 3. If required calculate summary statistics (mean/median/hpi)
summ <- c212.summary.stats(mod.BB)
c212.print.summary.stats(summ)

# These may be accessed directly for model parameters:
print(head(summ$theta))
print(summ$theta[1,]$mean)
# [1] 0.09922463
print(summ$theta[1,]$median)
# [1] 0
hpi <- c(summ$theta[1,]$hpi_lower, summ$theta[1,]$hpi_upper)
print(hpi)
# [1] -0.01720579  0.74839846

# 4. Assuming the model have converged assess which AEs may be associated with treatment.
# The model paramter theta is used for this purpose.
theta.post.prob <- c212.ptheta(mod.BB)

# A large (posterior) probability that theta is > 0 is an indication that an adverse event is associated with treamtment.

print(theta.post.prob[ theta.post.prob$ptheta > 0.80,])

#           B         AE    ptheta
#2  Bdy-sys_2   Adv-Ev_2 0.9423333
#3  Bdy-sys_2   Adv-Ev_3 0.8768833
#6  Bdy-sys_3   Adv-Ev_6 1.0000000
#7  Bdy-sys_3   Adv-Ev_7 1.0000000
#8  Bdy-sys_3   Adv-Ev_8 0.9999917
#9  Bdy-sys_3   Adv-Ev_9 0.9906583
#10 Bdy-sys_3 Adv-Ev_910 0.9998583
#11 Bdy-sys_3 Adv-Ev_911 0.9998083
#12 Bdy-sys_3 Adv-Ev_912 0.9967167


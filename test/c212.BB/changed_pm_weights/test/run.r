RNGkind(sample.kind="Rounding")
library(c212)

set.seed(4530)

trial_data <- read.table("../data/c212.trial.data.dat", header = T, as.is = T)

pm = c212.pointmass.weights(trial_data)
pm[pm$B == "Bdy-sys_3" & pm$AE == "Adv-Ev_6", ]$weight_pm = 0.999
pm[pm$B == "Bdy-sys_3" & pm$AE == "Adv-Ev_7", ]$weight_pm = 0.999
pm[pm$B == "Bdy-sys_3" & pm$AE == "Adv-Ev_8", ]$weight_pm = 0.999
pm[pm$B == "Bdy-sys_3" & pm$AE == "Adv-Ev_9", ]$weight_pm = 0.999

raw = c212.BB(trial_data, pm.weights = pm)
conv = c212.convergence.diag(raw)
theta.conv <- conv$theta.conv.diag
theta.acc <- conv$theta_acc

if (nrow(theta.conv[theta.conv$stat > 1.2,] > 0)) {
	print("Evidence of lack of convergence")

    sink("CONVERGENCE_ISSUE.dat")
    c212.print.convergence.summary(conv)
    sink()

}
if (nrow(theta.acc[theta.acc$rate < 0.1,] > 0)) {
	print("Very low acceptance rates")
}

pm[pm$B == "Bdy-sys_3" & pm$AE == "Adv-Ev_6", ]$weight_pm = 0.5
pm[pm$B == "Bdy-sys_3" & pm$AE == "Adv-Ev_7", ]$weight_pm = 0.5
pm[pm$B == "Bdy-sys_3" & pm$AE == "Adv-Ev_8", ]$weight_pm = 0.5
pm[pm$B == "Bdy-sys_3" & pm$AE == "Adv-Ev_9", ]$weight_pm = 0.5


set.seed(4530)
raw = c212.BB(trial_data, pm.weights = pm)
conv = c212.convergence.diag(raw)

sink("conv.dat")
c212.print.convergence.summary(conv)
sink()

summ = c212.summary.stats(raw)
sink("summary.dat")
c212.print.summary.stats(summ)
sink()


ptheta = c212.ptheta(raw)
write.table(ptheta, "ptheta.dat")

ptheta80 = ptheta[ptheta$ptheta > 0.80,]
write.table(ptheta80, "ptheta80.dat")

# RAISED RATES
z <- order(ptheta80$AE)
ptheta80 <- ptheta80[z,]

write.table(ptheta80[, c("B", "AE")], "RAISED_AES", row.names = FALSE, quote = FALSE)

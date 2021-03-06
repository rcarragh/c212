RNGkind(sample.kind="Rounding")
library(c212)

set.seed(10296)

trial_data <- read.table("../data/interim_trial_data.dat", header = T, as.is = T)

s.p = c212.sim.control.params("../data/interim_trial_data.dat", "BB")
s.p = s.p[s.p$type == "SLICE" & s.p$B == "Bdy-sys_3" & s.p$AE %in% c("Adv-Ev_20", "Adv-Ev_21", "Adv-Ev_22"), ]
s.p$value = 0.001
s.p$control = 1


raw = c212.BB.interim(trial_data, nchains = 2, hier = 2, lev = 0, sim.params = s.p)
conv = c212.convergence.diag(raw)
theta.conv <- conv$theta.conv.diag

if (nrow(theta.conv[ theta.conv$stat > 1.2,]) > 0) {
	print("Evidence of lack of convergence")

	sink("CONVERGENCE_ISSUE.dat")
	c212.print.convergence.summary(conv)
	sink()

	s.p$value = 1
	s.p$control = 7

}

set.seed(13312)
raw = c212.BB.interim(trial_data, nchains = 2, hier = 2, lev = 1, sim.params = s.p)
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

write.table(ptheta80[, c("interval", "B", "AE")], "RAISED_AES", row.names = FALSE, quote = FALSE)

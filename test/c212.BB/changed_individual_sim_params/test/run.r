RNGkind(sample.kind="Rounding")
library(c212)

set.seed(26181)

trial_data <- read.table("../data/c212.trial.data.dat", header = T, as.is = T)

s.p <- c212.sim.control.params("../data/c212.trial.data.dat", "BB")

s.p <- s.p[ s.p$B == "Bdy-sys_3", ]
s.p$value = 0.0001
s.p$control = 1

raw = c212.BB(trial_data, sim.params = s.p)

conv = c212.convergence.diag(raw)
theta.conv <- conv$theta.conv.diag
if (nrow(theta.conv[ theta.conv$stat > 1.2,]) > 0) {
	print("Evidence of lack of convergence")

	sink("CONVERGENCE_ISSUE.dat")
	c212.print.convergence.summary(conv)
	sink()


	s.p[ s.p$param == "w_gamma",]$value = .9
	s.p[ s.p$param == "w_gamma",]$control = 5
	s.p[ s.p$param == "sigma_MH_theta", ]$value = 0.25
}


set.seed(26181)
raw = c212.BB(trial_data, sim.params = s.p)
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


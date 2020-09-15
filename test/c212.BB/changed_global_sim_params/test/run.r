RNGkind(sample.kind="Rounding")
library(c212)

set.seed(24633)

trial_data <- read.table("../data/c212.trial.data.dat", header = T, as.is = T)

g.s.p <- c212.global.sim.params(trial_data, "BB")
g.s.p[ g.s.p$param == "w_alpha",]$value = 0.001
g.s.p[ g.s.p$param == "w_beta",]$value = 0.001
g.s.p[ g.s.p$param == "w_gamma",]$value = 0.001
g.s.p[ g.s.p$param == "w_alpha",]$control = 1
g.s.p[ g.s.p$param == "w_beta",]$control = 1
g.s.p[ g.s.p$param == "w_gamma",]$control = 1

raw = c212.BB(trial_data, global.sim.params = g.s.p)
conv = c212.convergence.diag(raw)

theta.conv <- conv$theta.conv.diag

if (nrow(theta.conv[theta.conv$stat > 1.2,]) > 0) {
	print("Evidence of lack of convergence")

	sink("CONVERGENCE_ISSUE.dat")
	c212.print.convergence.summary(conv)
	sink()

	g.s.p[ g.s.p$param == "w_alpha",]$value = 1.5
	g.s.p[ g.s.p$param == "w_beta",]$value = 1.5
	g.s.p[ g.s.p$param == "w_gamma",]$value = 1.5
	g.s.p[ g.s.p$param == "w_alpha",]$control = 6
	g.s.p[ g.s.p$param == "w_beta",]$control = 6
	g.s.p[ g.s.p$param == "w_gamma",]$control = 6
}

set.seed(24633)

raw = c212.BB(trial_data, global.sim.params = g.s.p)
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

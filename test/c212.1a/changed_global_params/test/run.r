RNGkind(sample.kind="Rounding")
library(c212)

set.seed(6978)

trial_data <- read.table("../data/c212.trial.data.dat", header = T, as.is = T)

g.s.p <- c212.global.sim.params(trial_data, "1a")
g.s.p[ g.s.p$param == "w",]$value = 0.001
g.s.p[ g.s.p$param == "w",]$control = 1

raw = c212.1a(trial_data, global.sim.params= g.s.p)
conv = c212.convergence.diag(raw)

theta.conv <- conv$theta.conv.diag

if (nrow(theta.conv[theta.conv$stat > 1.2,])) {
	print("Evidence of lack of convergence")

	sink("CONVERGENCE_ISSUE.dat")
	c212.print.convergence.summary(conv)
	sink()

	g.s.p[ g.s.p$param == "w",]$value = 1
	g.s.p[ g.s.p$param == "w",]$control = 6
}

set.seed(6978)
raw = c212.1a(trial_data, global.sim.params= g.s.p)
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

ptheta95 = ptheta[ptheta$ptheta > 0.95,]
write.table(ptheta95, "ptheta95.dat")

# RAISED RATES
z <- order(ptheta95$AE)
ptheta95 <- ptheta95[z,]

write.table(ptheta95[, c("B", "AE")], "RAISED_AES", row.names = FALSE, quote = FALSE)

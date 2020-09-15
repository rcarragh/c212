RNGkind(sample.kind="Rounding")
library(c212)

set.seed(29488)

trial_data <- read.table("../data/c212.trial.data.dat", header = T, as.is = T)

raw = c212.1a(trial_data, nchains = 1)
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

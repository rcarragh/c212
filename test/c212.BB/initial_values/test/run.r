RNGkind(sample.kind="Rounding")
library(c212)

set.seed(4530)

trial_data <- read.table("../data/c212.trial.data.dat", header = T, as.is = T)

gen.init <- c212.gen.initial.values(trial_data,  nchains = 3, model = "BB")
gen.init$beta.pi.0[1] <- 1.4

raw = c212.BB(trial_data, initial_values = gen.init)
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

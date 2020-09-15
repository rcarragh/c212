RNGkind(sample.kind="Rounding")
library(c212)

set.seed(20463)

trial_data <- read.table("../data/c212.trial.data.dat", header = T, as.is = T)

gen.init <- c212.gen.initial.values(trial_data,  nchains = 3, model = "1a")
gen.init$mu.theta.0[1] <- 9.00
gen.init$mu.gamma.0[1] <- 9.00

raw = c212.1a(trial_data, initial_values = gen.init)
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

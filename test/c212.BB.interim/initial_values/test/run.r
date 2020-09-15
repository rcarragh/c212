RNGkind(sample.kind="Rounding")
library(c212)

set.seed(563)

trial_data <- read.table("../data/interim_trial_data.dat", header = T, as.is = T)

gen.init <- c212.gen.initial.values("../data/interim_trial_data.dat", level = 1, hier = 3, model = "BB", nchains = 2)
#gen.init$mu.gamma.0[1:2,]$value = -1000
#gen.init$mu.gamma.0[3:4,]$value = 1000
gen.init$mu.gamma.0 <- c(-1000, 1000)

raw = c212.BB.interim(trial_data, nchains = 2, hier = 3, level = 1, initial_values = gen.init)
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

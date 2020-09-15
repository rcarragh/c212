library(c212)
data(c212.FDR.data)

noadj <- c212.err.cntrl(c212.FDR.data, method = "NOADJ")
write.table(x = noadj, file = "noadj.dat")
noadj.10 <- c212.err.cntrl(c212.FDR.data, .1, "NOADJ")
write.table(x = noadj.10, file = "noadj.10.dat")

bonf <- c212.err.cntrl(c212.FDR.data, method = "BONF")
write.table(x = bonf, file = "bonf.dat")
bonf.10 <- c212.err.cntrl(c212.FDR.data, .1, "BONF")
write.table(x = bonf.10, file = "bonf.10.dat")

bh <- c212.err.cntrl(c212.FDR.data, method = "BH")
write.table(x = bh, file = "bh.dat")
bh.10 <- c212.err.cntrl(c212.FDR.data, .1, "BH")
write.table(x = bh.10, file = "bh.10.dat")

gbh <- c212.err.cntrl(c212.FDR.data, method = "GBH")
write.table(x = gbh, file = "gbh.dat")
gbh.10 <- c212.err.cntrl(c212.FDR.data, alpha = .1, method = "GBH")
write.table(x = gbh.10, file = "gbh.10.dat")

dfdr <- c212.err.cntrl(c212.FDR.data, method = "DFDR")
write.table(x = dfdr, file = "dfdr.dat")
dfdr.10 <- c212.err.cntrl(c212.FDR.data, .1, "DFDR")
write.table(x = dfdr.10, file = "dfdr.10.dat")

ssbh <- c212.err.cntrl(c212.FDR.data, method = "ssBH")
write.table(x = ssbh, file = "ssbh.dat")
ssbh.10 <- c212.err.cntrl(c212.FDR.data, .1, "ssBH")
write.table(x = ssbh.10, file = "ssbh.10.dat")

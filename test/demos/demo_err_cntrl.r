library(c212)
data(c212.FDR.data)

print("Demo example: c212.err.cntrl - DFDR at the 10% level")

print(head(c212.FDR.data))

dfdr.sig <- c212.err.cntrl(c212.FDR.data, method = "DFDR", alpha = 0.1)
print("Hypothese deemed significant by the DFDR:")
print(dfdr.sig)

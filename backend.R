#read in HEK data

require("xlsx")
policy.sim = read.csv("totalportfolio.csv")
w.policy = read.csv("policyallocation.csv",header = F)
GPE.sim = read.csv("GlobalPublicEquity.csv")
Cash.sim = read.csv("Cash.csv")
CFI.sim = read.csv("CoreFixedIncome.csv")
HY.sim = read.csv("HighYield.csv")
GFI.uh.sim = read.csv("IntlBonds (Unhedged).csv")
GFI.h.sim = read.csv("IntlBonds (Hedged).csv")
EMD.hard = read.csv("EMD Hard.csv")
SD.gov = read.csv("SD Gov.csv")
SD.cred = read.csv("SD Cred.csv")
EMD.local = read.csv("EMD Local.csv")
RE = read.csv("Broad RE.csv")
Commod = read.csv("Commodities.csv")
PE = read.csv("PE.csv")
LevLoans = read.csv("BankLoans.csv")
HF = read.csv("Broad HF.csv")

# read in GRS payments
pmts.dt = read.csv("GRSnetpmts.csv")
pmts = as.matrix(pmts.dt[,2])
rownames(pmts) = pmts.dt[,1]
pmts = t(pmts)

#read in GRS Liabilities
liab.dt = read.csv("GRSliab.csv")
liab = as.matrix(liab.dt[,2])
rownames(liab) = liab.dt[,1]
liab = t(liab)

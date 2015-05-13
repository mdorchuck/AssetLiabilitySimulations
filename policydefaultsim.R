NAV.start = 29500000000
sim.total = policy.sim
nsim = nrow(sim.total)
nyear = ncol(sim.total)

sim = array(data = NAV.start,dim = c(nsim,nyear+1))
#do sim
for (i in 1:nyear) {sim[,(i+1)] = (sim[,i] -pmts[,i])  * (1 + sim.total[,i]) }
# convet to millions
sim = sim/1000000

matplot(t(sim), type = 'l', las = 1, xlab = 'Years', ylab = 'Millions', ylim = c(0,50000000) ,
        main = 'Projected Value of SCRS Assets')

#make fund ratio chart
liab.mt = matrix(liab,nrow = nsim, ncol = nyear, byrow =TRUE)/1000000
fund.ratio  = array(dim = c(nsim,nyear))
for (i in 1:nyear) {fund.ratio[,i] = sim[,(i+1)]/liab.mt[,i]}



fund.ratio.med = array(dim = c(1,nyear))
for (i in 1:nyear) fund.ratio.med[,i] = median(fund.ratio[,i])
matplot(t(fund.ratio.med), type = 'l', las = 1, xlab = 'Years', ylab = 'Funding Ratio' ,
        main = 'Projected Funding Ratio of SCRS')
median(fund.ratio[,10])
# 10 year outcome density
d10 = density(fund.ratio[,10])
plot(d10, main="Funding Ratio Simulated Outcomes in 10 years")

fund.ratio.fully = fund.ratio
fund.ratio.fully[fund.ratio.fully > 1] = NA
fund.ratio.fully[fund.ratio.fully < 0] = NA
matplot(t(fund.ratio.fully), type = 'l', las = 1, xlab = 'Years', ylab = 'Funding Ratio' ,
        main = 'Simulated Funding Ratio of SCRS and PORS')
broke = fund.ratio
broke[broke <0] = "broke"
sum(broke[,30]=="broke")/nsim
sum(broke[,10]=="broke")/nsim
full = fund.ratio
full[full >1] = "funded"
sum(full[,30]=="funded")/nsim
sum(full[,10]=="funded")/nsim
prob.broke = array(dim = c(1,nyear))
for (i in 1:nyear) {prob.broke[,i] = (sum(broke[,i]=="broke")/nsim)}
matplot(t(prob.broke), type = 'l', las =1, xlab = "Year", ylab = "Probability of Exhausting Assets",
        main = "Simulated Probabilities of Exhasting SCRS Assets")
prob.full = array(dim = c(1,nyear))
for (i in 1:nyear) {prob.full[,i] = (sum(full[,i]=="funded")/nsim)}
matplot(t(prob.full), type = 'l', las =1, xlab = "Year", ylab = "Probability of Fully Funded Status",
        main = "Simulated Probabilities of SCRS Assets exceeding Acrrued Liabilities")

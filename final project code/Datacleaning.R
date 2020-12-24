
library(haven)
cepsw2studentCN<- read_stata("cepsw2studentCN.dta")
cepsw2principalCN<- read_stata("cepsw2principalCN.dta")
cepsw2parentCN<- read_stata("cepsw2parentCN.dta")
cepsw1student<- read_stata("CEPS基线调查学生数据.dta")
m1 <- merge(cepsw2studentCN, cepsw2parentCN, by.x = "ids", by.y = "ids")
colnames(m1)
m2 <- merge(m1, cepsw2principalCN, by.x = "schids.x", by.y = "schids")
colnames(m2)
colnames(cepsw1student)
m3 <- merge(m2, cepsw1student[,c(1,288)], by.x="ids", by.y = "ids" )
colnames(m3)
write.csv(m3,file="/Users/liuj/desktop/3in1.csv",quote=F,row.names = F)            

data=read.csv("/Users/liuj/desktop/3in1.csv")
data1<-subset(data,data$w2cogscore>0&data$w2a02>0)
data1 <- subset(data1, select = -c(w2chn,w2upchn,w2mat
                                   ,w2upmat,w2eng,w2upeng))
data1$w2a0601[is.na(data1$w2a0601)] <- 0
data1$w2a0602[is.na(data1$w2a0602)] <- 0
data1$w2a0603[is.na(data1$w2a0603)] <- 0
data1$w2a0604[is.na(data1$w2a0604)] <- 0
data1[,c("w2a0701","w2a0702","w2a0703","w2a0704","w2a0705","w2a0706","w2a0707"
         ,"w2a0708")][is.na(data1[,c("w2a0701",
                                     "w2a0702","w2a0703","w2a0704","w2a0705","w2a0706",
                                     "w2a0707","w2a0708")])] <- 0
data1[,c("w2a0801","w2a0801a","w2a0802","w2a0802a","w2a0802b","w2a0802c01","w2a0802c02","w2a0802c03","w2a0803","w2a0803a","w2a0804","w2a0804a")][is.na(data1[,c("w2a0801","w2a0801a","w2a0802","w2a0802a","w2a0802b","w2a0802c01","w2a0802c02","w2a0802c03","w2a0803","w2a0803a","w2a0804","w2a0804a")])] <- 0
data1[,c("w2b1100","w2b1101","w2b1102","w2b1103","w2b1104","w2b1105","w2b1106","w2b1107","w2b1108","w2b1109","w2b1110","w2b1111")][is.na(data1[,c("w2b1100","w2b1101","w2b1102","w2b1103","w2b1104","w2b1105","w2b1106","w2b1107","w2b1108","w2b1109","w2b1110","w2b1111")])] <- 0
data1[,c("w2b1201","w2b1202","w2b1203","w2b1204","w2b1205","w2b1206","w2b1207")][is.na(data1[,c("w2b1201","w2b1202","w2b1203","w2b1204","w2b1205","w2b1206","w2b1207")])] <- 0
data1[,c("w2b1300","w2b1301","w2b1302","w2b1303","w2b1304","w2b1305")][is.na(data1[,c("w2b1300","w2b1301","w2b1302","w2b1303","w2b1304","w2b1305")])] <- 0
data1[,c("w2b1401","w2b1402","w2b1403","w2b1404","w2b1405","w2b1406")][is.na(data1[,c("w2b1401","w2b1402","w2b1403","w2b1404","w2b1405","w2b1406")])] <- 0
data1[,c("w2d10b01","w2d10c01","w2d10d01","w2d10e01","w2d10b02","w2d10c02","w2d10d02","w2d10e02")][is.na(data1[,c("w2d10b01","w2d10c01","w2d10d01","w2d10e01","w2d10b02","w2d10c02","w2d10d02","w2d10e02")])] <- 0
data1[,c("w2d10b03","w2d10c03","w2d10d03","w2d10e03","w2d10b04","w2d10c04","w2d10d04","w2d10e04")][is.na(data1[,c("w2d10b03","w2d10c03","w2d10d03","w2d10e03","w2d10b04","w2d10c04","w2d10d04","w2d10e04")])] <- 0
data1[,c("w2d10b05","w2d10c05","w2d10d05","w2d10e05")][is.na(data1[,c("w2d10b05","w2d10c05","w2d10d05","w2d10e05")])] <- 0

#p
data1[,c("w2ba0201","w2ba0202","w2ba0203","w2ba0204","w2ba0205","w2ba0206","w2ba0207","w2ba0208")][is.na(data1[,c("w2ba0201","w2ba0202","w2ba0203","w2ba0204","w2ba0205","w2ba0206","w2ba0207","w2ba0208")])] <- 0
data1[,c("w2ba09a","w2ba10a")][is.na(data1[,c("w2ba09a","w2ba10a")])] <- 0
data1[,c("w2ba1400","w2ba1401","w2ba1401a","w2ba1402","w2ba1402a","w2ba1403","w2ba1403a","w2ba1404","w2ba1404a","w2ba1405","w2ba1405a")][is.na(data1[,c("w2ba1400","w2ba1401","w2ba1401a","w2ba1402","w2ba1402a","w2ba1403","w2ba1403a","w2ba1404","w2ba1404a","w2ba1405","w2ba1405a")])] <- 0
data1[,c("w2ba1500","w2ba1501","w2ba1501a","w2ba1502","w2ba1502a","w2ba1503","w2ba1503a","w2ba1504","w2ba1504a","w2ba1505","w2ba1505a")][is.na(data1[,c("w2ba1500","w2ba1501","w2ba1501a","w2ba1502","w2ba1502a","w2ba1503","w2ba1503a","w2ba1504","w2ba1504a","w2ba1505","w2ba1505a")])] <- 0
data1[,c("w2ba1600","w2ba1601","w2ba1601a","w2ba1602","w2ba1602a","w2ba1603","w2ba1603a","w2ba1604","w2ba1604a","w2ba1605","w2ba1605a")][is.na(data1[,c("w2ba1600","w2ba1601","w2ba1601a","w2ba1602","w2ba1602a","w2ba1603","w2ba1603a","w2ba1604","w2ba1604a","w2ba1605","w2ba1605a")])] <- 0
data1[,c("w2ba24","w2ba25")][is.na(data1[,c("w2ba24","w2ba25")])] <- 0
data1[,c("w2bb0300","w2bb0301","w2bb0302","w2bb0303","w2bb0304","w2bb0305","w2bb0306")][is.na(data1[,c("w2bb0300","w2bb0301","w2bb0302","w2bb0303","w2bb0304","w2bb0305","w2bb0306")])] <- 0
data1[,c("w2bb0500","w2bb0501","w2bb0502","w2bb0503","w2bb0504","w2bb0505","w2bb0506")][is.na(data1[,c("w2bb0500","w2bb0501","w2bb0502","w2bb0503","w2bb0504","w2bb0505","w2bb0506")])] <- 0
data1[,c("w2bb1401","w2bb1402","w2bb1403","w2bb1404","w2bb1405","w2bb1406","w2bb1407")][is.na(data1[,c("w2bb1401","w2bb1402","w2bb1403","w2bb1404","w2bb1405","w2bb1406","w2bb1407")])] <- 0
data1[,c("w2bc0201","w2bc0202","w2bc0203","w2bc0203a","w2bc0204","w2bc0205")][is.na(data1[,c("w2bc0201","w2bc0202","w2bc0203","w2bc0203a","w2bc0204","w2bc0205")])] <- 0
data1[,c("w2bc07","w2bc0800","w2bc0801","w2bc0802","w2bc0803","w2bc0804","w2bc0805","w2bc0806","w2bc0807","w2bc0808","w2bc0809","w2bc09")][is.na(data1[,c("w2bc07","w2bc0800","w2bc0801","w2bc0802","w2bc0803","w2bc0804","w2bc0805","w2bc0806","w2bc0807","w2bc0808","w2bc0809","w2bc09")])] <- 10
data1[,c("w2bd1100","w2bd1101","w2bd1102","w2bd1103","w2bd1104","w2bd1105","w2bd1106","w2bd1107","w2bd1108")][is.na(data1[,c("w2bd1100","w2bd1101","w2bd1102","w2bd1103","w2bd1104","w2bd1105","w2bd1106","w2bd1107","w2bd1108")])] <- 0
data1[,c("w2bd1201","w2bd1201a","w2bd1202","w2bd1203","w2bd1204","w2bd1205","w2bd1206","w2bd1207","w2bd1208")][is.na(data1[,c("w2bd1201","w2bd1201a","w2bd1202","w2bd1203","w2bd1204","w2bd1205","w2bd1206","w2bd1207","w2bd1208")])] <- 0
data1 <- subset(data1, select = -c(w2be19,w2be19,w2be20
                                   ,w2be21,w2be22))
data1[,c("w2be3701","w2be3702","w2be3703","w2be3704")][is.na(data1[,c("w2be3701","w2be3702","w2be3703","w2be3704")])] <- 0
data1[,c("w2pla01a","w2pla01b")][is.na(data1[,c("w2pla01a","w2pla01b")])] <- 0
data1[,c("w2pla2101","w2pla2102","w2pla2103","w2pla2104","w2pla2105","w2pla2106","w2pla2107")][is.na(data1[,c("w2pla2101","w2pla2102","w2pla2103","w2pla2104","w2pla2105","w2pla2106","w2pla2107")])] <- 0
data1[,c("w2plc1101","w2plc1102","w2plc1103","w2plc1104","w2plc1105")][is.na(data1[,c("w2plc1101","w2plc1102","w2plc1103","w2plc1104","w2plc1105")])] <- 0
data1[,c("w2pld0200","w2pld0201","w2pld0202","w2pld0203","w2pld0204","w2pld0205","w2pld0206","w2pld0207","w2pld0208","w2pld0209")][is.na(data1[,c("w2pld0200","w2pld0201","w2pld0202","w2pld0203","w2pld0204","w2pld0205","w2pld0206","w2pld0207","w2pld0208","w2pld0209")])] <- 0
data1[,c("w2pld0301","w2pld0302","w2pld0303","w2pld0304","w2pld0305","w2pld0306")][is.na(data1[,c("w2pld0301","w2pld0302","w2pld0303","w2pld0304","w2pld0305","w2pld0306")])] <- 0
data1[,c("w2pld0401","w2pld0402","w2pld0403","w2pld0404","w2pld0405","w2pld0406")][is.na(data1[,c("w2pld0401","w2pld0402","w2pld0403","w2pld0404","w2pld0405","w2pld0406")])] <- 0
data1[,c("w2ple0800","w2ple0801","w2ple0802","w2ple0803","w2ple0804")][is.na(data1[,c("w2ple0800","w2ple0801","w2ple0802","w2ple0803","w2ple0804")])] <- 0
data1 <- subset(data1, select = -c(w2ple06a1,w2ple06a2,w2ple06b1
                                   ,w2ple06b2))
data1[,c("w2ple07")][is.na(data1[,c("w2ple07")])] <- 0
data1[,c("w2ple14","w2ple1501","w2ple1502","w2ple1503","w2ple1504")][is.na(data1[,c("w2ple14","w2ple1501","w2ple1502","w2ple1503","w2ple1504")])] <- 0
data1[,c("w2ple17")][is.na(data1[,c("w2ple17")])] <- 0
data1[,c("w2ple1801","w2ple1802","w2ple1803","w2ple1804","w2ple1805","w2ple1900","w2ple1901","w2ple1902","w2ple1903")][is.na(data1[,c("w2ple1801","w2ple1802","w2ple1803","w2ple1804","w2ple1805","w2ple1900","w2ple1901","w2ple1902","w2ple1903")])] <- 0
data1[,c("w2ple2300","w2ple2301","w2ple2302","w2ple2303")][is.na(data1[,c("w2ple2300","w2ple2301","w2ple2302","w2ple2303")])] <- 0
data1[,c("w2ple2501","w2ple2502","w2ple2503","w2ple2504","w2ple2505","w2ple2506","w2ple2507")][is.na(data1[,c("w2ple2501","w2ple2502","w2ple2503","w2ple2504","w2ple2505","w2ple2506","w2ple2507")])] <- 0
data1[,c("w2ple2601","w2ple2602","w2ple2603","w2ple2604","w2ple2605","w2ple2606","w2ple2607")][is.na(data1[,c("w2ple2601","w2ple2602","w2ple2603","w2ple2604","w2ple2605","w2ple2606","w2ple2607")])] <- 0
data1[,c("w2ple2701","w2ple2702","w2ple2703","w2ple2704","w2ple2705","w2ple2706")][is.na(data1[,c("w2ple2701","w2ple2702","w2ple2703","w2ple2704","w2ple2705","w2ple2706")])] <- 0
data1[,c("w2plf1401","w2plf1402","w2plf1403","w2plf1404","w2plf1405","w2plf1406","w2plf1407")][is.na(data1[,c("w2plf1401","w2plf1402","w2plf1403","w2plf1404","w2plf1405","w2plf1406","w2plf1407")])] <- 0
data1[,c("w2plf1501","w2plf1502","w2plf1503","w2plf1504","w2plf1505","w2plf1506","w2plf1507")][is.na(data1[,c("w2plf1501","w2plf1502","w2plf1503","w2plf1504","w2plf1505","w2plf1506","w2plf1507")])] <- 0
data1[,c("w2plf1601","w2plf1602","w2plf1603","w2plf1604","w2plf1605")][is.na(data1[,c("w2plf1601","w2plf1602","w2plf1603","w2plf1604","w2plf1605")])] <- 0

data1 <- subset(data1, select = -c(ids,schids.x,w2clsids.x
                                   ,clsids.x,ctyids.x,w2frame,w2subsample,
                                   clsids.y, w1w2sweight,w2status,w2mtype,
                                   w2sweight,w2fall.x,w2mreason,
                                   w2clsra,
                                   w2coglmh,
                                   w2cogtype,
                                   w2cog3pl,
                                   w2clsids.y,
                                   schids.y,
                                   ctyids.y, w2fall.y,w2ba01, ctyids, w2pla01b,w2plf01,w2plf02,st0))


data1[,c("w2c0701b","w2c0701c","w2c0702b","w2c0702c","w2c0703b","w2c0703c","w2c0704b","w2c0704c","w2c0705b","w2c0705c","w2c0706b","w2c0706c")][is.na(data1[,c("w2c0701b","w2c0701c","w2c0702b","w2c0702c","w2c0703b","w2c0703c","w2c0704b","w2c0704c","w2c0705b","w2c0705c","w2c0706b","w2c0706c")])] <- 0
data1[,c("w2c09a","w2c09b")][is.na(data1[,c("w2c09a","w2c09b")])] <- 0

data1[,c("w2c11a","w2c12")][is.na(data1[,c("w2c11a","w2c12")])] <- 0

data1 <- subset(data1, select = -c(w2c14a,
                                   w2c14b))
data1[,c("w2c17a")][is.na(data1[,c("w2c17a")])] <- 0
data1 <- subset(data1, select = -c(w2c18b))
data1 <- subset(data1, select = -c(w2c22a,w2c22b))
data1 <- subset(data1, select = -c(w2bc01a,
                                   w2bc01b,
                                   w2bc01c,
                                   w2bc01d,
                                   w2bc01e,
                                   w2bc01f,
                                   w2bc01g,
                                   w2bc01h,
                                   w2bc01i,
                                   w2bc01j))
data1 <- subset(data1, select = -c(w2bd03,w2bd04))
data1 <- subset(data1, select = -c(w2bd0601a,
                                   w2bd0601b,
                                   w2bd0601c,
                                   w2bd0602a,
                                   w2bd0602b,
                                   w2bd0602c,
                                   w2bd0603a,
                                   w2bd0603b,
                                   w2bd0603c,
                                   w2bd0604a,
                                   w2bd0604b,
                                   w2bd0604c,
                                   w2bd0605a,
                                   w2bd0605b,
                                   w2bd0605c,
                                   w2bd0606a,
                                   w2bd0606b,
                                   w2bd0606c))
data1[,c("w2bd09a","w2bd09b","w2bd10")][is.na(data1[,c("w2bd09a","w2bd09b","w2bd10")])] <- 0

data1 <- subset(data1, select = -c(w2be01,w2be05,w2be10,w2be14,w2plc0403b,w2plc0601,w2plc0602,w2ple13,w2ple17,w2plf08a))
data1 <- subset(data1, select = -c(w2ple2901a,w2ple2901b,w2ple2901c,w2ple2902a,w2ple2902b,w2ple2902c,w2ple2903a,w2ple2903b,w2ple2903c,w2ple2904a,w2ple2904b,w2ple2904c,w2ple2905a,w2ple2905b,w2ple2905c))
data1[,c('w2be09','w2be07','w2be16','w2be17',"w2be35",'w2be36','w2be26',"w2plc12a","w2plc13a","w2plf09a")][is.na(data1[,c('w2be09','w2be07','w2be16','w2be17',"w2be35",'w2be36','w2be26',"w2plc12a","w2plc13a","w2plf09a")])] <- 0


data1[,c("w2ba22",'w2bb15','w2bb16','w2bb17','w2bb18','w2bb19','w2bb20')][is.na(data1[,c("w2ba22",'w2bb15','w2bb16','w2bb17','w2bb18','w2bb19','w2bb20')])] <- 0
data1[,c('w2bc03','w2bc04','w2bc05','w2bc06')][is.na(data1[,c('w2bc03','w2bc04','w2bc05','w2bc06')])] <- 0
data1[,c('w2plb0701','w2plb0702','w2plb0703','w2plb0801','w2plb0802','w2plb0803')][is.na(data1[,c('w2plb0701','w2plb0702','w2plb0703','w2plb0801','w2plb0802','w2plb0803')])] <- 0
data1[,c(449:772)][is.na(data1[,c(449:772)])] <- 0
data1 <- subset(data1, select = -c(w2bd05a,w2bd05b))
data1[,c('w2c10','w2a2101a','w2a2101b','w2a2102a','w2a2102b','w2a2103a','w2a2103b','w2a2104a')][is.na(data1[,c('w2c10','w2a2101a','w2a2101b','w2a2102a','w2a2102b','w2a2103a','w2a2103b','w2a2104a')])] <- 0

data1 <- subset(data1, select = -c(w2c08a,w2c08b))

data1[,c("w2bd02",'w2d09','w2ba04','w2ba10',"w2ba11")][is.na(data1[,c("w2bd02",'w2d09',"w2ba04",'w2ba10',"w2ba11")])] <- 0
data1 <- subset(data1, select = -c(w2bd07a))

data1[,c('w2a2104b',"w2c05",'w2d08','w2bb09','w2bd01','w2c02')][is.na(data1[,c('w2a2104b',"w2c05",'w2d08','w2bb09','w2bd01','w2c02')])] <- 0
data1[,c("w2bd08",'w2bd09','w2bb04',"w2bb10",'w2bb15','w2b01','w2c18a','w2ba2702','w2ba21','w2bb11','w2ba18','w2b15','w2a26','w2d1103')][is.na(data1[,c("w2bd08",'w2bd09','w2bb04',"w2bb10",'w2bb15','w2b01','w2c18a','w2ba2702','w2ba21','w2bb11','w2ba18','w2b15','w2a26','w2d1103')])] <- 0


data1 <- subset(data1, select = -c(w2c06))
data1 <- subset(data1, select = -c(w2c08))
data1 <- subset(data1, select = -c(w2b17))
data1 <- subset(data1, select = -c(w2bd07b))

data1 <- subset(data1, select = -c(w2ba23))



dataa<-na.omit(data1)
boxplot( dataa$w2cogscore,ylab = "Score of cognitive test", main = "Performance")
dataa$cogscore[dataa$w2cogscore>23]<-"1"
dataa$cogscore[dataa$w2cogscore<24]<-"0"
dataa<-dataa[,-1]


table(dataa$w2a27[dataa$cogscore==1])
prop.table(table(dataa$w2a27[dataa$cogscore==1]))
write.csv(dataa,file="/Users/liuj/desktop/newdata2.csv",quote=F,row.names = F) 

#data 
n=nrow(dataa)
set.seed(1234)
trainindex <- sample(1:4938,0.8*4938)
trainset <- dataa[trainindex,]
testset <- dataa[-trainindex,]
write.csv(trainset,file="/Users/liuj/desktop/trainset.csv",quote=F,row.names = F) 
write.csv(testset,file="/Users/liuj/desktop/testset.csv",quote=F,row.names = F) 


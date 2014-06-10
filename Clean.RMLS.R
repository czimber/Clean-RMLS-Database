z <- Weekly.RMLS.Download.Sample
dim(z)
#z
#removes rows that dont start with a MLS#
mls <- subset(z,z$Status == "ACT" | z$Status == "BMP" | z$Status == "CAN" | 
                    z$Status == "EXP" | z$Status == "PEN" | z$Status == "SLD" | 
                    z$Status == "SNL" | z$Status == "SSP" | z$Status == "WTH")
dim(mls)

# rows that dont start with a MLS#
miss <- subset(z,z$Status != "ACT" & z$Status != "BMP" & z$Status != "CAN" & 
                      z$Status != "EXP" & z$Status != "PEN" & z$Status != "SLD" & 
                      z$Status != "SNL" & z$Status != "SSP" & z$Status != "WTH")

dim(miss)
######################
z <- Split.Sample
######################
#z <- Weekly.RMLS.Download.Sample
#dim(z)
z <- mls[,c(1,4)]
z
######################
MLS <- c(14622649,14449163,13633663,14001778,14431964,14398762,
       13046904,14654005,14394022,14383311,14474232,14183178,
       14344648,14650795)

List.Price <- c("2350000","2400000","2495000","2495000","2495000",
       "2695000","3800000","2125000 - 2300000","335000 - 345000",
       "375000 - 399900","559000 - 648876","NULL","NULL","NULL")
######################
List.Price <- c("2350000","2400000","2495000 - 2700000","2495000","2495000",
                "2695000","3800000","2125000 - 2300000","335000 - 345000",
                "375000 - 399900","559000 - 648876","NULL","NULL","NULL")
z <- cbind(MLS,List.Price)
z <- data.frame(z, stringsAsFactors=TRUE)
######################
z1 <- do.call(rbind.data.frame, strsplit(as.character(z$List.Price), "-"))

colnames(z1)[1] <- "List"
colnames(z1)[2] <- "Max"

z <- cbind(z,z1)
z
ListPrice <- as.numeric(levels(z$List[])[z$List[]])
MaxPrice <- as.numeric(levels(z$Max[])[z$Max[]])

z <- cbind(z,ListPrice,MaxPrice)

j<-nrow(z) 
for (i in 1:j ) {   
        if(z[i,5] == z[i,6])
        {z[i,7] <- NA
        } else {
                z[i,7] <- z[i,6]
        }
        }


z <- z[,-c(2,3,4,6)]                
colnames(z)[2] <- "List.Price"
colnames(z)[3] <- "Max.Price"

z[c(100:150),]
######################
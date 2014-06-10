w <- Weekly.RMLS.Download.Sample
dim(w)
w
#removes rows that dont start with a MLS#
mls <- subset(w,w$Status == "ACT" | w$Status == "BMP" | w$Status == "CAN" | 
                    w$Status == "EXP" | w$Status == "PEN" | w$Status == "SLD" | 
                    w$Status == "SNL" | w$Status == "SSP" | w$Status == "WTH")
dim(mls)

# rows that dont start with a MLS#
miss <- subset(w,w$Status != "ACT" & w$Status != "BMP" & w$Status != "CAN" & 
                      w$Status != "EXP" & w$Status != "PEN" & w$Status != "SLD" & 
                      w$Status != "SNL" & w$Status != "SSP" & w$Status != "WTH")

dim(miss)

####
a <- c(14622649,14449163,13633663,14001778,14431964,14398762,
       13046904,14654005,14394022,14383311,14474232,14183178,
       14344648,14650795)

b <- c("2350000","2400000","2495000","2495000","2495000",
        "2695000","3800000","2125000 - 2300000","335000 - 345000",
        "375000 - 399900","559000 - 648876","NULL","NULL","NULL")
z <- cbind(a,b)
z <- data.frame(z, stringsAsFactors=TRUE)
z
####
require(plyr)
require(stringr)
z <- Split.Sample
z <- data.frame(Split.Sample, stringsAsFactors = FALSE)
str(z)
z
z[,1]
z <- mls[,c(1,4)]
z
z1 <- do.call(rbind.data.frame, strsplit(as.character(z$List.Price), "-"))
z1
colnames(z1)[1] <- "List.Price1"
colnames(z1)[2] <- "Max.Price1"
#z1
z2 <- cbind(z,z1)
z2
ListPrice <- as.numeric(levels(z2$List.Price1[])[z2$List.Price1[]])
MaxPrice <- as.numeric(levels(z2$Max.Price1[])[z2$Max.Price1[]])
z4 <- cbind(z2,ListPrice,MaxPrice)
z4


j<-nrow(z4) 
j
for (i in 1:j ) {   
        if(z4[i,5] == z4[i,6])
                {z4[i,7] <- NA
        } else {
                z4[i,7] <- z4[i,6]
        }
}
z4
z4 <- z4[,-c(2,3,4,6)]                
colnames(z4)[2] <- "List.Price"
colnames(z4)[3] <- "Max.Price"
z4
tail(z4,10)

######################
z <- Split.Sample
######################
z <- Weekly.RMLS.Download.Sample
dim(z)
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

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
# z <- Split.Sample
######################

z <- mls[,c(1,4)]
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
z
######################
# Cleans Unit
require(stringr)
j <- nrow(mls)
for (i in 1:j ) {   
        if(str_detect(mls[i,6], "Lot")) { # removes "Lot"
                mls[i,6] <- ""
        }}
for (i in 1:j ) {   
        if(str_detect(mls[i,6], "lot")) { # removes "lot"
                mls[i,6] <- ""
        }}
for (i in 1:j ) {   
        if(str_detect(mls[i,6], "LOT")) { # removes "LOT"
                mls[i,6] <- ""
        }}
mls[,6] <- gsub("-", "",mls[,6])
mls[,6] <- gsub("#", "",mls[,6])
mls[,6] <- gsub(" ", "",mls[,6])
mls[1:800,5:6]

##
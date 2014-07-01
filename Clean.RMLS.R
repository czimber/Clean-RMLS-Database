#read.csv(Weekly.RMLS.Download.Sample.csv)
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
mls <- cbind(z,mls)
mls[1:5,1:9]
#mls <- mls[,c(-4,-7)]
######################
# Cleans Unit
require(stringr)
j <- nrow(mls)
for (i in 1:j ) {   
        if(str_detect(mls[i,9], "[lL][oO][tT]")) { # removes "Lot"
                mls[i,9] <- ""
        }}

mls[,9] <- gsub("-", "",mls[,9])
mls[,9] <- gsub("#", "",mls[,9])
mls[,9] <- gsub(" ", "",mls[,9])
mls[,9] <- gsub(" ", "",mls[,9])

mls[1:50,8:10]
# mls[,5:10]
# mls
##
# names(mls)
# sum(str_count(mls[,9], "[Ll][Oo][Tt]"))
###
￼# read 'ktop100.txt' file
￼# read 'ktop100.txt' file
# top105 = readLines("http://www.textfiles.com/music/ktop100.txt")
# dim(top105)
# length(top105)

# str_detect with if else
# z <- "str detect() str extract()
# str extract all() str match()
# str match all() str locate()
# str locate all() str replace()
# str replace all() str split()
# str split fixed()
# Regex functions in stringr Description
# Detect the presence or absence of a pattern in a string Extract first piece of a string that matches a pattern Extract all pieces of a string that match a pattern Extract first matched group from a string
# Extract all matched groups from a string
# Locate the position of the first occurence of a pattern in a string Locate the position of all occurences of a pattern in a string Replace first occurrence of a matched pattern in a string Replace all occurrences of a matched pattern in a string
# Split up a string into a variable number of pieces
# Split up a string into a fixed number of pieces"

# x <- "Loop"
# if(str_detect(z,"Split")==TRUE) {
#        x <- 1.06
# } else {
#        x <- x
# }
# x
#### Change Y N to 1 0 
mls.lr <- mls
#mls.lr <- mls[1:10,c(1,12,13)] # subseting test data
# mls.lr
# mls.lr[c(2,5,8),3] <- "Y" # creating some Y in test data
# mls.lr[10,3] <- NA # Creating NA in test data
mls.lr
mls.lr <- data.frame(lapply(mls.lr, as.character), stringsAsFactors=FALSE)
str(mls.lr)

mls.lr$LR[mls.lr$LR == "N"] <- 0
mls.lr$LR[mls.lr$LR == "Y"] <- 1
mls.lr$Home.Warranty[mls.lr$Home.Warranty == "N"] <- 0
mls.lr$Home.Warranty[mls.lr$Home.Warranty == "Y"] <- 1
mls.lr$Tax.Deferral[mls.lr$Tax.Deferral == "N"] <- 0
mls.lr$Tax.Deferral[mls.lr$Tax.Deferral == "Y"] <- 1
mls.lr$X3rd.Party[mls.lr$X3rd.Party == "N"] <- 0
mls.lr$X3rd.Party[mls.lr$X3rd.Party == "Y"] <- 1
mls.lr$Bank.Owned.REO[mls.lr$Bank.Owned.REO == "N"] <- 0
mls.lr$Bank.Owned.REO[mls.lr$Bank.Owned.REO == "Y"] <- 1
mls.lr$Auction.Y.N[mls.lr$Auction.Y.N == "N"] <- 0
mls.lr$Auction.Y.N[mls.lr$Auction.Y.N == "Y"] <- 1
mls.lr$Short.Sale[mls.lr$Short.Sale == "N"] <- 0
mls.lr$Short.Sale[mls.lr$Short.Sale == "Y"] <- 1

mls.lr$LR <- as.numeric(mls.lr$LR)
mls.lr$Home.Warranty <- as.numeric(mls.lr$Home.Warranty)
mls.lr$Tax.Deferral <- as.numeric(mls.lr$Tax.Deferral)
mls.lr$HOA.Amt <- as.numeric(mls.lr$HOA.Amt)
mls.lr$X3rd.Party <- as.numeric(mls.lr$X3rd.Party)
mls.lr$Bank.Owned.REO <- as.numeric(mls.lr$Bank.Owned.REO)
mls.lr$O.Price <- as.numeric(mls.lr$O.Price)
mls.lr$Close.Price <- as.numeric(mls.lr$Close.Price)
# mls.lr$Close.Date <- as.Date(mls.lr$Close.Date)
mls.lr$CDOM <- as.numeric(mls.lr$CDOM)
mls.lr$Auction.Y.N <- as.numeric(mls.lr$Auction.Y.N)
mls.lr$Short.Sale <- as.numeric(mls.lr$Short.Sale)

#
mls.lr$Inter.HARDWOD <- NA # Setting up HARDWOD 
mls.lr$Inter.HARDWOD <- str_detect(mls.lr$Inter, "HARDWOD")
mls.lr$Inter.HARDWOD[mls.lr$Inter.HARDWOD == "FALSE"] <- 0
mls.lr$Inter.HARDWOD[mls.lr$Inter.HARDWOD == "TRUE"] <- 1

#
mls.lr$Inter.LAM.FL <- NA # Setting up LAM-FL 
mls.lr$Inter.LAM.FL <- str_detect(mls.lr$Inter, "LAM-FL")
mls.lr$Inter.LAM.FL[mls.lr$Inter.LAM.FL == "FALSE"] <- 0
mls.lr$Inter.LAM.FL[mls.lr$Inter.LAM.FL == "TRUE"] <- 1

#
mls.lr$Inter.WOODFLR <- NA # Setting up WOODFLR 
mls.lr$Inter.WOODFLR <- str_detect(mls.lr$Inter, "WOODFLR")
mls.lr$Inter.WOODFLR[mls.lr$Inter.WOODFLR == "FALSE"] <- 0
mls.lr$Inter.WOODFLR[mls.lr$Inter.WOODFLR == "TRUE"] <- 1

#
mls.lr$Inter.TILE.FL <- NA # Setting up TILE-FL
mls.lr$Inter.TILE.FL <- str_detect(mls.lr$Inter, "TILE-FL")
mls.lr$Inter.TILE.FL[mls.lr$Inter.TILE.FL == "FALSE"] <- 0
mls.lr$Inter.TILE.FL[mls.lr$Inter.TILE.FL == "TRUE"] <- 1

#
mls.lr$Inter.VNYL.FL <- NA # Setting up VNYL-FL
mls.lr$Inter.VNYL.FL <- str_detect(mls.lr$Inter, "VNYL-FL")
mls.lr$Inter.VNYL.FL[mls.lr$Inter.VNYL.FL == "FALSE"] <- 0
mls.lr$Inter.VNYL.FL[mls.lr$Inter.VNYL.FL == "TRUE"] <- 1

#
mls.lr$Inter.BAMB.FL <- NA # Setting up BAMB-FL
mls.lr$Inter.BAMB.FL <- str_detect(mls.lr$Inter, "BAMB-FL")
mls.lr$Inter.BAMB.FL[mls.lr$Inter.BAMB.FL == "FALSE"] <- 0
mls.lr$Inter.BAMB.FL[mls.lr$Inter.BAMB.FL == "TRUE"] <- 1

#
mls.lr$Inter.WW.CARP <- NA # Setting up WW-CARP
mls.lr$Inter.WW.CARP <- str_detect(mls.lr$Inter, "WW-CARP")
mls.lr$Inter.WW.CARP[mls.lr$Inter.WW.CARP == "FALSE"] <- 0
mls.lr$Inter.WW.CARP[mls.lr$Inter.WW.CARP == "TRUE"] <- 1

#
mls.lr$Inter.SLATEFL <- NA # Setting up SLATEFLR
mls.lr$Inter.SLATEFL <- str_detect(mls.lr$Inter, "SLATEFL")
mls.lr$Inter.SLATEFL[mls.lr$Inter.SLATEFL == "FALSE"] <- 0
mls.lr$Inter.SLATEFL[mls.lr$Inter.SLATEFL == "TRUE"] <- 1
mls.lr$Inter.SLATEFL
mls.lr$Inter[1:100]




median(mls.lr$CDOM, na.rm=TRUE)
mls.lr$List.Type <- as.factor(mls.lr$List.Type)
mls.lr[1:10, 161:165]
str(mls.lr)
sum(mls.lr$Short.Sale, na.rm = TRUE)
max(mls.lr$Short.Sale, na.rm = TRUE)
####


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
        if(str_detect(mls[i,6], "[lL][oO][tT]")) { # removes "Lot"
                mls[i,6] <- ""
        }}

mls[,6] <- gsub("-", "",mls[,6])
mls[,6] <- gsub("#", "",mls[,6])
mls[,6] <- gsub(" ", "",mls[,6])
mls[1:800,5:6]
mls[,5:6]
mls
##
names(mls)
sum(str_count(mls[,6], "[Ll][Oo][Tt]"))
###
￼# read 'ktop100.txt' file
￼# read 'ktop100.txt' file
top105 = readLines("http://www.textfiles.com/music/ktop100.txt")
dim(top105)
length(top105)

# str_detect with if else
z <- "str detect() str extract()
str extract all() str match()
str match all() str locate()
str locate all() str replace()
str replace all() str split()
str split fixed()
Regex functions in stringr Description
Detect the presence or absence of a pattern in a string Extract first piece of a string that matches a pattern Extract all pieces of a string that match a pattern Extract first matched group from a string
Extract all matched groups from a string
Locate the position of the first occurence of a pattern in a string Locate the position of all occurences of a pattern in a string Replace first occurrence of a matched pattern in a string Replace all occurrences of a matched pattern in a string
Split up a string into a variable number of pieces
Split up a string into a fixed number of pieces"

x <- "Loop"
if(str_detect(z,"Split")==TRUE) {
        x <- 1.06
} else {
        x <- x
}
x

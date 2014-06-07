w <- Weekly.RMLS.Download.Sample
dim(w)
#removes rows that dont start with a MLS#
mls <- subset(w,w$Status == "ACT" | w$Status == "BMP" | w$Status == "CAN" | 
                    w$Status == "EXP" | w$Status == "PEN" | w$Status == "SNL" | 
                    w$Status == "SSP" | w$Status == "WTH" | w$Status == "SLD")
dim(mls)

# rows that dont start with a MLS#
miss <- subset(w,w$Status != "ACT" & w$Status != "SLD" & w$Status != "BMP" & 
                       w$Status != "CAN" & w$Status != "EXP" & 
                       w$Status != "PEN" & w$Status != "SNL" & 
                       w$Status != "SSP" & w$Status != "WTH" ) 
dim(miss)


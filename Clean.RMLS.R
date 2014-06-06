w <- Weekly.RMLS.Download.Sample
dim(w)
#removes rows that dont start with a MLS#
w <- subset(w,w$Status == "ACT" | w$Status == "BMP" | w$Status == "CAN" | 
                    w$Status == "EXP" | w$Status == "PEN" | w$Status == "SNL" | 
                    w$Status == "SSP" | w$Status == "WTH" | w$Status == "SLD")


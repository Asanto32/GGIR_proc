# testing GGIR analysis within dockerfile

library(GGIR)

data_directory <- "/data"

#get files
file_list <- list.files(path = data_directory, pattern = ".gt3x", full.names = TRUE)
print(file_list)

g.shell.GGIR(#=======================================
             # INPUT NEEDED:
             #mode=c(1,2), # default is 1:5
             datadir="/data/tesetfile.gt3x",
             outputdir="/output/",
             studyname="NDARZN578YDP",
             overwrite = TRUE,
             idloc=6,
             print.filename=TRUE,
             storefolderstructure = FALSE,
             dformat=2,
             mon=3,
             do.parallel=FALSE,
             maxdur = 10,
             #-------------------------------
             # Part 1:
             #-------------------------------
             desiredtz = "America/New_York",
             do.enmo = TRUE,
             do.anglez=TRUE,
             do.hfen = FALSE,
             windowsizes = c(5,900,3600),
             # do.cal=TRUE, default is true
             chunksize=1,
             printsummary=TRUE,
             #-------------------------------
             # Part 2:
             #-------------------------------
             strategy = 1,
             hrs.del.start = 0,
             hrs.del.end = 0,
             #maxdur = 0, default is 0
             #includedaycrit = 16, # for midnight-midnight
             winhr = c(5),
             epochvalues2csv=TRUE,
             L5M5window = c(0,24),
             M5L5res = 10,
             qlevels = c(c(1380/1440),c(1410/1440)),
             qwindow=c(0, 24),
             ilevels = c(100,400),
             mvpathreshold =c(140),
             do.imp=TRUE,
             #-------------------------------
             # Part 3:
             # (detection of sustained inactivity periods as needed for sleep detection in g.part4)
             #-------------------------------
             timethreshold= c(5),
             anglethreshold = 5,
             ignorenonwear = TRUE,
             nonwear_approach = "2023",
             #-------------------------------
             # Part 4:
             # （Labels detected sustained inactivity periods by g.part3 as either nocturnal sleep or daytime sustained inactivity)
             #-------------------------------
             excludefirstlast = FALSE,
             includenightcrit = 16,
             def.noc.sleep = c(1),
             outliers.only = FALSE,
             relyonguider = FALSE,
             sleeplogidnum = TRUE,
             do.visual = TRUE,
             do.sibreport = TRUE,
             criterror = 0,
             #-------------------------------
             # Part 5:
             #-------------------------------
             threshold.lig = c(50),
             threshold.mod = c(125),
             threshold.vig = c(400),
             boutcriter = 0.8,
             boutcriter.in = 0.9,
             boutcriter.lig = 0.8,
             boutcriter.mvpa = 0.8,
             boutdur.in = c(10,20),
             boutdur.lig = c(1,5),
             boutdur.mvpa = c(1,10),
             timewindow = c( "MM"),
             # -----------------------------------
             # Report generation
             # -----------------------------------
             do.report=c(2,4,5),
             visualreport=TRUE,
             dofirstpage = TRUE,
             viewingwindow=2
)

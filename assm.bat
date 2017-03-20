IF EXIST DOA.dsk GOTO :dsk1ok
xdm99.py DOA.dsk --initialize DSSD -n DOA

:dsk1ok

IF EXIST DOA360.dsk GOTO :dsk2ok
xdm99.py DOA360.dsk --initialize DSDD -n DOA
xdm99.py DOA360.dsk --set-geometry 2S1D80T

:dsk2ok

xas99.py -R -L doa.lst src/doa.a99
@IF %ERRORLEVEL% NEQ 0 GOTO :end

xdm99.py DOA.dsk -a doa.obj -f DF80 -n DOA3

xdm99.py DOA360.dsk -a doa.obj -f DF80 -n DOA3

xas99.py -R -i src/doa.a99 -o doa

xdm99.py DOA.dsk -a doa -n DOA
xdm99.py DOA.dsk -a dob -n DOB
xdm99.py DOA.dsk -a doc -n DOC
xdm99.py DOA.dsk -a dod -n DOD

xdm99.py DOA360.dsk -a doa -n DOA
xdm99.py DOA360.dsk -a dob -n DOB
xdm99.py DOA360.dsk -a doc -n DOC
xdm99.py DOA360.dsk -a dod -n DOD

java -jar tools/ea5tocart.jar doa "dungeons of asgaard"

:end
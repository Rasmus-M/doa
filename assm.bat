xas99.py -R -L doa.lst src/doa.a99
@IF %ERRORLEVEL% NEQ 0 GOTO :end

xdm99.py doa.dsk -a doa.obj -f DF80 -n DOA3

xas99.py -R -i src/doa.a99 -o doa

xdm99.py doa.dsk -a doa -n DOA
xdm99.py doa.dsk -a dob -n DOB
xdm99.py doa.dsk -a doc -n DOC

:end
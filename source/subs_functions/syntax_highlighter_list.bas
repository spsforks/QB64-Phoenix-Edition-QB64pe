DIM SHARED listOfKeywords$, listOfCustomKeywords$, customKeywordsLength AS LONG

' Metacommands alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = "@" +_
"$ASSERTS@$CHECKING@$COLOR@$CONSOLE@$DEBUG@$ELSE@$ELSEIF@$EMBED@$END@$ENDIF@$ERROR@$EXEICON@$IF@$INCLUDEONCE@$LET@$MIDISOUNDFONT@$NOPREFIX@$RESIZE@$SCREENHIDE@$SCREENSHOW@$UNSTABLE@$VERSIONINFO@" +_
"$DYNAMIC@$INCLUDE@$STATIC@" +_
""

' [A] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_ACCEPTFILEDROP@_ACOS@_ACOSH@_ADLER32@_ALL@_ALLOWFULLSCREEN@_ALPHA@_ALPHA32@_ANDALSO@_ANTICLOCKWISE@_ARCCOT@_ARCCSC@_ARCSEC@_ASIN@_ASINH@_ASSERT@_ATAN2@_ATANH@_AUTO@_AUTODISPLAY@_AXIS@_BACKGROUNDCOLOR@" +_
"ABS@ABSOLUTE@ACCESS@ALIAS@AND@APPEND@AS@ASC@ATN@" +_
"_GLACCUM@_GLALPHAFUNC@_GLARETEXTURESRESIDENT@_GLARRAYELEMENT@"

' [B] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_BEHIND@_BIN$@_BIT@_BLEND@_BLINK@_BLUE@_BLUE32@_BUTTON@_BUTTONCHANGE@_BYTE@" +_
"BASE@BEEP@BINARY@BLOAD@BSAVE@BYVAL@" +_
"_GLBEGIN@_GLBINDTEXTURE@_GLBITMAP@_GLBLENDFUNC@"

' [C] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_CAPSLOCK@_CEIL@_CINP@_CLEAR@_CLEARCOLOR@_CLIP@_CLIPBOARD$@_CLIPBOARDIMAGE@_CLOCKWISE@_COLORCHOOSERDIALOG@_COMMANDCOUNT@_CONNECTED@_CONNECTIONADDRESS@_CONNECTIONADDRESS$@_CONSOLE@_CONSOLECURSOR@_CONSOLEFONT@_CONSOLEINPUT@_CONSOLETITLE@_CONTINUE@_CONTROLCHR@_COPYIMAGE@_COPYPALETTE@_COSH@_COT@_COTH@_CRC32@_CSC@_CSCH@_CV@_CWD$@" +_
"CALL@CALLS@CASE@CDBL@CDECL@CHAIN@CHDIR@CHR$@CINT@CIRCLE@CLEAR@CLNG@CLOSE@CLS@COLOR@COM@COMMAND$@COMMON@CONSOLE@CONST@COS@CSNG@CSRLIN@CUSTOMTYPE@CVD@CVDMBF@CVI@CVL@CVS@CVSMBF@" +_
"_GLCALLLIST@_GLCALLLISTS@_GLCLEAR@_GLCLEARACCUM@_GLCLEARCOLOR@_GLCLEARDEPTH@_GLCLEARINDEX@_GLCLEARSTENCIL@_GLCLIPPLANE@_GLCOLOR3B@_GLCOLOR3BV@_GLCOLOR3D@_GLCOLOR3DV@_GLCOLOR3F@_GLCOLOR3FV@_GLCOLOR3I@_GLCOLOR3IV@_GLCOLOR3S@_GLCOLOR3SV@_GLCOLOR3UB@_GLCOLOR3UBV@_GLCOLOR3UI@_GLCOLOR3UIV@_GLCOLOR3US@_GLCOLOR3USV@_GLCOLOR4B@_GLCOLOR4BV@_GLCOLOR4D@_GLCOLOR4DV@_GLCOLOR4F@_GLCOLOR4FV@_GLCOLOR4I@_GLCOLOR4IV@_GLCOLOR4S@_GLCOLOR4SV@_GLCOLOR4UB@_GLCOLOR4UBV@_GLCOLOR4UI@_GLCOLOR4UIV@_GLCOLOR4US@_GLCOLOR4USV@_GLCOLORMASK@_GLCOLORMATERIAL@_GLCOLORPOINTER@_GLCOPYPIXELS@_GLCOPYTEXIMAGE1D@_GLCOPYTEXIMAGE2D@_GLCOPYTEXSUBIMAGE1D@_GLCOPYTEXSUBIMAGE2D@_GLCULLFACE@"

' [D] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_D2G@_D2R@_DEFAULTCOLOR@_DEFINE@_DEFLATE$@_DELAY@_DEPTHBUFFER@_DESKTOPHEIGHT@_DESKTOPWIDTH@_DEST@_DEVICE$@_DEVICEINPUT@_DEVICES@_DIR$@_DIREXISTS@_DISPLAY@_DISPLAYORDER@_DONTBLEND@_DONTWAIT@_DROPPEDFILE@_DROPPEDFILE$@" +_
"DATA@DATE$@DECLARE@DEF@DEFDBL@DEFINT@DEFLNG@DEFSNG@DEFSTR@DIM@DO@DOUBLE@DRAW@DYNAMIC@" +_
"_GLDELETELISTS@_GLDELETETEXTURES@_GLDEPTHFUNC@_GLDEPTHMASK@_GLDEPTHRANGE@_GLDISABLE@_GLDISABLECLIENTSTATE@_GLDRAWARRAYS@_GLDRAWBUFFER@_GLDRAWELEMENTS@_GLDRAWPIXELS@"

' [E] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_ECHO@_EMBEDDED$@_ENVIRONCOUNT@_ERRORLINE@_ERRORMESSAGE$@_EXIT@_EXPLICIT@_EXPLICITARRAY@" +_
"ELSE@ELSEIF@END@ENDIF@ENVIRON@ENVIRON$@EOF@EQV@ERASE@ERDEV@ERDEV$@ERL@ERR@ERROR@EVERYCASE@EXIT@EXP@" +_
"_GLEDGEFLAG@_GLEDGEFLAGPOINTER@_GLEDGEFLAGV@_GLENABLE@_GLENABLECLIENTSTATE@_GLEND@_GLENDLIST@_GLEVALCOORD1D@_GLEVALCOORD1DV@_GLEVALCOORD1F@_GLEVALCOORD1FV@_GLEVALCOORD2D@_GLEVALCOORD2DV@_GLEVALCOORD2F@_GLEVALCOORD2FV@_GLEVALMESH1@_GLEVALMESH2@_GLEVALPOINT1@_GLEVALPOINT2@"

' [F] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_FILEEXISTS@_FILES$@_FILLBACKGROUND@_FINISHDROP@_FLOAT@_FONT@_FONTHEIGHT@_FONTWIDTH@_FPS@_FREEFONT@_FREEIMAGE@_FREETIMER@_FULLPATH$@_FULLSCREEN@" +_
"FIELD@FILEATTR@FILES@FIX@FN@FOR@FRE@FREE@FREEFILE@FUNCTION@" +_
"_GLFEEDBACKBUFFER@_GLFINISH@_GLFLUSH@_GLFOGF@_GLFOGFV@_GLFOGI@_GLFOGIV@_GLFRONTFACE@_GLFRUSTUM@"

' [G] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_G2D@_G2R@_GLRENDER@_GREEN@_GREEN32@" +_
"GET@GOSUB@GOTO@" +_
"_GLGENLISTS@_GLGENTEXTURES@_GLGETBOOLEANV@_GLGETCLIPPLANE@_GLGETDOUBLEV@_GLGETERROR@_GLGETFLOATV@_GLGETINTEGERV@_GLGETLIGHTFV@_GLGETLIGHTIV@_GLGETMAPDV@_GLGETMAPFV@_GLGETMAPIV@_GLGETMATERIALFV@_GLGETMATERIALIV@_GLGETPIXELMAPFV@_GLGETPIXELMAPUIV@_GLGETPIXELMAPUSV@_GLGETPOINTERV@_GLGETPOLYGONSTIPPLE@_GLGETSTRING@_GLGETTEXENVFV@_GLGETTEXENVIV@_GLGETTEXGENDV@_GLGETTEXGENFV@_GLGETTEXGENIV@_GLGETTEXIMAGE@_GLGETTEXLEVELPARAMETERFV@_GLGETTEXLEVELPARAMETERIV@_GLGETTEXPARAMETERFV@_GLGETTEXPARAMETERIV@"

' [H] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_HARDWARE@_HARDWARE1@_HEIGHT@_HIDE@_HYPOT@" +_
"HEX$@" +_
"_GLHINT@"

' [I] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_ICON@_INCLERRORFILE$@_INCLERRORLINE@_INFLATE$@_INPUTBOX$@_INSTRREV@_INTEGER64@" +_
"IF@IMP@INKEY$@INP@INPUT@INPUT$@INSTR@INT@INTEGER@INTERRUPT@INTERRUPTX@IOCTL@IOCTL$@IS@" +_
"_GLINDEXD@_GLINDEXDV@_GLINDEXF@_GLINDEXFV@_GLINDEXI@_GLINDEXIV@_GLINDEXMASK@_GLINDEXPOINTER@_GLINDEXS@_GLINDEXSV@_GLINDEXUB@_GLINDEXUBV@_GLINITNAMES@_GLINTERLEAVEDARRAYS@_GLISENABLED@_GLISLIST@_GLISTEXTURE@"

' [J] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"" +_
"" +_
""

' [K] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_KEEPBACKGROUND@_KEYCLEAR@_KEYDOWN@_KEYHIT@" +_
"KEY@KILL@" +_
""

' [L] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_LASTAXIS@_LASTBUTTON@_LASTHANDLER@_LASTWHEEL@_LIMIT@_LOADFONT@_LOADIMAGE@" +_
"LBOUND@LCASE$@LEFT$@LEN@LET@LIBRARY@LINE@LIST@LOC@LOCATE@LOCK@LOF@LOG@LONG@LOOP@LPOS@LPRINT@LSET@LTRIM$@" +_
"_GLLIGHTF@_GLLIGHTFV@_GLLIGHTI@_GLLIGHTIV@_GLLIGHTMODELF@_GLLIGHTMODELFV@_GLLIGHTMODELI@_GLLIGHTMODELIV@_GLLINESTIPPLE@_GLLINEWIDTH@_GLLISTBASE@_GLLOADIDENTITY@_GLLOADMATRIXD@_GLLOADMATRIXF@_GLLOADNAME@_GLLOGICOP@"

' [M] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_MAPTRIANGLE@_MAPUNICODE@_MD5$@_MEM@_MEMCOPY@_MEMELEMENT@_MEMEXISTS@_MEMFILL@_MEMFREE@_MEMGET@_MEMIMAGE@_MEMNEW@_MEMPUT@_MEMSOUND@_MESSAGEBOX@_MIDDLE@_MIDISOUNDBANK@_MK$@_MOUSEBUTTON@_MOUSEHIDE@_MOUSEINPUT@_MOUSEMOVE@_MOUSEMOVEMENTX@_MOUSEMOVEMENTY@_MOUSESHOW@_MOUSEWHEEL@_MOUSEX@_MOUSEY@" +_
"MID$@MKD$@MKDIR@MKDMBF$@MKI$@MKL$@MKS$@MKSMBF$@MOD@" +_
"_GLMAP1D@_GLMAP1F@_GLMAP2D@_GLMAP2F@_GLMAPGRID1D@_GLMAPGRID1F@_GLMAPGRID2D@_GLMAPGRID2F@_GLMATERIALF@_GLMATERIALFV@_GLMATERIALI@_GLMATERIALIV@_GLMATRIXMODE@_GLMULTMATRIXD@_GLMULTMATRIXF@"

' [N] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_NEGATE@_NEWHANDLER@_NEWIMAGE@_NONE@_NOTIFYPOPUP@_NUMLOCK@" +_
"NAME@NEXT@NOT@" +_
"_GLNEWLIST@_GLNORMAL3B@_GLNORMAL3BV@_GLNORMAL3D@_GLNORMAL3DV@_GLNORMAL3F@_GLNORMAL3FV@_GLNORMAL3I@_GLNORMAL3IV@_GLNORMAL3S@_GLNORMAL3SV@_GLNORMALPOINTER@"

' [O] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_OFF@_OFFSET@_ONLY@_ONLYBACKGROUND@_ONTOP@_OPENCLIENT@_OPENCONNECTION@_OPENFILEDIALOG$@_OPENHOST@_ORELSE@_OS$@" +_
"OCT$@OFF@ON@ONLY@OPEN@OPTION@OR@OUT@OUTPUT@" +_
"_GLORTHO@"

' [P] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_PALETTECOLOR@_PI@_PIXELSIZE@_PRESERVE@_PRINTIMAGE@_PRINTMODE@_PRINTSTRING@_PRINTWIDTH@_PUTIMAGE@" +_
"PAINT@PALETTE@PCOPY@PEEK@PEN@PLAY@PMAP@POINT@POKE@POS@PRESET@?@PRINT@PSET@PUT@" +_
"_GLPASSTHROUGH@_GLUPERSPECTIVE@_GLPIXELMAPFV@_GLPIXELMAPUIV@_GLPIXELMAPUSV@_GLPIXELSTOREF@_GLPIXELSTOREI@_GLPIXELTRANSFERF@_GLPIXELTRANSFERI@_GLPIXELZOOM@_GLPOINTSIZE@_GLPOLYGONMODE@_GLPOLYGONOFFSET@_GLPOLYGONSTIPPLE@_GLPOPATTRIB@_GLPOPCLIENTATTRIB@_GLPOPMATRIX@_GLPOPNAME@_GLPRIORITIZETEXTURES@_GLPUSHATTRIB@_GLPUSHCLIENTATTRIB@_GLPUSHMATRIX@_GLPUSHNAME@"

' [Q] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"" +_
"" +_
""

' [R] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_R2D@_R2G@_READBIT@_READFILE$@_RED@_RED32@_RESETBIT@_RESIZE@_RESIZEHEIGHT@_RESIZEWIDTH@_RGB@_RGB32@_RGBA@_RGBA32@_ROL@_ROR@_ROUND@" +_
"RANDOM@RANDOMIZE@READ@REDIM@REM@RESET@RESTORE@RESUME@RETURN@RIGHT$@RMDIR@RND@RSET@RTRIM$@RUN@" +_
"_GLRASTERPOS2D@_GLRASTERPOS2DV@_GLRASTERPOS2F@_GLRASTERPOS2FV@_GLRASTERPOS2I@_GLRASTERPOS2IV@_GLRASTERPOS2S@_GLRASTERPOS2SV@_GLRASTERPOS3D@_GLRASTERPOS3DV@_GLRASTERPOS3F@_GLRASTERPOS3FV@_GLRASTERPOS3I@_GLRASTERPOS3IV@_GLRASTERPOS3S@_GLRASTERPOS3SV@_GLRASTERPOS4D@_GLRASTERPOS4DV@_GLRASTERPOS4F@_GLRASTERPOS4FV@_GLRASTERPOS4I@_GLRASTERPOS4IV@_GLRASTERPOS4S@_GLRASTERPOS4SV@_GLREADBUFFER@_GLREADPIXELS@_GLRECTD@_GLRECTDV@_GLRECTF@_GLRECTFV@_GLRECTI@_GLRECTIV@_GLRECTS@_GLRECTSV@_GLRENDERMODE@_GLROTATED@_GLROTATEF@"

' [S] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_SAVEFILEDIALOG$@_SAVEIMAGE@_SCALEDHEIGHT@_SCALEDWIDTH@_SCREENCLICK@_SCREENEXISTS@_SCREENHIDE@_SCREENICON@_SCREENIMAGE@_SCREENMOVE@_SCREENPRINT@_SCREENSHOW@_SCREENX@_SCREENY@_SCROLLLOCK@_SEAMLESS@_SEC@_SECH@_SELECTFOLDERDIALOG$@_SETALPHA@_SETBIT@_SHELLHIDE@_SHL@_SHOW@_SHR@_SINH@_SMOOTH@_SMOOTHSHRUNK@_SMOOTHSTRETCHED@_SNDBAL@_SNDCLOSE@_SNDCOPY@_SNDGETPOS@_SNDLEN@_SNDLIMIT@_SNDLOOP@_SNDNEW@_SNDOPEN@_SNDOPENRAW@_SNDPAUSE@_SNDPAUSED@_SNDPLAY@_SNDPLAYCOPY@_SNDPLAYFILE@_SNDPLAYING@_SNDRATE@_SNDRAW@_SNDRAWDONE@_SNDRAWLEN@_SNDSETPOS@_SNDSTOP@_SNDVOL@_SOFTWARE@_SOURCE@_SQUAREPIXELS@_STARTDIR$@_STATUSCODE@_STRCMP@_STRETCH@_STRICMP@" +_
"SADD@SCREEN@SEEK@SEG@SELECT@SETMEM@SGN@SHARED@SHELL@SIGNAL@SIN@SINGLE@SLEEP@SMOOTH@SOUND@SPACE$@SPC@SQR@STATIC@STEP@STICK@STOP@STR$@STRETCH@STRIG@STRING@STRING$@SUB@SWAP@SYSTEM@" +_
"_GLSCALED@_GLSCALEF@_GLSCISSOR@_GLSELECTBUFFER@_GLSHADEMODEL@_GLSTENCILFUNC@_GLSTENCILMASK@_GLSTENCILOP@"

' [T] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_TANH@_TITLE@_TITLE$@_TOGGLE@_TOGGLEBIT@_TOTALDROPPEDFILES@_TRIM$@" +_
"TAB@TAN@THEN@TIME$@TIMER@TO@TROFF@TRON@TYPE@" +_
"_GLTEXCOORD1D@_GLTEXCOORD1DV@_GLTEXCOORD1F@_GLTEXCOORD1FV@_GLTEXCOORD1I@_GLTEXCOORD1IV@_GLTEXCOORD1S@_GLTEXCOORD1SV@_GLTEXCOORD2D@_GLTEXCOORD2DV@_GLTEXCOORD2F@_GLTEXCOORD2FV@_GLTEXCOORD2I@_GLTEXCOORD2IV@_GLTEXCOORD2S@_GLTEXCOORD2SV@_GLTEXCOORD3D@_GLTEXCOORD3DV@_GLTEXCOORD3F@_GLTEXCOORD3FV@_GLTEXCOORD3I@_GLTEXCOORD3IV@_GLTEXCOORD3S@_GLTEXCOORD3SV@_GLTEXCOORD4D@_GLTEXCOORD4DV@_GLTEXCOORD4F@_GLTEXCOORD4FV@_GLTEXCOORD4I@_GLTEXCOORD4IV@_GLTEXCOORD4S@_GLTEXCOORD4SV@_GLTEXCOORDPOINTER@_GLTEXENVF@_GLTEXENVFV@_GLTEXENVI@_GLTEXENVIV@_GLTEXGEND@_GLTEXGENDV@_GLTEXGENF@_GLTEXGENFV@_GLTEXGENI@_GLTEXGENIV@_GLTEXIMAGE1D@_GLTEXIMAGE2D@_GLTEXPARAMETERF@_GLTEXPARAMETERFV@_GLTEXPARAMETERI@_GLTEXPARAMETERIV@_GLTEXSUBIMAGE1D@_GLTEXSUBIMAGE2D@_GLTRANSLATED@_GLTRANSLATEF@"

' [U] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_UCHARPOS@_UFONTHEIGHT@_ULINESPACING@_UNSIGNED@_UPRINTSTRING@_UPRINTWIDTH@" +_
"UBOUND@UCASE$@UEVENT@UNLOCK@UNTIL@USING@" +_
""

' [V] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"" +_
"VAL@VARPTR@VARPTR$@VARSEG@VIEW@" +_
"_GLVERTEX2D@_GLVERTEX2DV@_GLVERTEX2F@_GLVERTEX2FV@_GLVERTEX2I@_GLVERTEX2IV@_GLVERTEX2S@_GLVERTEX2SV@_GLVERTEX3D@_GLVERTEX3DV@_GLVERTEX3F@_GLVERTEX3FV@_GLVERTEX3I@_GLVERTEX3IV@_GLVERTEX3S@_GLVERTEX3SV@_GLVERTEX4D@_GLVERTEX4DV@_GLVERTEX4F@_GLVERTEX4FV@_GLVERTEX4I@_GLVERTEX4IV@_GLVERTEX4S@_GLVERTEX4SV@_GLVERTEXPOINTER@_GLVIEWPORT@"

' [W] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"_WHEEL@_WIDTH@_WINDOWHANDLE@_WINDOWHASFOCUS@_WRITEFILE@" +_
"WAIT@WEND@WHILE@WIDTH@WINDOW@WRITE@" +_
""

' [X] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"" +_
"XOR@" +_
""

' [Y] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"" +_
"" +_
""

' [Z] - Keywords alphabetical (1st line = QB64, 2nd line = QB4.5, 3rd line = OpenGL)
listOfKeywords$ = listOfKeywords$ +_
"" +_
"" +_
""


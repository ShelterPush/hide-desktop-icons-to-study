@echo off

cd C:\Users\Sean\Desktop
attrib +h Games
attrib +h *.url
attrib +h *.lnk

:toomuchtime
Echo How long are you studying (in minutes)? 
SET /P timemin=

:yesnoyn 
if %timemin% GTR 1440 Echo Are you sure you would like to study for more than 24 hours? && Echo Please enter y for yes or n for no.
if %timemin% LEQ 1440 goto justsetthedamntime
SET /P willi=
If %willi%==n goto toomuchtime
If not %willi%==y if not %willi%==n Echo Please answer y for yes or n for no. && goto yesnoyn

:justsetthedamntime
SET /A timesec = %timemin% * 60
timeout /T %timesec% /nobreak

:tryagain
Echo Would you like to extend your study time (y/n)?
SET /P answer=
if %answer%==y Echo How long would you like to continue? && SET /P timemin2= 
IF %answer%==n Echo Okay. && goto end
if not %answer%==y if not %answer%==n Echo Please answer y for yes or n for no. && goto tryagain

SET /A timesec2 = %timemin2% * 60
timeout /T %timesec2% /nobreak
goto tryagain

:end
attrib -h Games
attrib -h *.url
attrib -h *.lnk

exit
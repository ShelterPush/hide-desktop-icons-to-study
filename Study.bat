@echo off

REM Comments will follow the line upon which they are commenting

cd C:\Users\ShelterPush\Desktop 
REM Change ShelterPush to whatever your Windows User name is
attrib +h Games 
REM Hides the Games folder on my desktop
attrib +h *.url 
REM most Steam games
attrib +h *.lnk 
REM most other shortcuts

:toomuchtime
REM This is a location marker
Echo How long are you studying (in minutes)? 
SET /P timemin=

:yesnoyn 
if %timemin% GTR 1440 Echo Are you sure you would like to study for more than 24 hours? && Echo Please enter y for yes or n for no.
if %timemin% LEQ 1440 goto justsetthetime
REM sends the user to set the amount of time if the answer is less than 1440 minutes
SET /P willi=
If %willi%==n goto toomuchtime
REM sends the user back to the time typing part
REM If they answer y, the script proceeds to the next part
If not %willi%==y if not %willi%==n Echo Please answer y for yes or n for no. && goto yesnoyn
REM ensures no ambiguity

:justsetthetime
SET /A timesec = %timemin% * 60
timeout /T %timesec% /nobreak
REM time in DOS timeout is measured in seconds, so this conversion is required
REM If you would like to cut short your study time, press CTRL+C during this timeout and it will advance the script to the next section

:tryagain
Echo Would you like to extend your study time (y/n)?
SET /P answer=
if %answer%==y Echo How long would you like to continue? && SET /P timemin2= 
IF %answer%==n Echo Okay. && goto end
if not %answer%==y if not %answer%==n Echo Please answer y for yes or n for no. && goto tryagain

SET /A timesec2 = %timemin2% * 60
timeout /T %timesec2% /nobreak
goto tryagain
REM This entire section here allows you to indefinitely extend your study time by whatever time you need
REM If you keep answering y, you can keep studying
REM If you answer n, the script proceeds

:end
attrib -h Games
attrib -h *.url
attrib -h *.lnk
REM unhides the directory and shortcuts

exit

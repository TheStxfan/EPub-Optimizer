
@echo off
setlocal enabledelayedexpansion

:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------- ::


:: Set quality { 1 - 100 }:

set "quality=35"

:: Set Color { Gray / RGB }:

set "color=Gray"

:: Set Send To E-Ink { 0 - 1 }:

set "send_to_eink=0"

:: Set Device Label { Any }:

set "device_label=Tolino"

:: Set path on device { ! Case sensitive ! }:

set "path_on_device=Downloads"


:: --------------------------------------------------------------------------------------------------------------------------------------------------------------------- ::


:: This is the code. Do NOT touch here!

copy "%~1" "%~1.bak" > nul

set "draggedFile=!cmdcmdline:~,-1!"
set "draggedFile=!draggedFile:*"=!"
set "draggedFile=!draggedFile:/=\!"
for %%A in ("!draggedFile!") do set "folderPath=%%~dpA"

cd %folderPath%

"%~dp0\Data\Calibre\ebook-meta.exe" "%~1" --get-cover="%~dp0cover.jpg" > nul

"%~dp0\Data\Magick\magick.exe" convert "%~dp0cover.jpg" -sampling-factor 4:2:0 -strip -quality %quality% -interlace JPEG -colorspace %color% "%~dp0cover.jpg" > nul

"%~dp0\Data\Calibre\ebook-meta.exe" "%~1" --cover="%~dp0cover.jpg" > nul

del /s /q "%~dp0cover.jpg" > nul

if %send_to_eink% == 1 ( goto send_to_eink )

exit

:send_to_eink

for %%D in (A B C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    for /f "tokens=6 delims= " %%A in ('vol %%D: 2^>nul ^| find /i "%device_label%"') do (
        set "drive_letter=%%D:"
        goto :found_drive
    )
)

:found_drive

if defined drive_letter (
    set "destination=%drive_letter%%path_on_device%"
    move "%~1" "!destination!"
) else (
    goto send_to_eink
)

ren "%~1.bak" "%~nx1"

endlocal

exit
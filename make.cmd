setlocal
set "PROMPT=$ "
call :"%1"
endlocal
exit /b

:""
    call :mkmsi nyagos-amd64-wix2
    exit /b

:mkmsi
    candle "%~1.wxs" || exit /b 1
    light  "%~1.wixobj" || exit /b 1
    del "%~1.wixobj"
    exit /b 0

:"status"
    @echo off
    for %%I in ("C:\Program Files" "C:\Program Files (x86)") do (
        if exist "%%~I\NyaosOrg\nyagos.exe" (
            echo Found: %%~I\NyaosOrg
        ) else (
            echo Not Found: %%~I\NyaosOrg
        )
    )
    exit /b

:"install"
    msiexec /i nyagos-amd64-wix2.msi
    exit /b 0

:"uninstall"
    msiexec /x nyagos-amd64-wix2.msi
    exit /b 0

:"clean"
    del *.msi *.wixobj *.bak
    exit /b 0

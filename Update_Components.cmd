@echo off
setlocal EnableExtensions DisableDelayedExpansion

set "ROOT=%~dp0"

call :sync_dep "3rd_party\Src\DirectXTex\DirectXTex" "https://github.com/microsoft/DirectXTex.git" "mar2025"
if errorlevel 1 exit /b 1

call :sync_dep "3rd_party\Src\DirectXMesh\DirectXMesh" "https://github.com/microsoft/DirectXMesh.git" "main"
if errorlevel 1 exit /b 1

call :sync_dep "3rd_party\Src\DirectXMath\DirectXMath" "https://github.com/microsoft/DirectXMath.git" "main"
if errorlevel 1 exit /b 1

call :sync_dep "3rd_party\Src\concurrentqueue\concurrentqueue" "https://github.com/cameron314/concurrentqueue.git" "master"
if errorlevel 1 exit /b 1

call :sync_dep "3rd_party\Src\libsquashfs\squashfs-tools-ng" "https://github.com/AgentD/squashfs-tools-ng.git" "master"
if errorlevel 1 exit /b 1

call :sync_dep "3rd_party\Src\lz4\lz4" "https://github.com/lz4/lz4.git" "dev"
if errorlevel 1 exit /b 1

call :sync_dep "3rd_party\Src\zstd\zstd" "https://github.com/facebook/zstd.git" "dev"
if errorlevel 1 exit /b 1

call :sync_dep "3rd_party\Src\mimalloc\mimalloc" "https://github.com/microsoft/mimalloc.git" "dev2"
if errorlevel 1 exit /b 1

call :sync_dep "3rd_party\Src\NVIDIA_DLSS\DLSS" "https://github.com/NVIDIA/DLSS.git" "v310.4.0"
if errorlevel 1 exit /b 1

call :sync_dep "3rd_party\Src\cpputils\cpputils" "https://github.com/tzcnt/cpputils.git" "main"
if errorlevel 1 exit /b 1

echo [OK] Third-party dependencies are in sync.
exit /b 0

:sync_dep
set "REL_PATH=%~1"
set "DEP_URL=%~2"
set "DEP_REF=%~3"
set "DEP_PATH=%ROOT%%REL_PATH%"

echo.
echo [SYNC] %REL_PATH% ^(ref: %DEP_REF%^)

if not exist "%DEP_PATH%\.git" (
    if exist "%DEP_PATH%" rd /s /q "%DEP_PATH%"
    for %%I in ("%DEP_PATH%") do if not exist "%%~dpI" mkdir "%%~dpI"
    call :run git clone --branch "%DEP_REF%" --depth 1 "%DEP_URL%" "%DEP_PATH%"
    if errorlevel 1 exit /b 1
    exit /b 0
)

call :run git -C "%DEP_PATH%" remote set-url origin "%DEP_URL%"
if errorlevel 1 exit /b 1

call :run git -C "%DEP_PATH%" fetch --depth 1 origin "%DEP_REF%"
if errorlevel 1 exit /b 1

call :run git -C "%DEP_PATH%" checkout --force FETCH_HEAD
if errorlevel 1 exit /b 1

call :run git -C "%DEP_PATH%" clean -ffd
if errorlevel 1 exit /b 1

exit /b 0

:run
echo [CMD] %*
%*
if errorlevel 1 (
    echo [ERROR] Command failed.
    exit /b 1
)
exit /b 0

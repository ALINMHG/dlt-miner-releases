@echo off
setlocal EnableExtensions

REM === EDIT THESE ===
set "MINER_ADDRESS=PASTE_YOUR_WALLET_ADDRESS_HERE"
set "POOL_HOST=144.91.105.244:3333"
set "THREADS=4"
REM ==================

set "MINER=%~dp0dilithium-miner.exe"

if not exist "%MINER%" (
  echo ERROR: dilithium-miner.exe not found in this folder.
  pause
  exit /b 1
)

if /i "%MINER_ADDRESS%"=="PASTE_YOUR_WALLET_ADDRESS_HERE" (
  echo ERROR: Edit mine-pool.bat and set MINER_ADDRESS to your wallet.
  pause
  exit /b 1
)

echo Pool:    %POOL_HOST%
echo Miner:   %MINER_ADDRESS%
echo Threads: %THREADS%
echo.

"%MINER%" --pool %POOL_HOST% --miner=%MINER_ADDRESS% --threads %THREADS%
pause
endlocal

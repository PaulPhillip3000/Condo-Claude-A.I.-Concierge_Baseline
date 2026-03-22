@echo off
echo Starting CondoClaw AI Concierge...
echo.

:: Clear stale Python bytecode cache so new code is always picked up
if exist "%~dp0__pycache__\backend.cpython-312.pyc" (
    del /f /q "%~dp0__pycache__\backend.cpython-312.pyc"
    echo Cleared stale bytecode cache.
)

:: Use full Python 3.12 path to avoid Windows App Store stub
set PYTHON312=C:\Users\gz144\AppData\Local\Programs\Python\Python312\python.exe

:: Start Backend
start "CondoClaw Backend" cmd /k "cd /d %~dp0 && "%PYTHON312%" backend.py"

:: Start Frontend
start "CondoClaw Frontend" cmd /k "cd /d %~dp0\frontend && npm run dev"

echo Waiting for services to start...
timeout /t 5

echo Opening Dashboard...
start http://localhost:5173

echo.
echo Everything is running! Keep the two black windows open while you work.
pause

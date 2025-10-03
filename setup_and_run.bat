@echo off
REM JSON to CSV Converter
REM Usage: setup_and_run.bat [input.json] [output.csv]
REM If no parameters provided, will prompt for filenames

echo JSON to CSV Converter
echo ====================
echo.

REM If no parameters provided, prompt for them
if "%~1"=="" (
    set /p INPUT_FILE="Enter the name of your JSON file (e.g., records.json): "
) else (
    set INPUT_FILE=%~1
)

if "%~2"=="" (
    set /p OUTPUT_FILE="Enter the name for your CSV file (e.g., records.csv): "
) else (
    set OUTPUT_FILE=%~2
)

echo.
echo Converting %INPUT_FILE% to %OUTPUT_FILE%...
echo.

echo Setting up virtual environment...

REM Create virtual environment
python -m venv venv

REM Activate virtual environment
call venv\Scripts\activate.bat

REM Install requirements
echo Installing requirements...
pip install -r requirements.txt

REM Run the conversion
echo Converting %INPUT_FILE% to %OUTPUT_FILE%...
python json_to_csv.py "%INPUT_FILE%" "%OUTPUT_FILE%"

REM Deactivate virtual environment
call venv\Scripts\deactivate.bat

echo.
echo Done! Your CSV file has been created.
pause

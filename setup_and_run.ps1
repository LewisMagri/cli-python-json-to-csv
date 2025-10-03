# JSON to CSV Converter
# Usage: setup_and_run.ps1 [input.json] [output.csv]
# If no parameters provided, will prompt for filenames

param(
    [string]$InputFile,
    [string]$OutputFile
)

Write-Host "JSON to CSV Converter" -ForegroundColor Green
Write-Host "====================" -ForegroundColor Green
Write-Host ""

# If no parameters provided, prompt for them
if (-not $InputFile) {
    $InputFile = Read-Host "Enter the name of your JSON file (e.g., records.json)"
}
if (-not $OutputFile) {
    $OutputFile = Read-Host "Enter the name for your CSV file (e.g., records.csv)"
}

Write-Host ""
Write-Host "Converting $InputFile to $OutputFile..." -ForegroundColor Cyan
Write-Host ""

Write-Host "Setting up virtual environment..." -ForegroundColor Yellow

# Create virtual environment
python -m venv venv

# Activate virtual environment
& ".\venv\Scripts\Activate.ps1"

# Install requirements
Write-Host "Installing requirements..." -ForegroundColor Yellow
pip install -r requirements.txt

# Run the conversion
Write-Host "Converting $InputFile to $OutputFile..." -ForegroundColor Cyan
python json_to_csv.py $InputFile $OutputFile

# Deactivate virtual environment
deactivate

Write-Host ""
Write-Host "Done! Your CSV file has been created." -ForegroundColor Green
Read-Host "Press Enter to continue"

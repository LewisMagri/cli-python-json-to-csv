# JSON to CSV Converter

A simple tool to convert JSON files to CSV format with proper array flattening.

## For Windows Users (Easy Way)

### Option 1: PowerShell (Recommended)
1. **Right-click `setup_and_run.ps1`** and select "Run with PowerShell"
2. **Enter your JSON filename** when prompted (e.g., `records.json`)
3. **Enter your desired CSV filename** when prompted (e.g., `records.csv`)
4. **Wait for it to finish** - it will automatically set everything up
5. **Your CSV file will be ready!**

### Option 2: Command Prompt
1. **Double-click `setup_and_run.bat`**
2. **Enter your JSON filename** when prompted (e.g., `records.json`)
3. **Enter your desired CSV filename** when prompted (e.g., `records.csv`)
4. **Wait for it to finish** - it will automatically set everything up
5. **Your CSV file will be ready!**

## For Mac/Linux Users

1. **Open Terminal**
2. **Navigate to this folder**
3. **Run:** `./setup_and_run.sh input.json output.csv`

## What it does

- ✅ Automatically sets up everything needed
- ✅ Converts JSON to CSV with proper array indexing (0, 1, 2, etc.)
- ✅ Groups related fields together logically
- ✅ Works with any JSON structure
- ✅ No technical knowledge required!

## Files

- `setup_and_run.ps1` - **Windows PowerShell users: Right-click and "Run with PowerShell"**
- `setup_and_run.bat` - **Windows Command Prompt users: Double-click this!**
- `setup_and_run.sh` - **Mac/Linux users: Run in terminal**
- `json_to_csv.py` - Main conversion script
- `requirements.txt` - Python dependencies

## Example

**Windows PowerShell:** Right-click `setup_and_run.ps1` → "Run with PowerShell", enter `records.json`, enter `records.csv`

**Windows Command Prompt:** Double-click `setup_and_run.bat`, enter `records.json`, enter `records.csv`

**Mac/Linux:** `./setup_and_run.sh records.json records.csv`

This will create a CSV file with all your JSON data flattened into columns with proper array indexing.

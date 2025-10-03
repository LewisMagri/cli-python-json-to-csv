#!/bin/bash

# JSON to CSV Converter
# Usage: ./setup_and_run.sh [input.json] [output.csv]
# If no parameters provided, will prompt for filenames

echo "JSON to CSV Converter"
echo "===================="
echo ""

# If no parameters provided, prompt for them
if [ $# -eq 0 ]; then
    read -p "Enter the name of your JSON file (e.g., records.json): " INPUT_FILE
    read -p "Enter the name for your CSV file (e.g., records.csv): " OUTPUT_FILE
elif [ $# -eq 1 ]; then
    INPUT_FILE="$1"
    read -p "Enter the name for your CSV file (e.g., records.csv): " OUTPUT_FILE
else
    INPUT_FILE="$1"
    OUTPUT_FILE="$2"
fi

echo ""
echo "Converting $INPUT_FILE to $OUTPUT_FILE..."
echo ""

echo "Setting up virtual environment..."

# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate

# Install requirements
echo "Installing requirements..."
pip install -r requirements.txt

# Run the conversion
echo "Converting $INPUT_FILE to $OUTPUT_FILE..."
python json_to_csv.py "$INPUT_FILE" "$OUTPUT_FILE"

# Deactivate virtual environment
deactivate

echo ""
echo "Done! Your CSV file has been created."

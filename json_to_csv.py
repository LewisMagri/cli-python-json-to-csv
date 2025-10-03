#!/usr/bin/env python3
import sys
import json
import pandas as pd

def flatten_json(data, parent_key='', sep='.'):
    """Recursively flatten JSON data with proper array indexing"""
    items = []
    
    if isinstance(data, dict):
        for key, value in data.items():
            new_key = f"{parent_key}{sep}{key}" if parent_key else key
            if isinstance(value, (dict, list)):
                items.extend(flatten_json(value, new_key, sep=sep).items())
            else:
                items.append((new_key, value))
    elif isinstance(data, list):
        for i, value in enumerate(data):
            new_key = f"{parent_key}{sep}{i}" if parent_key else str(i)
            if isinstance(value, (dict, list)):
                items.extend(flatten_json(value, new_key, sep=sep).items())
            else:
                items.append((new_key, value))
    else:
        items.append((parent_key, data))
    
    return dict(items)

def convert_json_to_csv(input_file, output_file):
    """Convert JSONL file to CSV with proper array flattening"""
    try:
        # Read JSONL file
        data = []
        with open(input_file, 'r') as f:
            for line in f:
                if line.strip():
                    data.append(json.loads(line))
        
        # Flatten each record individually
        flattened_data = []
        for record in data:
            flattened_record = flatten_json(record)
            flattened_data.append(flattened_record)
        
        # Convert to DataFrame
        df = pd.DataFrame(flattened_data)
        
        # Sort columns in a more logical order
        def sort_key(col):
            """Sort columns by hierarchy and type"""
            parts = col.split('.')
            
            # Group by parent path, then sort alphabetically within each group
            if len(parts) == 1:
                # Top-level fields
                return (0, col)
            else:
                # Group by parent path (everything except the last part)
                parent_path = '.'.join(parts[:-1])
                return (1, parent_path, col)
        
        # Sort columns
        sorted_columns = sorted(df.columns, key=sort_key)
        df = df[sorted_columns]
        
        # Save to CSV
        df.to_csv(output_file, index=False)
        print(f"Successfully converted {input_file} to {output_file}")
        print(f"Created {len(df)} rows with {len(df.columns)} columns")
        print(f"Columns: {list(df.columns)}")
        
    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python json_to_csv.py <input.json> <output.csv>")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    convert_json_to_csv(input_file, output_file)

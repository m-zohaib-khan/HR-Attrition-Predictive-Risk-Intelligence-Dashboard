import pandas as pd
from sqlalchemy import create_engine, text
import urllib.parse
from pathlib import Path
import argparse


parser = argparse.ArgumentParser(description="Load the cleaned HR attrition CSV into MySQL.")
parser.add_argument(
    "csv_path",
    nargs="?",
    default=Path(__file__).with_name("hr_attrition_clean.csv"),
    type=Path,
    help="Path to hr_attrition_clean.csv (defaults to this script's folder)",
)
args = parser.parse_args()
csv_path = args.csv_path.expanduser().resolve()

if not csv_path.is_file():
    raise FileNotFoundError(
        f"CSV file not found: {csv_path}\n"
        "Place hr_attrition_clean.csv beside loaddata.py or pass its path as an argument."
    )

# --- YOUR MYSQL CONNECTION DETAILS ---
DB_USER = "root"
DB_PASSWORD = "zohaib123@#$"  # Your password
DB_HOST = "localhost"
DB_PORT = "3306"
DB_NAME = "hr_attrition_dw"

# Encode special characters in password (@, #, $) safely
encoded_password = urllib.parse.quote_plus(DB_PASSWORD)

# Step 1: Ensure database exists
root_engine = create_engine(f"mysql+pymysql://{DB_USER}:{encoded_password}@{DB_HOST}:{DB_PORT}")
with root_engine.connect() as conn:
    conn.execute(text(f"CREATE DATABASE IF NOT EXISTS {DB_NAME};"))
    print(f"Database '{DB_NAME}' created or verified.")

# Step 2: Connect to hr_attrition_dw database
engine = create_engine(f"mysql+pymysql://{DB_USER}:{encoded_password}@{DB_HOST}:{DB_PORT}/{DB_NAME}")

# Step 3: Load CSV file
df = pd.read_csv(csv_path)

# Step 4: Upload data into 'hr_attrition_staging' table
df.to_sql('hr_attrition_staging', con=engine, if_exists='replace', index=False)

print(" Successfully loaded hr_attrition_staging into MySQL!")

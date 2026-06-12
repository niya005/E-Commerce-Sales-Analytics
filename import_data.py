import pandas as pd
from sqlalchemy import create_engine
from urllib.parse import quote_plus

# Read CSV
df = pd.read_csv(
    "Amazon Sale Report.csv",
    low_memory=False
)

# Clean column names
df.columns = df.columns.str.strip()

# Remove unwanted columns
df = df.loc[:, ~df.columns.str.contains('^Unnamed')]

# Store password
password = "Nitu@2005"

# Encode password safely
encoded_password = quote_plus(password)

# Create connection
engine = create_engine(
    f"mysql+pymysql://root:{encoded_password}@localhost/ecommerce_analysis"
)

print(df.columns)

# Import data into MySQL
df.to_sql(
    name="amazon_sales",
    con=engine,
    if_exists="replace",
    index=False
)

print("Data imported successfully!")
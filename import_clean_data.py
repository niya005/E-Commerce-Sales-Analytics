import pandas as pd
from sqlalchemy import create_engine
from urllib.parse import quote_plus

# Load cleaned CSV
df = pd.read_csv(
    r"D:\Padhai\DA Projects\E-Commerce Sales, Inventory and Supply Chain Analytics\e-commerce dataset\Cleaned data\clean_amazon_sales.csv"
)

# Encode password
password = quote_plus("Nitu@2005")

# Connect to MySQL
engine = create_engine(
    f"mysql+pymysql://root:{password}@localhost/ecommerce_sales_analytics"
)

# Import data
df.to_sql(
    name="amazon_sales",
    con=engine,
    if_exists="replace",
    index=False
)

print("Cleaned data imported successfully!")
# Amazon Sales Analytics

An end-to-end data analysis project built using **Python, SQL, and Power BI** to explore Amazon sales data and uncover insights related to product performance, customer geography, and inventory operations.

The project follows the complete analytics workflow—from raw data sourcing, cleaning to interactive dashboard development.

---

## Project Workflow

```text
Raw Dataset (from kaggle)
     ↓
Python Data Cleaning
     ↓
Exploratory Data Analysis
     ↓
SQL Queries and Business Analysis
     ↓
Feature Engineering
     ↓
Interactive Power BI Dashboard
     ↓
Business Insights
```

---

## Dataset

The dataset contains Amazon e-commerce transactions with information related to:

* Orders
* Products and SKUs
* Categories
* Sizes and colors
* Revenue and quantity sold
* Fulfillment channels
* Shipping details
* Customer locations
* Inventory information

---

## Tools Used

| Tool                    | Purpose                         |
| ------------------------| ------------------------------- |
| Python,Jupyter Notebook | Data cleaning and preprocessing |
| Pandas, NumPy           | Data manipulation               |
| SQL                     | Analytical queries              |
| Power Query             | Data transformation             |
| DAX                     | KPI calculations                |
| Power BI                | Dashboard development           |

---

## Data Cleaning

Using Python and Pandas:

* Removed unnecessary columns
* Standardized column names
* Handled missing values
* Corrected data types
* Removed duplicates
* Created derived columns for analysis

---

## SQL Analysis

Several business questions were explored using SQL:

* Which categories generate the highest revenue?
* Which products sell the most?
* Which states contribute the most revenue?
* How are orders distributed across different statuses?
* Which fulfillment channel handles most orders?

---

## Dashboard Pages

### Executive Overview

![Executive Overview](https://github.com/niya005/E-Commerce-Sales-Analytics/blob/main/Dashboard/Pg1_Executive_Overview.png?raw=true)
* Total Revenue
* Total Orders
* Monthly Revenue Trend
* Order Status Distribution
* Top Categories
* Top States and Cities
* Cancellation Analysis

---

### Product Analysis

![Product Analysis](https://github.com/niya005/E-Commerce-Sales-Analytics/blob/main/Dashboard/Pg2_Product_Analysis.png?raw=true)
* Best Selling Sizes
* Top Selling Colors
* Revenue by Category and Size
* BCG Matrix for Product Categories

---

### Customer & Geography

![Customer & Geography](https://github.com/niya005/E-Commerce-Sales-Analytics/blob/main/Dashboard/Pg3_Customer&Geography.png?raw=true)

* Revenue Heatmap Across India
* Top States by Revenue
* Top Cities by Revenue
* Average Order Value by State
* Revenue Contribution Analysis

---

### Inventory & Operations
![Inventory & Operations]((https://github.com/niya005/E-Commerce-Sales-Analytics/blob/main/Dashboard/Pg4_Inventory&Operations.png?raw=true))

* Inventory KPIs
* Active SKUs
* Design Variants
* Fulfillment Distribution
* Shipment Status Analysis
* Order Funnel
* Inventory Distribution

---

## Key Insights

* Product 'Sets' emerged as the highest revenue-generating category.
* Medium and Large sizes accounted for the majority of sales.
* Maharashtra generated the highest revenue among states.
* Bengaluru contributed the highest city-level revenue.
* Most orders were fulfilled through Amazon.
* Delivered orders significantly outnumbered cancelled and returned orders.

---

## Repository Structure

```text
Amazon-Sales-Analytics
│
├── data
├── notebooks
├── sql_queries
├── dashboard
├── screenshots
├── requirements.txt
├── README.md
```

---

## Future Improvements

* Customer segmentation
* Sales forecasting
* Dynamic drill-through reports
* Inventory health scoring

---


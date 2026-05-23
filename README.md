# 🛒 Zepto E-commerce SQL Data Analyst Portfolio Project

This is a complete, real-world data analyst portfolio project based on an e-commerce inventory dataset scraped from **Zepto** — one of India's fastest-growing quick-commerce startups. This project simulates real analyst workflows, from raw data exploration to business-focused SQL analysis.

This project is perfect for:

- 📊 **Data Analyst aspirants** who want to build a strong portfolio for interviews and LinkedIn
- 📚 **Anyone learning SQL hands-on** with a real-world dataset
- 💼 **Interview preparation** in retail, e-commerce, or product analytics

---

## 📌 Project Overview

The goal is to simulate how actual data analysts in the e-commerce or retail industry use SQL to:

✅ Set up a messy, real-world e-commerce inventory database

✅ Perform **Exploratory Data Analysis (EDA)** to explore product categories, availability, and pricing inconsistencies

✅ Implement **Data Cleaning** to handle null values, remove invalid entries, and convert pricing from paise to rupees

✅ Write **business-driven SQL queries** to derive insights around pricing, inventory, stock availability, revenue, and more

---

## 📁 Dataset Overview

The dataset was originally scraped from **Zepto's official product listings**. It mimics what you'd typically encounter in a real-world e-commerce inventory system.

Each row represents a unique **SKU (Stock Keeping Unit)**. Duplicate product names exist because the same product may appear in different package sizes, weights, or discount tiers — exactly how real catalog data looks.

### 🧾 Columns

| Column | Description |
|---|---|
| `sku_id` | Unique identifier for each product entry (Synthetic Primary Key) |
| `name` | Product name as it appears on the app |
| `category` | Product category (Fruits, Snacks, Beverages, etc.) |
| `mrp` | Maximum Retail Price (originally in paise, converted to ₹) |
| `discountPercent` | Discount applied on MRP |
| `discountedSellingPrice` | Final price after discount (also converted to ₹) |
| `availableQuantity` | Units available in inventory |
| `weightInGms` | Product weight in grams |
| `outOfStock` | Boolean flag indicating stock availability |
| `quantity` | Number of units per package |

---

## 🔧 Project Workflow

### 1. 🏗️ Database & Table Creation

```sql
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountedSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outOfStock BOOLEAN,
  quantity INTEGER
);
```

### 2. 📥 Data Import

Loaded CSV using pgAdmin's import feature. If you face encoding issues, use:

```sql
\copy zepto(category, name, mrp, discountPercent, availableQuantity,
            discountedSellingPrice, weightInGms, outOfStock, quantity)
FROM 'data/zepto_v2.csv' WITH (FORMAT csv, HEADER true, DELIMITER ',', QUOTE '"', ENCODING 'UTF8');
```

> ⚠️ If you face a UTF-8 encoding error, save the CSV as **CSV UTF-8** format and retry.

### 3. 🔍 Data Exploration

- Counted the total number of records in the dataset
- Viewed a sample of the dataset to understand structure and content
- Checked for **null values** across all columns
- Identified **distinct product categories** in the dataset
- Compared **in-stock vs out-of-stock** product counts
- Detected products present multiple times as different SKUs

### 4. 🧹 Data Cleaning

- Identified and removed rows where **MRP or discounted selling price was zero**
- Converted `mrp` and `discountedSellingPrice` from **paise to rupees** for readability

### 5. 📊 Business Insights (SQL Queries)

| # | Business Question |
|---|---|
| Q1 | Top 10 best-value products based on discount percentage |
| Q2 | High-MRP products that are currently out of stock |
| Q3 | Estimated revenue per product category |
| Q4 | Expensive products (MRP > ₹500) with minimal discount (< 10%) |
| Q5 | Top 5 categories offering highest average discount |
| Q6 | Price per gram for products above 100g — best value sort |
| Q7 | Products grouped by weight: Low / Medium / Bulk |
| Q8 | Total inventory weight per product category |

---

## 🛠️ How to Use This Project

**1. Clone the repository**
```bash
git clone https://github.com/your-username/zepto-sql-analysis.git
cd zepto-sql-analysis
```

**2. Open `zepto_analysis.sql`**

This file contains:
- Table creation
- Data exploration queries
- Data cleaning steps
- Business analysis queries

**3. Set up PostgreSQL**
- Open **pgAdmin** or any PostgreSQL client
- Create a new database
- Run the SQL file
- Import the dataset (convert to UTF-8 if necessary)

---

## 📁 File Structure

```
zepto-sql-analysis/
│
├── zepto_analysis.sql     # All SQL queries
├── data/
│   └── zepto_v2.csv       # Raw dataset
└── README.md              # Project documentation
```

---

## 📜 License

MIT — feel free to fork ⭐, star, and use in your own portfolio.

---

## 👨‍💻 About the Author

Hey, I'm **Ram Kishore L R** — a passionate Data Analyst who enjoys turning raw data into meaningful business insights using SQL and analytics tools.

### 🚀 Let's Connect

💼 [LinkedIn — Ram Kishore L R](https://www.linkedin.com/in/ramkishore87/)

---

💡 *Thanks for checking out the project! Feel free to ⭐ star this repo or share it with someone learning SQL.* 🚀

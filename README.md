# 🛒 Zepto Product Data Analysis — SQL

A structured SQL project analyzing Zepto's product catalog to uncover pricing trends, discount patterns, inventory insights, and estimated category-level revenue.

---

## 📌 Project Overview

This project performs end-to-end data analysis on a Zepto grocery dataset using **PostgreSQL**. It covers data ingestion, exploration, cleaning, and business-focused querying — designed as a portfolio project to demonstrate real-world SQL skills.

---

## 🗂️ Dataset

| Column | Description |
|---|---|
| `sku_id` | Unique product identifier |
| `category` | Product category |
| `name` | Product name |
| `mrp` | Maximum Retail Price |
| `discountPercent` | Discount offered (%) |
| `discountedSellingPrice` | Final price after discount |
| `weightInGms` | Product weight in grams |
| `availableQuantity` | Units available in inventory |
| `outOfStock` | Stock availability (boolean) |
| `quantity` | Quantity per unit |

---

## 🔍 What's Covered

### 1. Data Exploration
- Row count and sample data preview
- Null value checks across all columns
- Distinct product categories
- In-stock vs out-of-stock product counts
- Products with duplicate SKUs

### 2. Data Cleaning
- Removed products with MRP = 0
- Converted prices from **paise to rupees** (divided by 100)

### 3. Business Analysis Queries

| # | Question |
|---|---|
| Q1 | Top 10 best-value products by discount percentage |
| Q2 | High MRP products that are currently out of stock |
| Q3 | Estimated revenue per category |
| Q4 | Premium products (MRP > ₹500) with low discounts (< 10%) |
| Q5 | Top 5 categories by average discount percentage |
| Q6 | Price per gram for products above 100g (best value sort) |
| Q7 | Products grouped by weight: Low / Medium / Bulk |
| Q8 | Total inventory weight per category |

---

## 💡 Key Insights

- Several high-MRP products are out of stock, representing potential lost revenue
- A few categories consistently offer higher discounts than others
- Price-per-gram analysis reveals which products offer the best value for money
- Bulk weight products are concentrated in specific categories

---

## 🛠️ Tech Stack

- **Database:** PostgreSQL
- **Language:** SQL
- **Concepts Used:** Aggregations, Filtering, CASE statements, CTEs (implicit), Window logic, Data type conversion

---

## 🚀 How to Run

1. Set up a PostgreSQL database
2. Run the table creation script to create the `zepto` table
3. Import your dataset (CSV or manual inserts)
4. Execute the queries in order — exploration → cleaning → analysis

```sql
-- Start here
DROP TABLE IF EXISTS zepto;
CREATE TABLE zepto ( ... );

-- Then run exploration, cleaning, and analysis queries
```

---

## 📁 File Structure

```
zepto-sql-analysis/
│
├── zepto_analysis.sql     # All SQL queries (exploration + cleaning + analysis)
└── README.md              # Project documentation
```

---

## 🙋‍♂️ Author

**Ram Kishore L R**  
 • [Linkedin](https://www.linkedin.com/in/ramkishore87/)


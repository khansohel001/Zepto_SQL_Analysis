# 🛒 Zepto E-commerce Inventory Analysis – SQL Portfolio Project

A comprehensive data analysis project simulating the full workflow of an e-commerce analyst, from database setup and data cleaning to generating actionable business insights using **Microsoft SQL Server**.

---

## 🎯 Project Objective

The main purpose of this project is to replicate real-world quick-commerce analytics tasks by transforming raw inventory data into strategic business intelligence.

| Objective | Status |
| :--- | :--- |
| **Database Setup** | ✅ Completed |
| **Data Cleaning & Preprocessing** | ✅ Completed |
| **Exploratory Data Analysis (EDA)** | ✅ Completed |
| **Insight Generation (SQL)** | ✅ Completed |

---

## 🚀 Who This Project Is For

This project is a strong demonstration of practical SQL skills, ideal for:

* **📊 Aspiring Data Analysts** seeking a strong, practical project to showcase on LinkedIn or in interviews.
* **📚 SQL Learners** wanting real-world, end-to-end dataset experience beyond basic joins.
* **💼 Candidates** preparing for roles in retail, e-commerce, or product analytics.

---

## 📂 Dataset and Column Details

The dataset was sourced from Zepto's inventory listings, reflecting complex, real-world catalog behavior (e.g., duplicate product names for different packaging/weights).

Each row corresponds to a unique **SKU (Stock Keeping Unit)**.

| Column | Data Type | Description |
| :--- | :--- | :--- |
| **sku_id** | `INT` (Identity/PK) | Unique identifier for each SKU. |
| **name** | `VARCHAR` | Product name as listed on Zepto. |
| **category** | `VARCHAR` | Product category (e.g., Fruits, Snacks, Beverages). |
| **mrp** | `DECIMAL(8,2)` | Maximum Retail Price (converted to ₹). |
| **discountPercent** | `DECIMAL(5,2)` | Discount percentage applied on the MRP. |
| **discountedSellingPrice** | `DECIMAL(8,2)` | Final selling price after discount (₹). |
| **availableQuantity** | `INT` | Number of units currently in inventory. |
| **weightInGms** | `INT` | Product weight in grams. |
| **outOfStock** | `BIT` | Stock status (**1** = Out of Stock, **0** = In Stock). |
| **quantity** | `INT` | Units per package (or weight for loose items). |

---

## 🧹 Data Cleaning and Preparation

The `zepto_SQL_data_analysis.sql` file includes critical data cleaning steps to ensure reliable analysis:

* **Handling Missing Keys:** Ensured `sku_id` (Primary Key) was added as an **`IDENTITY(1,1)`** column, as the raw flat file lacked unique identifiers.
* **Price Cleaning:** Deleted entries where **MRP was ₹0**.
* **Data Transformation:** **Converted all price columns** (`mrp`, `discountedSellingPrice`) from **Paise to Rupees (₹)** by dividing by 100, aligning the data with required currency standards.

---

## 💡 Key Business Insights Generated

The following strategic questions were answered using advanced SQL techniques (Window Functions, Aggregation, and Conditional Logic):

* **Best-Value Products:** Identified **top 10 best-value products** based on the highest `discountPercent`.
* **Inventory Gaps:** Identified **high-MRP products (>$300)** that are currently **out of stock** (Q2), flagging critical restocking opportunities.
* **Category Performance:** Estimated **potential revenue** for each product category (Q3) by calculating `SUM(discountedSellingPrice * availableQuantity)`.
* **Premium Pricing:** Filtered **expensive products (MRP > ₹500)** with **minimal discount (< 10%)**, identifying premium and low-promotion items.
* **Promotional Intensity:** Ranked **top 5 categories** offering the highest **average discounts** (Q5).
* **Value-for-Money:** Calculated **price per gram** (Q6) for products $\ge 100\text{g}$ to identify true value-for-money items.
* **Logistics Grouping:** Grouped products based on weight into **Low ($<1000\text{g}$), Medium ($<5000\text{g}$), and Bulk** categories (Q7).
* **Warehouse Load:** Measured **total inventory weight** per product category (Q8) for logistics and warehouse planning.

---

## 🛠️ How to View the Project

The complete SQL workflow, including table creation, EDA queries, cleaning scripts, and all 8 business analysis queries, is contained in:

👉 **`zepto_Code.sql`**

---

**Thanks for checking out the project! Your support and feedback are highly valued.**

**Zepto E-commerce Inventory Analysis – SQL Portfolio Project**

This project is a hands-on Data Analyst portfolio exercise built on an e-commerce inventory dataset sourced from Zepto, one of India’s fastest-growing quick-commerce startups. It simulates the full workflow of a data analyst, from initial data exploration to generating actionable business insights using SQL.

**🚀 Who This Project Is For**

📊 Aspiring Data Analysts seeking a strong, practical project to showcase on LinkedIn or in interviews

📚 SQL learners wanting real-world, end-to-end dataset experience

💼 Candidates preparing for roles in retail, e-commerce, or product analytics

**📌 Project Objective**

The main purpose of this project is to replicate real-world e-commerce analytics tasks by:

✅ Setting up and managing a realistic, raw inventory database

✅ Performing Exploratory Data Analysis (EDA) to investigate product categories, stock levels, and pricing trends

✅ Cleaning the data: addressing null values, removing invalid entries, and converting prices from paise to rupees

✅ Writing insight-driven SQL queries to analyze pricing, discounts, inventory, revenue, and stock availability

**📁 About the Dataset**

The dataset was scraped from Zepto’s official listings and reflects what analysts typically encounter in real-world e-commerce inventory systems.

Each row corresponds to a unique SKU (Stock Keeping Unit).

Duplicate product names exist because the same product may be listed multiple times with different packaging, weights, or discounts, just like in real catalog systems.

**🧾 Column Details**
Column	Description
sku_id	Unique identifier for each SKU (Primary Key)
name	Product name as listed on Zepto
category	Product category (e.g., Fruits, Snacks, Beverages)
mrp	Maximum Retail Price (converted from paise to ₹)
discountPercent	Discount percentage applied on the MRP
discountedSellingPrice	Selling price after discount (₹)
availableQuantity	Number of units currently in inventory
weightInGms	Product weight in grams
outOfStock	Stock status (1 = Out of Stock, 0 = In Stock)
quantity	Units per package (or weight for loose items)

# SQL Customer Cohort Analysis

SQL + Python project analyzing **customer retention and purchasing behavior** using cohort analysis.

Dataset used: **Olist Brazilian E-commerce Dataset**

---

# Project Objective

The goal of this project is to analyze customer purchasing patterns and understand **customer retention over time**.

Using SQL and Python, we:

• explore order behavior  
• analyze repeat purchases  
• identify dominant payment methods  
• perform cohort analysis to measure retention  

---

# Tools & Technologies

- SQL (MySQL)
- Python
- Pandas
- Seaborn
- Matplotlib
- Jupyter Notebook

---

# Dataset

Source: Kaggle  
Dataset: Olist Brazilian E-commerce Dataset

Key tables used:

- customers
- orders
- order_items
- order_payments

---

# Project Structure
sql-customer-cohort-analysis
│
├── SQL
│ ├── 01_data_setup.sql
│ ├── 02_sql_eda.sql
│ ├── 03_customer_behavior.sql
│ └── 04_cohort_analysis.sql
│
├── data
│ └── cohort_table.csv
│
├── notebook
│ └── notebooks.cohort.analysis.ipynb


---

# Key Analyses

## 1. Exploratory Data Analysis

Using SQL we analyzed:

- total orders
- revenue
- average order value
- orders per customer
- payment method distribution

---

## 2. Customer Behavior

Customer purchase frequency analysis showed:

| Orders | Customers |
|------|------|
| 1 | ~93k |
| 2 | ~2700 |
| 3+ | very small |

**Insight:**  
Most customers purchase only once.

---

## 3. Payment Method Analysis

Credit cards dominate the payment ecosystem in this dataset.

---

## 4. Cohort Retention Analysis

Customers were grouped based on their **first purchase month**.

We then measured how many returned in subsequent months.

The results were visualized using a **cohort heatmap**.

---

# Cohort Retention Heatmap


![Cohort Heatmap](Screenshot%202026-03-05%20190053.png)

---

# Key Insights

• ~97% of customers place only one order  
• repeat purchasing is extremely low  
• retention drops sharply after the first month  
• credit cards are the dominant payment method  

---

# Skills Demonstrated

- SQL joins and aggregations
- cohort analysis
- customer segmentation
- analytical SQL
- Python data visualization
- exploratory data analysis

---

# Author

Shrijan Samrat  
IIT Madras BS – Data Science & Applications

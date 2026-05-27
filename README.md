# Olist-ecommerce-analysis
End-to-end e-commerce analysis on 100K+ real orders from Brazil's Olist platform. Covers data cleaning in Python, business queries in MySQL, Power BI dashboard, and statistical hypothesis testing. Key findings: late deliveries kill ratings, 97% customers never return, credit card users spend the most.
#  Olist E-Commerce Dataset Analysis

A end-to-end data analysis project on a real-world Brazilian e-commerce dataset using **Python**, **MySQL**, and **Power BI**.

---

##  Project Overview

This project analyzes ~1 lakh orders from the Olist platform (2016–2018) to uncover insights about customer behavior, delivery performance, payment preferences, and revenue patterns.

**Tools Used:** Python (Pandas) · MySQL · Power BI

---

##  Repository Structure

```
├── python_work.ipynb          # Data cleaning, merging & statistical testing
├── sql_work_analysis.sql      # 8 business queries in MySQL
├── dashboard.pbix             # Power BI dashboard
└── Book_report.pdf            # Full analysis report
```

---

##  Key Findings

| # | Finding |
|---|---------|
| 1 | Late deliveries have a **statistically significant negative impact** on review scores (T-stat: 125.78, p=0.0) |
| 2 | **Credit card users** place significantly higher value orders than boleto users (p ≈ 8.01e-53) |
| 3 | Product price has **no significant effect** on review scores (p = 0.057) |
| 4 | **93.5%** of orders are delivered on time — but northern states (RR, AP, AM) face 3x longer delivery times |
| 5 | **Health & Beauty** is the top revenue-generating category |
| 6 | **97% of customers** never made a second purchase |

---

##  2.1 Data Cleaning & Merging (Python)

- Loaded all 9 raw CSV files using Pandas
- Merged tables via left joins on `order_id`, `customer_id`, `product_id`
- Engineered two new features:
  - `delivery_days` — days from purchase to delivery
  - `delay_days` — difference between actual and estimated delivery (positive = late)
- Filtered to **delivered orders only** → 115,715 rows × 41 columns
- Filled missing category names as `'unknown'`; imputed missing review scores with median

---

##  2.2 Business Queries (MySQL)

8 business queries were executed on the cleaned dataset:

| Query | Key Finding |
|-------|-------------|
| Top 10 Categories by Revenue | Health & Beauty leads |
| Payment Type Distribution | Credit card dominates at **76.8%** |
| Review Score Distribution | Score 5 is most common |
| Top 10 States by Orders | SP accounts for the majority |
| Avg Delivery Days by State | RR, AP, AM average **25+ days** |
| Repeat Purchase Rate | **97%** of customers bought only once |
| Avg Order Value by Payment | Credit card users spend the most |
| Late vs On-Time Delivery | **93.5%** on-time delivery rate |

---

##  2.3 Dashboard (Power BI)

The Power BI dashboard includes interactive filters for payment type, delivery status, customer state, and review score. It visualizes:

- Top 10 categories by revenue
- Geographic revenue distribution by state
- Delivery performance by state
- Payment type breakdown
- Review score distribution
- Late vs on-time delivery ratio

> SP state alone generates ~6M in revenue — far exceeding any other state.

---

##  Statistical Hypotheses

### H1: Late deliveries → lower review scores ✅ VALIDATED
- **Test:** Independent T-test
- **T-stat:** 125.78 | **p-value:** 0.0
- Customers with late orders rated significantly lower than on-time recipients.

### H2: Credit card users place higher value orders than boleto users ✅ VALIDATED
- **Test:** Independent T-test
- **T-stat:** 15.26 | **p-value:** 8.01e-53
- Credit card users spend significantly more per order.

### H3: More expensive products get better reviews ❌ NOT VALIDATED
- **Test:** Independent T-test
- **Avg Review (Cheap):** 4.08 | **Avg Review (Expensive):** 4.09
- **T-stat:** 1.58 | **p-value:** 0.057
- No statistically significant difference found.

---

##  Actionables

**1. Proactive Delay Alerts**
States like RR, AP, AM have 25+ day average delivery times. Send customers proactive alerts when delays are likely, along with a small discount to preserve satisfaction.

**2. Re-engagement Campaign for One-Time Buyers**
97% of customers never returned. A follow-up email/notification within 30 days of first purchase (with product recommendations) — targeting credit card users first — could significantly improve retention.

---

##  Further Exploration

> Why do some product categories receive bad reviews even when delivered on time?

Future analysis could identify whether poor reviews in on-time orders stem from product quality issues, misleading listings, or specific seller behavior — enabling the platform to flag underperforming sellers.

---

##  LLM Usage Disclosure

Claude AI was used for:
- Pandas merge and datetime conversion syntax
- Suggestions for null value handling
- Guidance on choosing T-test vs. correlation
- Code debugging assistance
- Report structure suggestions

All analysis decisions, hypotheses, business insights, and observations were made independently.


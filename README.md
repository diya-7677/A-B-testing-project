# A/B Testing Product Experimentation Analytics

A product analytics project simulating a real-world **A/B testing framework** used by product companies to evaluate the impact of UI changes on user engagement and conversion performance.

## Project Objective

Analyze whether redesigning a **Call-To-Action (CTA) button** improves user behavior and supports feature rollout decisions.

Users were divided into:

* **Variant A** → Existing UI (Control Group)
* **Variant B** → Redesigned UI (Treatment Group)

---

## Dataset Scale

* 40,000 Users
* 80,000 Sessions
* 13,600 Click Events
* 7,600 Conversions

Synthetic behavioral dataset generated using Python and analyzed in MySQL.

---

## Tech Stack

* MySQL
* SQL
* Python
* Pandas
* NumPy
* Power BI

---

## Metrics Analyzed

* Click Through Rate (CTR)
* Conversion Rate
* Conversion Uplift
* Bounce Rate
* Average Session Duration

---

## Key Results

| Metric               | Variant A | Variant B  |
| -------------------- | --------- | ---------- |
| CTR                  | 30%       | 38%        |
| Conversion Rate      | 18%       | 20%        |
| Avg Session Duration | 145 sec   | 172 sec    |
| Bounce Rate          | 25%       | 18%        |
| Conversion Uplift    | —         | **11.11%** |

---

## Business Insights

* Higher user engagement with redesigned UI
* Improved conversion performance in treatment group
* Lower bounce rate indicating stronger retention
* Increased session duration showing deeper interaction

### Final Decision

**Variant B outperformed control group and is recommended for product rollout.**

---

## SQL Concepts Used

* Joins
* CTEs
* Aggregate Functions
* Cohort Analysis
* Behavioral Analytics
* Product Experimentation Analysis

---

## Project Architecture

Users → Sessions → Clicks → Conversions → Events → Experiment Groups

---

This project simulates experimentation workflows commonly used in modern product-based technology companies for data-driven product decisions.

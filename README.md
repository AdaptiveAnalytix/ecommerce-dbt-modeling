# Ecommerce Data Transformation (dbt) ❄️

![dbt](https://img.shields.io/badge/dbt-core-orange.svg)
![Snowflake](https://img.shields.io/badge/warehouse-snowflake-blue.svg)

## 🏗 Architecture
This project manages the **T (Transformation)** in our ELT pipeline. It takes raw data loaded via Fivetran and transforms it into analysis-ready models using **dbt (data build tool)**.

## 🔄 Data Lineage
1.  **Staging (`stg_`)**: Cleaned raw data (renaming columns, casting types).
2.  **Intermediate (`int_`)**: Complex joins and logic.
3.  **Marts (`mrt_`)**: Business-level tables ready for BI tools (Looker/Tableau).

## ✅ Data Quality
We utilize `schema.yml` to enforce testing on primary keys and revenue columns to ensure zero data drift.

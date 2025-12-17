# **Accident Analytics Pipeline — DATA226**
*(Airflow → Snowflake → dbt → Tableau)*

## 📘 Overview
This project implements a complete ELT (Extract–Load–Transform) data pipeline designed to automate traffic accident analytics for Santa Clara County using modern data engineering tooling.

The pipeline includes:

1. Extraction — historical crash CSV + live weather + live traffic data  
2. Loading — store raw data in Snowflake RAW schema  
3. Transformation — dbt models: staging → intermediate → marts  
4. Visualization — Tableau dashboards for trends, risk hotspots, weather effects  

---

## 🧱 Architecture Diagram

To include the diagram, paste this *directly* into GitHub:

\`\`\`mermaid
flowchart LR
    CSV[Historical Crash Data\n(CSV)] --> A[Airflow Ingestion DAGs]
    WEATHER[OpenWeather API] --> A
    TRAFFIC[Google Distance Matrix API] --> A
    A --> RAW[Snowflake RAW Schema]
    RAW --> DBT[dbt Models: Staging → Intermediate → Marts]
    DBT --> MART[Snowflake MART Schema]
    MART --> TABLEAU[Tableau Dashboards]
    TABLEAU --> INSIGHTS[Risk Hotspots\nWeather Impact\nCrash Forecasts]
\`\`\`

---

## 📁 Repository Structure

\`\`\`
.
├── dags/                         # Airflow DAGs for ingestion + dbt
├── data/                         # Historical accident dataset(s)
├── tableau/                      # Tableau dashboards / screenshots
├── compose.yaml                  # Docker Compose for Airflow environment
└── README.md
\`\`\`

---

## 🔧 Prerequisites

- Python 3.10+  
- Docker & Docker Compose  
- Snowflake account  
- dbt-core + dbt-snowflake  
- Tableau Desktop / Tableau Public  
- API keys:
  - OpenWeatherMap  
  - Google Distance Matrix API  

---

## 🔐 Required Environment Variables

\`\`\`
export SNOWFLAKE_ACCOUNT="<account>"
export SNOWFLAKE_USER="<user>"
export SNOWFLAKE_PASSWORD="<password>"
export SNOWFLAKE_ROLE="DATA226_ROLE"
export SNOWFLAKE_WAREHOUSE="COMPUTE_WH"
export SNOWFLAKE_DATABASE="ACCIDENT_DW"
export SNOWFLAKE_SCHEMA="RAW"

export OPENWEATHER_API_KEY="<weather_key>"
export GOOGLE_DISTANCE_MATRIX_API_KEY="<maps_key>"

export DBT_PROFILES_DIR="$(pwd)/dbt"
export AIRFLOW_HOME="$(pwd)/.airflow"
\`\`\`

---

## 🌀 Airflow Configuration

### 1. Start Airflow
\`\`\`
docker-compose -f compose.yaml up --build
\`\`\`

### 2. Airflow UI
http://localhost:8080  
Login: airflow / airflow  

### 3. Snowflake Connection (snowflake_conn)


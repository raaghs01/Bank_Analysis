# Banking Data Analysis and Loan Insights Dashboard

End-to-end data analytics pipeline — SQL extraction, Python EDA, and an interactive Power BI dashboard — built to uncover loan approval trends, customer segmentation patterns, and marketing campaign performance across 3,000 banking client records.

---

## Project Overview

This project simulates a real-world banking analytics workflow. Starting from raw client data, it moves through SQL querying, exploratory data analysis in Python, and culminates in a fully interactive Power BI dashboard designed for business decision-making.

**Key outcomes:**
- Loan approval rate identified at **18.2%**
- Customers aged **30–40** showed the highest conversion rates
- **Direct marketing** outperformed phone-based outreach in long-term conversions
- Risk weighting and loyalty tier patterns surfaced through correlation analysis

---

## Tech Stack

| Layer | Tool |
|---|---|
| Data Storage | MySQL |
| Data Processing | Python (Pandas, NumPy) |
| Visualization (EDA) | Matplotlib, Seaborn |
| Business Intelligence | Power BI |
| Notebook Environment | Jupyter |

---

## Project Structure

```
Banking-analysis-main/
├── bankEDA.ipynb              # Exploratory data analysis — distributions, correlations, segmentation
├── sql_connector.ipynb        # MySQL connection script to load data via environment variables
├── SQLQuery_1.sql             # SQL query used for KPI extraction
├── banking-clients.csv        # Synthetic dataset — 3,000 client records, 25 columns
├── Banking Dashboard (2025).pbix  # Interactive Power BI dashboard (latest version)
├── Designs.pptx               # Design mockups and presentation slides
├── .env.example               # Template for local database credentials
└── requirements.txt           # Python dependencies
```

---

## Dataset Schema

The dataset (`banking-clients.csv`) contains **3,000 synthetic client records** across **25 columns**:

| Column | Description |
|---|---|
| Client ID | Unique client identifier (e.g. `IND81288`) |
| Name | Client name |
| Age | Client age |
| Location ID | Branch/region reference ID |
| Joined Bank | Date client joined (DD-MM-YYYY) |
| Banking Contact | Assigned relationship manager |
| Nationality | Client nationality |
| Occupation | Job title |
| Fee Structure | Fee tier: High / Mid / Low |
| Loyalty Classification | Jade / Silver / Gold / Platinum |
| Estimated Income | Annual estimated income |
| Superannuation Savings | Retirement savings balance |
| Bank Deposits | Total bank deposits held |
| Checking Accounts | Checking account balance |
| Saving Accounts | Savings account balance |
| Foreign Currency Account | Foreign currency holdings |
| Business Lending | Business loan balance |
| Amount of Credit Cards | Number of credit cards held |
| Credit Card Balance | Outstanding credit card balance |
| Bank Loans | Personal loan balance |
| Properties Owned | Number of properties owned (0–3) |
| Risk Weighting | Risk score (1–5, low to high) |
| BRId | Business region reference ID |
| GenderId | Gender reference ID (1 = Male, 2 = Female) |
| IAId | Industry/asset class reference ID |

> **Note:** All client records are synthetic and contain no real personal data.

---

## Analysis Performed

### 1. Exploratory Data Analysis (`bankEDA.ipynb`)
- **Descriptive statistics** — mean, standard deviation, quartiles for all numeric columns
- **Distribution analysis** — histograms and KDE plots for age, income, account balances
- **Correlation heatmap** — 9-variable matrix identifying strong positive correlations between deposit types
- **Categorical breakdowns** — value counts for nationality, occupation, loyalty tier, fee structure
- **Income segmentation** — clients binned into Low / Med / High income bands using `pd.cut()`
- **Bivariate analysis** — cross-variable plots examining risk vs. income, age vs. loan balances

### 2. SQL KPI Extraction (`SQLQuery_1.sql`, `sql_connector.ipynb`)
- Queried the full dataset from a local MySQL instance
- Extracted KPIs: average client age, loan approval rates, campaign contact frequencies

### 3. Power BI Dashboard (`Banking Dashboard (2025).pbix`)
- **Filters:** Age group, job type, nationality, loyalty tier
- **KPIs displayed:** Conversion rate, average campaign contacts, balance distribution
- **Charts:** Bar charts, heatmaps, line trends, segmented funnels
- Supports drill-through on customer segments for actionable targeting insights

---

## Setup Instructions

### Python (EDA Notebook)

1. Clone the repository:
   ```bash
   git clone https://github.com/<your-username>/Banking-analysis.git
   cd Banking-analysis
   ```

2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Open and run `bankEDA.ipynb` in Jupyter — no database needed, it reads directly from `banking-clients.csv`.

### MySQL Connector (Optional)

1. Import `banking-clients.csv` into a MySQL database named `banking`, table `banking-clients`.

2. Copy `.env.example` to `.env` and fill in your credentials:
   ```bash
   cp .env.example .env
   ```

3. Run `sql_connector.ipynb` to load data via the database connection.

### Power BI Dashboard

1. Open `Banking Dashboard (2025).pbix` in [Power BI Desktop](https://powerbi.microsoft.com/desktop/).
2. The dashboard works offline against the embedded data model — no live connection required.

---

## Key Insights

| Insight | Finding |
|---|---|
| Loan approval rate | 18.2% of clients had active bank loans |
| Peak conversion cohort | Clients aged 30–40 showed highest loan uptake |
| Risk by occupation | Blue-collar and self-employed segments had higher risk weightings |
| Campaign channel | Direct marketing outperformed phone outreach in conversions |
| Asset correlation | Bank Deposits strongly correlated with Checking and Saving account balances |
| Average client age | 41.2 years |

---

## Future Enhancements

- Integrate a live SQL database feed for real-time Power BI refresh
- Build a loan eligibility scoring model (logistic regression or XGBoost)
- Automate monthly KPI reports via Power BI Service scheduled refresh
- Add geospatial analysis by mapping Location IDs to regions

---

## License

Open-source for educational and portfolio purposes.

# Banking Data Analysis Dashboard

End-to-end data analytics workflow — SQL extraction, Python EDA, and an interactive Power BI dashboard — built on **3,000 synthetic banking client records** to explore customer demographics, account-balance distributions, and segmentation patterns (income band, loyalty tier, risk weighting).

---

## Project Overview

This project simulates a banking analytics workflow on synthetic data. Starting from a flat client dataset, it moves through an optional SQL ingestion step, exploratory data analysis in Python, and a Power BI dashboard for business-style reporting.

**What the analysis actually covers:**
- Descriptive statistics and distribution analysis across all numeric fields
- Customer segmentation by income band, loyalty tier, nationality, and risk weighting
- Correlation analysis across account-balance and lending columns

> **Scope note:** The dataset contains client demographics, account balances, and lending balances only. It has **no marketing-campaign, loan-approval, or conversion fields**, so no campaign-performance or approval-rate analysis is performed. Earlier versions of this README described such metrics — they were not supported by the data and have been removed.

---

## Tech Stack

| Layer | Tool |
|---|---|
| Data Storage (optional) | MySQL 8.0 |
| Data Processing | Python (Pandas, NumPy) |
| Visualization (EDA) | Matplotlib, Seaborn |
| Business Intelligence | Power BI |
| Notebook Environment | Jupyter / VS Code |

---

## Project Structure

```
Banking-analysis-main/
├── bankEDA.ipynb                   # Exploratory data analysis — stats, distributions, segmentation, correlations
├── sql_connector.ipynb             # Optional: loads the dataset from a local MySQL database via .env credentials
├── SQLQuery_1.sql                  # Scratch SQL query (SELECT *); not part of the analysis pipeline
├── setup_db.sql                    # Creates the `banking` schema + `banking-clients` table and loads the CSV
├── banking-clients.csv             # Synthetic dataset — 3,000 client records, 25 columns
├── Banking Dashboard (2025).pbix   # Interactive Power BI dashboard (latest version)
├── Banking Dashboard.pbix          # Earlier Power BI dashboard version
├── .env.example                    # Template for local MySQL credentials
├── .gitignore
└── requirements.txt                # Python dependencies
```

---

## Dataset Schema

`banking-clients.csv` contains **3,000 synthetic client records** across **25 columns**:

| Column | Description |
|---|---|
| Client ID | Unique client identifier (e.g. `IND81288`) |
| Name | Client name |
| Age | Client age (17–85) |
| Location ID | Branch/region reference ID |
| Joined Bank | Date client joined (DD-MM-YYYY) |
| Banking Contact | Assigned relationship manager |
| Nationality | Client nationality |
| Occupation | Job title |
| Fee Structure | Fee tier: High / Mid / Low |
| Loyalty Classification | Jade / Silver / Gold / Platinum |
| Estimated Income | Annual estimated income |
| Superannuation Savings | Retirement savings balance |
| Amount of Credit Cards | Number of credit cards held (1–3) |
| Credit Card Balance | Outstanding credit card balance |
| Bank Loans | Personal loan balance |
| Bank Deposits | Total bank deposits held |
| Checking Accounts | Checking account balance |
| Saving Accounts | Savings account balance |
| Foreign Currency Account | Foreign currency holdings |
| Business Lending | Business loan balance |
| Properties Owned | Number of properties owned (0–3) |
| Risk Weighting | Risk score (1–5, low to high) |
| BRId | Business region reference ID (1–4) |
| GenderId | Gender reference ID (1 = Male, 2 = Female) |
| IAId | Industry/asset class reference ID (1–22) |

> **Note:** All client records are synthetic and contain no real personal data.

---

## Analysis Performed

### 1. Exploratory Data Analysis (`bankEDA.ipynb`)
- **Descriptive statistics** — `.info()`, `.describe()`, shape checks across all 25 columns
- **Income segmentation** — clients binned into Low / Med / High bands with `pd.cut()`
- **Univariate analysis** — value counts and count plots for categorical fields (nationality, occupation, loyalty tier, fee structure, risk weighting, region, gender)
- **Bivariate analysis** — categorical breakdowns split by nationality
- **Numerical distributions** — histograms with KDE for the 9 balance/lending columns
- **Correlation heatmap** — 9-variable matrix over the account-balance and lending fields

> The notebook currently reads the CSV from a hardcoded Colab path (`/content/Banking.csv`). To run it locally, change that line to `pd.read_csv('banking-clients.csv')`.

### 2. SQL Ingestion (optional — `setup_db.sql`, `sql_connector.ipynb`)
- `setup_db.sql` creates the `banking` schema and `banking-clients` table and loads the CSV via `LOAD DATA LOCAL INFILE`
- `sql_connector.ipynb` connects to the local MySQL instance using credentials from `.env` and loads the table into a DataFrame
- This path is **not required** — the EDA notebook works directly from the CSV

### 3. Power BI Dashboard (`Banking Dashboard (2025).pbix`)
- Interactive dashboard over the same dataset, with filters and visuals for demographic and financial segmentation
- Works offline against the embedded data model — no live connection required

---

## Setup Instructions

### Python (EDA Notebook)

1. Create and activate a virtual environment:
   ```powershell
   python -m venv .venv
   .\.venv\Scripts\Activate.ps1
   ```

2. Install dependencies:
   ```powershell
   pip install pandas numpy matplotlib seaborn mysql-connector-python python-dotenv ipykernel
   ```
   > On very new Python versions (3.13+), installing the full `jupyter`/`jupyterlab` meta-packages from `requirements.txt` can fail on Windows due to long-path limits. The packages above are all the notebooks actually need; run them inside VS Code's notebook editor.

3. Open `bankEDA.ipynb`, select the `.venv` kernel, and run all cells. (Adjust the CSV path as noted above.)

### MySQL Ingestion (Optional)

1. Ensure MySQL 8.0 is running locally.

2. Load the data:
   ```powershell
   Get-Content setup_db.sql | & "C:\Program Files\MySQL\MySQL Server 8.0\bin\mysql.exe" --local-infile=1 -u root -p
   ```
   This should report `rows_loaded = 3000`.

3. Copy `.env.example` to `.env` and fill in your MySQL password:
   ```powershell
   Copy-Item .env.example .env
   ```

4. Open `sql_connector.ipynb`, select the `.venv` kernel, and run all cells to load the table from MySQL.

### Power BI Dashboard

Open `Banking Dashboard (2025).pbix` in [Power BI Desktop](https://powerbi.microsoft.com/desktop/). It works offline against the embedded data model.

---

## Key Observations

Drawn directly from the data and the EDA notebook:

| Observation | Finding |
|---|---|
| Dataset size | 3,000 clients × 25 columns, fully synthetic |
| Average client age | ~51 years (median 51; range 17–85) |
| Account correlation | Bank Deposits correlate strongly with Checking, Saving, and Foreign Currency balances |
| Loyalty distribution | Jade is the most common tier, followed by Silver, Gold, then Platinum |
| Nationality distribution | European clients are the largest group, then Asian and American |
| Lending balances | Nearly all clients carry a positive `Bank Loans` balance (the dataset has no approval/no-approval flag) |

---

## Future Enhancements

- Fix the notebook's CSV path so it runs locally without edits
- Add a loan-eligibility or risk-scoring model (the current data supports risk/segment analysis but not approval prediction)
- Integrate a live MySQL feed for scheduled Power BI refresh
- Add geospatial analysis by mapping Location IDs to regions

---

## License

Open-source for educational and portfolio purposes.

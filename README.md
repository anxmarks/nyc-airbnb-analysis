# NYC Airbnb Analysis

Exploratory data analysis (EDA) + SQL analytics on the **New York City Airbnb
Open Data** dataset (Kaggle), focused on identifying signs of hosts running
large-scale, low-activity listing portfolios in the short-term rental market.

## Key finding

Hosts with **10+ active listings** (6.5% of all listings) show a very
different behavior pattern than regular hosts:

| Group                    | Avg. reviews | Avg. availability (days/year) | Listings |
|---------------------------|-------------:|-------------------------------:|---------:|
| Multi-listing hosts (10+) |         8.03 |                          272.32 |    3,177 |
| Other hosts                |        24.33 |                          101.70 |   45,670 |

Multi-listing hosts get **~3x fewer reviews** and keep their properties
**available ~2.7x more days per year** than regular hosts. This pattern is
consistent with listings that sit largely unbooked, a possible sign of
speculative or unregulated short-term rental activity rather than genuine,
actively-rented apartments.

## Dataset

- **Source**: [New York City Airbnb Open Data](https://www.kaggle.com/datasets/dgomonov/new-york-city-airbnb-open-data) (Kaggle), 2019 snapshot.
- ~48,900 listings across the 5 NYC boroughs.

## Approach

1. **Data quality**: checked nulls, duplicates, and price outliers
   (11 listings priced at $0 were dropped as invalid; the top 1% of prices
   was flagged rather than removed, since high-end listings can be legitimate).
2. **Distributions**: price, borough, and room type.
3. **Relationships**: price vs. borough, price vs. review count, availability
   vs. borough.
4. **Multi-listing host investigation**: cross-referenced
   `calculated_host_listings_count` with review count and availability to
   surface the pattern above.
5. **SQL validation**: the same findings were re-implemented and confirmed
   in SQL using DuckDB, querying the pandas DataFrame directly.

## Project structure

```
nyc-airbnb-analysis/
├── data/
│   └── raw/
│       └── AB_NYC_2019.csv
├── notebooks/
│   └── 01_eda.ipynb        # full EDA + DuckDB queries
├── sql/
│   └── queries.sql         # business-question queries (DuckDB)
├── requirements.txt
└── README.md
```

## Tools

- **pandas** — data cleaning and exploratory analysis
- **matplotlib** — visualizations
- **DuckDB** — SQL analytics directly on the DataFrame, no database setup required

## Running locally

```bash
pip install -r requirements.txt
jupyter notebook notebooks/01_eda.ipynb
```

## Next steps

- Interactive dashboard (Streamlit) to explore the multi-listing host pattern
  by borough and price range.

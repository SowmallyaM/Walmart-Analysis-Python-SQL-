# Walmart-Analysis-Python-SQL

## Project Overview

![Thumbnail image](https://github.com/SowmallyaM/Walmart-Analysis-Python-SQL./blob/main/Walmart.png)

This project is an end-to-end data analysis solution designed to extract critical business insights from Walmart sales data. We utilize Python for data processing and analysis, SQL for advanced querying, and structured problem-solving techniques to solve key business questions. The project is ideal for data analysts looking to develop skills in data manipulation, SQL querying, and data pipeline creation.


## Project Steps

### 1. Set Up the Environment
   - **Tools Used**: Jupyter NoteBook , MySQL
   - **Goal**: Create a structured workspace within Jupyter Notebook and organize project folders for smooth development and data handling.

### 2. Set Up Kaggle API
   - **API Setup**: Obtain your Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to your profile settings and downloading the JSON file.

### 3. Download Walmart Sales Data
   - **Data Source**: Use the Kaggle API to download the Walmart sales datasets from Kaggle.
   - **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)

### 4. Install Required Libraries and Load Data
   - **Libraries**: Install necessary Python libraries.
   - **Loading Data**: Read the data into a Pandas DataFrame for initial analysis and transformations.

### 5. Explore the Data
   - **Goal**: Conduct an initial data exploration to understand data distribution, check column names, types, and identify potential issues.
   - **Analysis**: Use functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.

### 6. Data Cleaning
   - **Remove Duplicates**: Identify and remove duplicate entries to avoid skewed results.
   - **Handle Missing Values**: Drop rows or columns with missing values if they are insignificant; fill values where essential.
   - **Fix Data Types**: Ensure all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Currency Formatting**: Use `.replace()` to handle and format currency values for analysis.
   - **Validation**: Check for any remaining inconsistencies and verify the cleaned data.

### 7. Feature Engineering
   - **Create New Columns**: Calculate the `Total Amount` for each transaction by multiplying `unit_price` by `quantity` and adding this as a new column.
   - **Enhance Dataset**: Adding this calculated field will streamline further SQL analysis and aggregation tasks.

### 8. Load Data into MySQL and PostgreSQL
   - **Set Up Connections**: Connect to MySQL and PostgreSQL using `sqlalchemy` and load the cleaned data into each database.
   - **Table Creation**: Set up tables in MySQL using Python SQLAlchemy to automate table creation and data insertion.

### 9. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Write and execute complex SQL queries to answer critical business questions, such as:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.


## Python Coad:
<a href="https://github.com/SowmallyaM/Walmart-Analysis-Python-SQL./blob/main/Project%20walmart(python%2BSQL).ipynb">Walmart Python coad</a>
## Business Problems:
<a href="https://github.com/SowmallyaM/Walmart-Analysis-Python-SQL./blob/main/Business%20Problems.pdf">Walmart Business Problems</a>
## SQL Queries:
<a href="https://github.com/SowmallyaM/Walmart-Analysis-Python-SQL./blob/main/project%20walmart.sql">Walmart SQL Analysis</a>
## Business Insights:
  -**Sales Insights**: Key categories, branches with highest sales, and preferred payment methods.
  -**Profitability**: Insights into the most profitable product categories and locations.
  -**Customer Behavior**: Trends in ratings, payment preferences, and peak shopping hours
<a href="https://github.com/SowmallyaM/Walmart-Analysis-Python-SQL./blob/main/Walmart%20Analysis%20Insights.pdf">Walmart Business Insights</a>


## Acknowledgments
- **Data Source**: Kaggle’s Walmart Sales Dataset
- **Inspiration**: Walmart’s business case studies on sales and supply chain optimization.



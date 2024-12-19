## Data Cleaning Process (Data Cleaning.sql)
**Objective**: Standardizes and cleans HR data stored in the database.
**Key Steps**:
-Renaming columns for consistency (e.g., changing column names to a standardized format).
-Data transformation using SQL UPDATE statements, particularly for date fields like birthdate to convert them into a uniform 
 format (YYYY-MM-DD).
-Regular expressions (REGEXP) are used to identify various date formats and ensure correct parsing.
**Focus**: Ensures the integrity and uniformity of data for analysis.

## Data Queries for Analysis (Data Queries.sql)
**Objective**: Extracts insights from the cleaned HR dataset.
**Key Queries**:
-Gender Breakdown: Analyzes the distribution of employees by gender.
-Ethnicity Breakdown: Provides the count and distribution of employees by race/ethnicity.
-Age Distribution: Calculates the age range of employees, focusing on active ones.
-Other insights could include retention, terminations, and department-specific statistics.
**Focus**: Uses SQL aggregation (COUNT, GROUP BY) and filtering (WHERE clauses) to segment and analyze data.

## Power BI Report (HR EMPLOYEE REPORT.pbix)
**Objective**: Visualizes HR data insights for business stakeholders.
**Features**:
-Interactive dashboards displaying key HR metrics like gender distribution, ethnic diversity, and age ranges.
-Charts and graphs such as pie charts, bar graphs, and trend lines to make data more accessible.
-Filters allowing dynamic exploration of specific departments or time frames.
-Focus: Converts raw data and query outputs into actionable visual representations.

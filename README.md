# Business Analytics SQL Demo: E-commerce Insights with PostgreSQL

This repository provides the necessary resources to set up a PostgreSQL database with sample e-commerce data and practice the SQL queries demonstrated in the "Basic SQL Queries: Using SQL to Answer Business Questions" teaching demo.

## 1. Prerequisites

To follow along or practice, you'll need:
* **PostgreSQL:** A PostgreSQL server installed on your machine.
* **A SQL Client:** `psql` (command-line tool, usually installed with PostgreSQL) or a GUI client like pgAdmin, DBeaver, or VS Code with SQL extensions.

## 2. PostgreSQL Installation Steps (Quick Guide)

For detailed, step-by-step instructions for your specific operating system, please refer to the official PostgreSQL documentation or common guides:

* **Windows:** Download the interactive installer from the [PostgreSQL Official Website](https://www.postgresql.org/download/windows/).
* **macOS:** Install via Homebrew: `brew install postgresql`
* **Linux (Debian/Ubuntu):** `sudo apt update && sudo apt install postgresql postgresql-contrib`
* **Docker (Cross-platform):** `docker run --name some-postgres -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres` (Requires Docker Desktop or Docker Engine installed)

## 3. Database Setup

Once PostgreSQL is installed and running, you can create the database and tables using the provided SQL script:

1.  **Download this repository** to your local machine (e.g., `git clone [repo-url]`).
2.  **Open your SQL client** (e.g., pgAdmin, DBeaver, or `psql`).
3.  **Connect to your PostgreSQL server.**
4.  **Run the `db_setup.sql` script:**
    * If using `psql` (from your terminal in the cloned repo's directory):
        ```bash
        psql -U your_username -h localhost -p 5432 -f db_setup.sql postgres
        ```
        (Replace `your_username` if necessary. `postgres` is the default initial database.)
    * If using a GUI client (like pgAdmin): Open `db_setup.sql` in a query editor, connect to your server, and execute the entire script. It will create the `ecommerce_demo` database and populate it.

## 4. Demo Queries

The `demo_queries.sql` file contains all the SQL queries demonstrated in the session. You can run these queries against your newly created `ecommerce_demo` database.

## 5. Database Schema

---
Ayman Alzaid

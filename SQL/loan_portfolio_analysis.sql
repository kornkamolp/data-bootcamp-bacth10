-- sample data for the loan portfolio analysis case, tables: Loans, Customers, and Repayments
-- Create the Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name TEXT,
    gender TEXT,
    age INT,
    region VARCHAR(10) CHECK (region IN ('North', 'South', 'East', 'West')),
    employment_status VARCHAR(20) CHECK (employment_status IN ('employed', 'self-employed', 'retired', 'student'))
);
-- Create the Loans table
CREATE TABLE loans (
	loan_id INT PRIMARY KEY,
  	customer_id INT,
  	loan_type VARCHAR(20) CHECK (loan_type IN ('personal', 'home', 'auto', 'business')),
  	loan_amount DECIMAL(10, 2),
  	disbursement_date DATE,
  	interest_rate DECIMAL(5, 2),
  	loan_term INT CHECK (loan_term > 0),  -- Loan duration in months
	loan_status VARCHAR(10) CHECK (loan_status IN ('active', 'closed', 'defaulted')),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
-- Create the Repayments table
CREATE TABLE repayments (
  	payment_id INT PRIMARY KEY,
  	loan_id INT,
  	payment_date DATE,
  	amoint_paid DECIMAL(10,2),
  	payment_status VARCHAR(10) CHECK (payment_status IN ('on-time', 'late', 'missed')),
  	FOREIGN KEY (loan_id) REFERENCES Loans(loan_id)
);

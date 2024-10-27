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
  	amount_paid DECIMAL(10,2),
  	payment_status VARCHAR(10) CHECK (payment_status IN ('on-time', 'late', 'missed')),
  	FOREIGN KEY (loan_id) REFERENCES Loans(loan_id)
);

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

-- Insert sample data into the Customers table
INSERT INTO customers (customer_id, customer_name, gender, age, region, employment_status) VALUES
(1, 'Alice Johnson', 'Female', 35, 'North', 'employed'),
(2, 'Bob Smith', 'Male', 42, 'South', 'self-employed'),
(3, 'Charlie Davis', 'Male', 29, 'East', 'employed'),
(4, 'Diana Lee', 'Female', 58, 'West', 'retired'),
(5, 'Ethan Brown', 'Male', 22, 'North', 'student'),
(6, 'Fiona Clark', 'Female', 31, 'South', 'employed'),
(7, 'George Miller', 'Male', 48, 'West', 'self-employed'),
(8, 'Hannah Wilson', 'Female', 27, 'East', 'employed'),
(9, 'Ian Martin', 'Male', 54, 'North', 'retired'),
(10, 'Jenny Scott', 'Female', 39, 'South', 'employed'); 

-- Insert sample data into the Loans table
INSERT INTO Loans (loan_id, customer_id, loan_amount, loan_type, disbursement_date, interest_rate, loan_term, loan_status) VALUES
(101, 1, 5000.00, 'personal', '2023-01-15', 8.5, 12, 'active'),
(102, 2, 30000.00, 'home', '2022-05-20', 6.2, 240, 'closed'),
(103, 3, 15000.00, 'auto', '2023-02-10', 9.1, 60, 'active'),
(104, 4, 20000.00, 'business', '2021-11-12', 7.8, 36, 'defaulted'),
(105, 5, 8000.00, 'personal', '2023-06-05', 10.5, 24, 'active'),
(106, 6, 50000.00, 'home', '2022-10-01', 6.5, 240, 'defaulted'),
(107, 7, 25000.00, 'business', '2023-04-22', 8.0, 48, 'active'),
(108, 8, 12000.00, 'personal', '2023-03-14', 9.9, 36, 'active'),
(109, 9, 7500.00, 'auto', '2021-07-09', 7.5, 60, 'closed'),
(110, 10, 27000.00, 'home', '2022-01-25', 5.8, 240, 'active'); 

-- Insert sample data into the Repayments table
INSERT INTO repayments (payment_id, loan_id, payment_date, amount_paid, payment_status) VALUES
(1001, 101, '2023-02-15', 500.00, 'on-time'),
(1002, 101, '2023-03-15', 500.00, 'on-time'),
(1003, 102, '2022-06-20', 1500.00, 'on-time'),
(1004, 102, '2022-07-20', 1500.00, 'on-time'),
(1005, 103, '2023-03-10', 1200.00, 'late'),
(1006, 104, '2021-12-12', 2000.00, 'missed'),
(1007, 104, '2022-01-12', 2000.00, 'missed'),
(1008, 105, '2023-07-05', 800.00, 'on-time'),
(1009, 106, '2022-11-01', 2500.00, 'missed'),
(1010, 107, '2023-05-22', 1000.00, 'on-time'),
(1011, 108, '2023-04-14', 400.00, 'on-time'),
(1012, 109, '2021-08-09', 500.00, 'on-time'),
(1013, 110, '2022-02-25', 1300.00, 'on-time');


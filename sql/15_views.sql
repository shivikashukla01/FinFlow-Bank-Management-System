USE FinFlow;

-- ===========================================
-- 1. Customer Profile Summary
-- ===========================================

CREATE VIEW CustomerProfileView AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    c.phone_number,
    c.dob,
    c.gender,
    k.verification_status,
    COUNT(DISTINCT ah.account_id) AS total_accounts,
    COUNT(DISTINCT l.loan_id) AS total_loans,
    COUNT(DISTINCT ca.card_id) AS total_cards
FROM Customer c
LEFT JOIN KYC k
    ON c.customer_id = k.customer_id
LEFT JOIN AccountHolder ah
    ON c.customer_id = ah.customer_id
LEFT JOIN Account a
    ON ah.account_id = a.account_id
LEFT JOIN Card ca
    ON a.account_id = ca.account_id
LEFT JOIN Loan l
    ON c.customer_id = l.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.phone_number,
    c.dob,
    c.gender,
    k.verification_status;



-- ===========================================
-- 2. Customer Account Summary
-- ===========================================

CREATE VIEW CustomerAccountView AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_no,
    a.account_type,
    a.balance,
    b.branch_name,
    a.created_at,
    a.current_status,
    a.interest_rate,
    ah.role AS account_holder_role,
    ah.ownership_percentage
FROM Customer c
LEFT JOIN AccountHolder ah
    ON ah.customer_id = c.customer_id
LEFT JOIN Account a
    ON a.account_id = ah.account_id
LEFT JOIN Branch b
    ON b.branch_id = a.branch_id;

-- ===========================================
-- 3. Loan Dashboard
-- ===========================================

CREATE VIEW LoanDashboardView AS
SELECT
    l.loan_id,
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    l.loan_type,
    l.amount,
    l.interest_rate,
    l.tenure,
    l.tenure_unit,
    l.status,
    l.value_date,
    l.disbursement_date,
    l.maturity_date,
    l.credit_score,
    l.collateral_security_type,
    l.collateral_security_value,
    CONCAT(g.first_name, ' ', g.last_name) AS guarantor_name,
    lg.relationship,
    g.credit_score AS guarantor_credit_score,
    g.income,
    g.financial_stability
FROM Loan l
LEFT JOIN Customer c
    ON l.customer_id = c.customer_id
LEFT JOIN LoanGuarantor lg
    ON l.loan_id = lg.loan_id
LEFT JOIN Guarantor g
    ON lg.guarantor_id = g.guarantor_id;

-- ===========================================
-- 4. Loan Repayment Dashboard
-- ===========================================

CREATE VIEW LoanRepaymentDashboardView AS
SELECT
    l.loan_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    rs.installment_no,
    rs.due_date,
    rs.amount_due,
    rs.principal_component,
    rs.interest_component,
    rs.status,
    lr.amount_paid,
    lr.payment_date,
    lr.payment_mode,
    lr.payment_type
FROM Loan l
LEFT JOIN Customer c
    ON l.customer_id = c.customer_id
LEFT JOIN RepaymentSchedule rs
    ON l.loan_id = rs.loan_id
LEFT JOIN LoanRepayment lr
    ON rs.schedule_id = lr.schedule_id;

-- ===========================================
-- 5. Customer Transaction Summary
-- ===========================================

CREATE VIEW CustomerTransactionView AS
SELECT
    t.txn_id,
    t.txn_type,
    t.amount,
    CONCAT(sc.first_name, ' ', sc.last_name) AS sender_name,
    sender.account_no AS sender_account_no,
    CONCAT(rc.first_name, ' ', rc.last_name) AS receiver_name,
    receiver.account_no AS receiver_account_no,
    t.status,
    t.txn_timestamp
FROM Transaction t
LEFT JOIN Account sender
    ON t.sender_account_id = sender.account_id
LEFT JOIN AccountHolder sah
    ON sender.account_id = sah.account_id
    AND sah.role = 'PRIMARY'
LEFT JOIN Customer sc
    ON sah.customer_id = sc.customer_id
LEFT JOIN Account receiver
    ON t.receiver_account_id = receiver.account_id
LEFT JOIN AccountHolder rah
    ON receiver.account_id = rah.account_id
    AND rah.role = 'PRIMARY'
LEFT JOIN Customer rc
    ON rah.customer_id = rc.customer_id;






-- DROP VIEW CustomerProfileView;
-- DROP VIEW LoanDashboardView;
-- DROP VIEW LoanRepaymentDashboardView;
-- DROP VIEW CustomerAccountView;
-- DROP VIEW CustomerTransactionView;

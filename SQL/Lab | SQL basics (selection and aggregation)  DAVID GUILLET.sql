# Query 1 - Get the id values of the first 5 clients from district_id with a value equals to 1.
USE bank
SELECT client_id FROM client
Where district_id = 1
ORDER BY district_id LIMIT 5;

# Query 2 - In the client table, get an id value of the last client where the district_id equals to 72.
SELECT client_id
FROM client
WHERE district_id = 72
ORDER BY client_id DESC LIMIT 1;

# Query 3 - Get the 3 lowest amounts in the loan table.
SELECT amount FROM loan;
#ORDER BY amount LIMIT 3;
SELECT amount FROM loan
ORDER BY amount LIMIT 3;

# Query 4 - What are the possible values for status, ordered alphabetically in ascending order in the loan table?
SELECT DISTINCT status FROM loan
ORDER BY status ASC;

# Query 5 - What is the loan_id of the highest payment received in the loan table?
SELECT loan_id FROM loan
WHERE payments = (select MAX(payments) FROM loan);

# Query 6 - What is the loan amount of the lowest 5 account_ids in the loan table? Show the account_id and the corresponding amount
SELECT account_id, amount FROM loan
ORDER BY account_id LIMIT 5;
#ORDER BY (SELECT account_ids FROM FROM loan) LIMIT 5;

# Query 7 - What are the top 5 account_ids with the lowest loan amount that have a loan duration of 60 in the loan table?
SELECT account_id, amount FROM loan
WHERE duration = 60
ORDER BY amount LIMIT 5;

# Query 8 - What are the unique values of k_symbol in the order table?
SELECT DISTINCT k_symbol FROM `order`;

#Query 9 - In the order table, what are the order_ids of the client with the account_id 34?
SELECT order_id FROM `order`
WHERE account_id = 34;

#Query 10 - In the order table, which account_ids were responsible for orders between order_id 29540 and order_id 29560 (inclusive)?
SELECT account_id, order_id FROM `order`
WHERE order_id BETWEEN 29540 AND 29560;

# Query 11 - In the order table, what are the individual amounts that were sent to (account_to) id 30067122?
SELECT amount FROM `order`
WHERE account_to = 30067122;

# Query 12 - In the trans table, show the trans_id, date, type and amount of the 10 first transactions from account_id 793
# in chronological order, from newest to oldest.
SELECT trans_id, `date`, `type`, `amount` FROM trans
WHERE account_id = 793
ORDER BY date DESC LIMIT 10;

# Optional
# Query 13 - In the client table, of all districts with a district_id lower than 10, how many clients are from each district_id?
# Show the results sorted by the district_id in ascending order.
SELECT district_id, COUNT(client_id) FROM client
WHERE district_id < 10
GROUP BY district_id;
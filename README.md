# Example SQL Queries
This repository contains some examples queries that I wrote using MySQL. The databases used are from the MySQL tutorials from "Programming With Mosh".

Example Query 1 is a simple query that calculates the total cost of orders and returns the associated customer details. This type of query would be useful to determine which customers are placing the largest orders and who should be targeted by bulk discount promotions.

Example Query 2 is a more advanced query that finds the product that each customer ordered the most. This query uses the WITH clause to define a calculation table containing the customer ids, product ids that they have ordered, and the total quantity of each product that the customer ordered across all orders. Then, to find the maximum quantity value for each customer, the query joins the calculation table with itself using the group identifiers and max value as keys. Finally, the results are joined with associated information and sorted based on the amount of each product in stock. This query would be useful to identify each customer's favorite item or to run targeted discounts in the event of overstock. 

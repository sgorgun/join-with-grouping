SELECT
    surname,
    name,
    birth_date,
    SUM(order_details.price * order_details.product_amount) AS sum
FROM person
INNER JOIN customer
    ON person.id = customer.person_id
INNER JOIN customer_order
    ON customer.person_id = customer_order.customer_id
INNER JOIN order_details
    ON customer_order.id = order_details.customer_order_id
WHERE customer.discount = 0 AND customer_order.operation_time BETWEEN '2021-01-01' AND '2021-12-31'
GROUP BY surname, name, birth_date
ORDER BY sum, surname;
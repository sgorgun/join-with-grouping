SELECT
    product_category.name AS category,
    COUNT(product.id) AS count
FROM
    product_category
INNER JOIN product_title
    ON product_category.id = product_title.product_category_id
INNER JOIN product
    ON product_title.id = product.product_title_id
GROUP BY
    category
ORDER BY
    category;
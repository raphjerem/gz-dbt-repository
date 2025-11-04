SELECT
    a.quantity,
    a.revenue,
    b.purchase_price,
    quantity*purchase_price AS purchase_cost
    CAST(revenue AS int64) AS revenue,
    revenue-purchase_cost AS margin
FROM {{ ref('stg_raw__sales') }} AS a
JOIN {{ ref('stg_raw__product') }} AS b
    ON a.products_id = b.products_id
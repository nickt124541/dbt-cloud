with customers as (
    select
        customer_id,
        first_name,
        last_name,
        first_name || ' ' || last_name   as customer_name,
        lower(email)                      as email,
        country,
        created_at::timestamp             as created_at
    from public.customers
),

orders as (
    select
        order_id,
        customer_id,
        status                            as order_status,
        created_at::timestamp             as order_created_at
    from public.orders
),

products as (
        select
        product_id,
        name                              as product_name,
        category                          as product_category,
        price                             as unit_price,
        created_at::timestamp             as created_at
    from public.products
),

order_items as (
    select
        order_item_id,
        order_id,
        product_id,
        quantity,
        unit_price,
        (quantity * unit_price)::numeric(10,2) as line_total
    from public.order_items
)

select * from customers
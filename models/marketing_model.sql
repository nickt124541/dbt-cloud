with campaigns as (
        select
        campaign_id,
        name                              as campaign_name,
        channel                           as campaign_channel,
        budget                            as campaign_budget,
        start_date::date                  as campaign_start_date,
        end_date::date                    as campaign_end_date,
        (end_date - start_date)           as campaign_duration_days
    from marketing.campaigns
),

ad_spend as (
        select
        spend_id,
        campaign_id,
        spend_date::date                  as spend_date,
        amount_spent,
        impressions,
        clicks,
        case
            when impressions = 0 then null
            else round((clicks::numeric / impressions) * 100, 2)
        end                               as click_through_rate_pct
    from marketing.ad_spend
),

leads as (
    select
        lead_id,
        lower(email)                      as email,
        campaign_id,
        created_at::timestamp             as lead_created_at
    from marketing.leads
),

conversions as (
        select
        conversion_id,
        lead_id,
        customer_id,
        converted_at::timestamp           as converted_at
    from marketing.conversions
)

select * from conversions
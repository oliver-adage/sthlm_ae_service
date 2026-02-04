with source as (
  select *
  from {{ source('gtfs_sl', 'sl_routes_raw') }}
),

typed as (
  select
    cast(feed_date as date) as feed_date,
    route_id,
    route_short_name,
    route_long_name,
    route_type
  from source
)

select * from typed

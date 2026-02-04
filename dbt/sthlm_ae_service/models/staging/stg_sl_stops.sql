with source as (
  select *
  from {{ source('gtfs_sl', 'sl_stops_raw') }}
),

typed as (
  select
    cast(feed_date as date) as feed_date,
    stop_id,
    stop_name,
    cast(stop_lat as double) as stop_lat,
    cast(stop_lon as double) as stop_lon
  from source
)

select * from typed

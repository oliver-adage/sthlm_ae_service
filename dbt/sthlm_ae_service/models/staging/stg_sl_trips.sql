with source as (
  select *
  from {{ source('gtfs_sl', 'sl_trips_raw') }}
),

typed as (
  select
    cast(feed_date as date) as feed_date,
    route_id,
    trip_id,
    trip_headsign,
    direction_id
  from source
)

select * from typed

with source as (
  select *
  from {{ source('gtfs_sl', 'sl_stop_times_raw') }}
),

typed as (
  select
    cast(feed_date as date) as feed_date,
    trip_id,
    stop_id,
    cast(arrival_time as string) as arrival_time,
    cast(departure_time as string) as departure_time,
    stop_sequence
  from source
)

select * from typed

with source as (
  select *
  from {{ source('gtfs_sl', 'sl_calendar_dates_raw') }}
),

typed as (
  select
    cast(feed_date as date) as feed_date,
    service_id,
    cast(date as date) as date,
    exception_type
  from source
)

select * from typed

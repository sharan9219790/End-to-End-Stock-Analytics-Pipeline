select
  symbol,
  date,
  close,
  ma20,
  ma50,
  rsi14,
  (close - lag(close) over (partition by symbol order by date))
    / nullif(lag(close) over (partition by symbol order by date),0) as daily_return
from {{ ref('int_with_indicators') }}


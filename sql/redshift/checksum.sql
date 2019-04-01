select
  sum(trunc(strtol(substring(hash, 1, 8), 16))),
  sum(trunc(strtol(substring(hash, 9, 8), 16))),
  sum(trunc(strtol(substring(hash, 17, 8), 16))),
  sum(trunc(strtol(substring(hash, 25, 8), 16)))
from (
  select md5(
    coalesce(md5("league_id"::text), ' ') ||
    coalesce(md5("abbr"::text), ' ')
  ) as "hash"
  from "baseball"."leagues" order by league_id
) as t


1.4506240153E10
1.8775824691E10
1.4076462971E10
1.5825530307E10

select
  sum(trunc(strtol(substring(hash, 1, 8), 16))),
  sum(trunc(strtol(substring(hash, 9, 8), 16))),
  sum(trunc(strtol(substring(hash, 17, 8), 16))),
  sum(trunc(strtol(substring(hash, 25, 8), 16)))
from (
  select md5(
    coalesce(md5("id"::text), ' ')
  ) as "hash"
  from one_row
) as t

select
  sum(trunc(strtol(substring(hash, 1, 8), 16)))
from (
select md5(md5(abbr)||md5(league_id)) as hash from leagues order by league_id
) as t

#mysql

select
  sum(cast(conv(substring(hash, 1, 8), 16, 10) as unsigned)),
  sum(cast(conv(substring(hash, 9, 8), 16, 10) as unsigned)),
  sum(cast(conv(substring(hash, 17, 8), 16, 10) as unsigned)),
  sum(cast(conv(substring(hash, 25, 8), 16, 10) as unsigned))
from (
  select md5(
    concat(
      coalesce(md5("league_id"), ' '),
      coalesce(md5("abbr"), ' '),
      coalesce(md5("name"), ' ')
    )
  ) as "hash"
  from league_temp
) as t

select
  sum(cast(conv(substring(hash, 1, 8), 16, 10) as unsigned)),
  sum(cast(conv(substring(hash, 9, 8), 16, 10) as unsigned)),
  sum(cast(conv(substring(hash, 17, 8), 16, 10) as unsigned)),
  sum(cast(conv(substring(hash, 25, 8), 16, 10) as unsigned))
from (
  select md5(
    concat(
      coalesce(md5("league_id"), ' '),
      coalesce(md5("abbr"), ' ')
    )
  ) as "hash"
  from leagues order by league_id
) as t

checksum table one_row;

select
  sum(cast(conv(substring(hash, 1, 8), 16, 10) as unsigned)),
  sum(cast(conv(substring(hash, 9, 8), 16, 10) as unsigned)),
  sum(cast(conv(substring(hash, 17, 8), 16, 10) as unsigned)),
  sum(cast(conv(substring(hash, 25, 8), 16, 10) as unsigned))
from (
  select md5(
    concat(
      coalesce(md5("integer column"), ' '),
      coalesce(md5(floor(
        unix_timestamp("datetime column")
      )), ' '),
      coalesce(md5("string column"), ' '),
      coalesce(md5(cast("boolean column" as integer)), ' ')
    )
  ) as "hash"
  from "leagues"
) as t;

select sum(cast(conv(substring(hash, 1, 8), 16,10) as unsigned)) from
(
select md5(concat(md5(abbr),md5(league_id),md5(name))) hash from leagues order by league_id
) as t;

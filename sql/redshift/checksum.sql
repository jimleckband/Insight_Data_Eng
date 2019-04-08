# redshift

select
  sum(trunc(strtol(substring(hash, 1, 8), 16))) as fingerprint_1
from (
select  md5(
          md5(player_id) ||
          md5(year) ||
          md5(team_id) ||
          md5(game_id) ||
          md5(league_id) ||
          md5(level_id) ||
          md5(split_id) ||
          md5(position) ||
          md5(ab) ||
          md5(h) ||
          md5(k) ||
          md5(pa) ||
          md5(pitches_seen) ||
          md5(g) ||
          md5(gs) ||
          md5(d) ||
          md5(t) ||
          md5(hr) ||
          md5(r) ||
          md5(rbi) ||
          md5(sb) ||
          md5(cs) ||
          md5(bb) ||
          md5(ibb) ||
          md5(gdp) ||
          md5(sh) ||
          md5(sf) ||
          md5(hp) ||
          md5(ci) ||
          md5(stint) ||
          md5(load_date))  as hash
from baseball_ext.dw_players_career_batting_stats
where load_date='2019-03-02'
) as t


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
  from "baseball"."leagues_dim" order by league_id
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

#mysql############################################################################################

select
  sum(cast(conv(substring(hash, 1, 8), 16, 10) as unsigned)) as fingerprint1
from (
select md5(
          concat(md5(player_id),
                  md5(year),
                  md5(team_id),
                  md5(game_id),
                  md5(league_id),
                  md5(level_id),
                  md5(split_id),
                  md5(position),
                  md5(ab),
                  md5(h),
                  md5(k),
                  md5(pa),
                  md5(pitches_seen),
                  md5(g),
                  md5(gs),
                  md5(d),
                  md5(t),
                  md5(hr),
                  md5(r),
                  md5(rbi),
                  md5(sb),
                  md5(cs),
                  md5(bb),
                  md5(ibb),
                  md5(gdp),
                  md5(sh),
                  md5(sf),
                  md5(hp),
                  md5(ci),
                  md5(stint),
                  md5(load_date)) as hash
from dw_players_career_batting_stats
where load_date='2019-03-02'
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

# redshift external

select sum(cast(conv(substring(hash, 1, 8), 16,10) as unsigned)) from
(
select md5(concat(md5(abbr),md5(league_id),md5(name))) hash from baseball.ext_leagues order by league_id
) as t;

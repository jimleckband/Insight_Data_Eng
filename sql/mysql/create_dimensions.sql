/* These sql statements create dimension tables out of the seed date_add

/* Leagues */

CREATE TABLE leagues_dim AS SELECT league_id, name, abbr FROM leagues;

/* Teams */

CREATE TABLE teams_dim AS SELECT team_id, name, abbr, nickname, league_id FROM teams;

/* Players */

CREATE TABLE players_dim AS SELECT player_id, team_id, league_id, first_name, last_name, nick_name,
  age, bats, throws, position FROM players;

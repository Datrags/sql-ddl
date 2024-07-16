DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE players (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams (id)
);
CREATE TABLE referees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);
CREATE TABLE seasons (
    id SERIAL PRIMARY KEY,
    start_date DATE,
    end_date DATE
);

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
    game_date DATE,
    team1_id INTEGER REFERENCES teams (id),
    team2_id INTEGER REFERENCES teams (id),
    referee_id INTEGER REFERENCES referees (id),
    season_id INTEGER REFERENCES seasons (id)
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players (id),
    game_id INTEGER REFERENCES games (id)
)
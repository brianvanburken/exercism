use std::cmp::{Ord, Ordering};
use std::collections::BTreeMap;
use std::fmt::{Display, Formatter, Result};

pub fn tally(match_results: &str) -> String {
    let mut tournament = Tournament::new();
    for outcome in match_results.lines() {
        tournament.add_game(outcome);
    }
    format!("{}", tournament)
}

enum Outcome {
    Win,
    Draw,
    Loss,
}

#[derive(Copy, Clone)]
struct Score {
    wins: u64,
    draws: u64,
    losses: u64,
}

impl Score {
    fn new() -> Self {
        Self {
            wins: 0,
            draws: 0,
            losses: 0,
        }
    }

    fn add_outcome(&mut self, game: Outcome) {
        match game {
            Outcome::Win => self.wins += 1,
            Outcome::Draw => self.draws += 1,
            Outcome::Loss => self.losses += 1,
        }
    }

    fn points(&self) -> u64 {
        (self.wins * 3) + self.draws
    }

    fn matches_played(&self) -> u64 {
        self.wins + self.losses + self.draws
    }
}

impl Display for Score {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
        write!(
            f,
            "{:2} | {:2} | {:2} | {:2} | {:2}",
            self.matches_played(),
            self.wins,
            self.draws,
            self.losses,
            self.points()
        )
    }
}

struct Team {
    name: String,
    score: Score,
}

impl Clone for Team {
    fn clone(&self) -> Team {
        Team {
            name: self.name.clone(),
            score: self.score,
        }
    }
}

impl Team {
    fn new(name: &str) -> Self {
        Self {
            name: name.to_string(),
            score: Score::new(),
        }
    }

    fn add_outcome(&mut self, outcome: Outcome) {
        self.score.add_outcome(outcome);
    }

    fn points(&self) -> u64 {
        self.score.points()
    }
}

impl Ord for Team {
    fn cmp(&self, other: &Self) -> Ordering {
        self.points().cmp(&other.points())
    }
}

impl Eq for Team {}

impl PartialOrd for Team {
    fn partial_cmp(&self, other: &Self) -> Option<Ordering> {
        Some(other.cmp(self))
    }
}

impl PartialEq for Team {
    fn eq(&self, other: &Team) -> bool {
        self.points() == other.points()
    }
}

impl Display for Team {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
        write!(f, "{:30} | {}", self.name, self.score,)
    }
}

struct Tournament {
    teams: BTreeMap<String, Team>,
}

impl Tournament {
    fn new() -> Self {
        Self {
            teams: BTreeMap::new(),
        }
    }

    fn get_team(&mut self, team: &str) -> &mut Team {
        self.teams
            .entry(team.to_string())
            .or_insert_with(|| Team::new(team))
    }

    fn add_game(&mut self, game: &str) {
        let mut parts = game.split(';');
        let team_a = parts.next().expect("Expected team A in the game outcome");
        let team_b = parts.next().expect("Expected team B in the game outcome");
        let result = parts
            .next()
            .expect("Expected game result in the game outcome");
        match result {
            "win" => {
                self.get_team(team_a).add_outcome(Outcome::Win);
                self.get_team(team_b).add_outcome(Outcome::Loss);
            }
            "loss" => {
                self.get_team(team_a).add_outcome(Outcome::Loss);
                self.get_team(team_b).add_outcome(Outcome::Win);
            }
            "draw" => {
                self.get_team(team_a).add_outcome(Outcome::Draw);
                self.get_team(team_b).add_outcome(Outcome::Draw);
            }
            _ => (),
        }
    }
}

impl Display for Tournament {
    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
        let mut teams_sorted: Vec<Team> = self.teams.values().cloned().collect();
        teams_sorted.sort();
        let teams = teams_sorted
            .iter()
            .fold(String::new(), |output, team| {
                format!("{}\n{}", output, team)
            });
        write!(f, "{:30} | MP |  W |  D |  L |  P{}", "Team", teams)
    }
}

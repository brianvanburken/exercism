// This stub file contains items that aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

pub struct Player {
    pub health: u32,
    pub mana: Option<u32>,
    pub level: u32,
}

impl Player {
    pub fn revive(&self) -> Option<Player> {
        if self.health > 0 {
            return None;
        }
        Some(Player {
            health: 100,
            mana: self.mana.map(|_| 100),
            level: self.level,
        })
    }

    pub fn cast_spell(&mut self, mana_cost: u32) -> u32 {
        if self.mana.map_or(false, |m| m > mana_cost) {
            self.mana = self.mana.map(|m| m - mana_cost);
            return mana_cost * 2;
        }
        if self.mana.is_none() {
            self.health = self.health.saturating_sub(mana_cost);
        }
        0
    }
}

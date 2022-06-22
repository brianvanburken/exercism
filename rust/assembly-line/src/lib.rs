const BASE_SPEED: f32 = 221.0;

pub fn production_rate_per_hour(speed: u8) -> f64 {
    (BASE_SPEED as f64 * speed as f64) * success_rate(speed) as f64
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    (BASE_SPEED / 60.0 * success_rate(speed) * speed as f32) as u32
}

fn success_rate(speed: u8) -> f32 {
    match speed {
        5..=8 => 0.90,
        9..=10 => 0.77,
        _ => 1.00,
    }
}

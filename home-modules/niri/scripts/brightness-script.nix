{ pkgs, ... }:
direction: pkgs.writers.writeRust "brightness-script" { } /* rust */ ''
    use std::process::Command;

    const BRIGHTNESS_STEPS: [u32; 10] = [
      0, 1, 100, 1200, 2000, 5000, 12500, 25000, 60000, 120000,
    ];

    fn main() {
        let current_brightness = Command::new("sh")
            .arg("-c")
            .arg("brightnessctl get")
            .output()
            .expect("Failed to get brightness");
        if !current_brightness.status.success() {
            panic!("Nonzero exit code getting brightness");
        }
        let current_brightness = String::from_utf8(current_brightness.stdout)
            .expect("Failed to parse brightness value")
            .trim()
            .parse::<u32>()
            .expect("Failed to parse brightness value");

        let current_brightness_step = BRIGHTNESS_STEPS.iter()
            .enumerate()
            .find(|(index, step)| **step >= current_brightness)
            .expect("Brightness value too high")
            .0;

        let new_brightness = match "${direction}" {
            "up" => {
                *BRIGHTNESS_STEPS
                    .get(current_brightness_step + 1)
                    .unwrap_or(&BRIGHTNESS_STEPS[current_brightness_step])
            },
            "down" => {
                BRIGHTNESS_STEPS[current_brightness_step.saturating_sub(1)]
            },
            _ => unreachable!(),
        };

        Command::new("sh")
            .arg("-c")
            .arg(format!("brightnessctl set {}", new_brightness))
            .status()
            .expect("Failed to set brightness")
            .success()
            .then(|| ())
            .ok_or_else(|| panic!("Nonzero exit code setting brightness"));
    }
''

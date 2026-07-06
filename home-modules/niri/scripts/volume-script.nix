{ pkgs, ... }:
direction: pkgs.writers.writeRust "volume-script" { } /* rust */ ''
    use std::process::Command;

    const VOLUME_STEPS: [u32; 17] = [
      0, 1, 2, 4, 8, 12, 18, 25, 32, 40, 50, 65, 80, 100, 130, 170, 225,
    ];

    fn main() {
        let current_volume = Command::new("sh")
            .arg("-c")
            .arg("wpctl get-volume @DEFAULT_AUDIO_SINK@")
            .output()
            .expect("Failed to get volume");
        if !current_volume.status.success() {
            panic!("Nonzero exit code getting volume");
        }
        let current_volume = String::from_utf8(current_volume.stdout)
            .expect("Failed to parse volume value")
            .trim()
            .split(" ")
            .collect::<Vec<_>>()
            [1]
            .replace(".", "")
            .parse::<u32>()
            .expect("Failed to parse volume value");

        let current_volume_step = VOLUME_STEPS.iter()
            .enumerate()
            .find(|(index, step)| **step >= current_volume)
            .map(|(index, step)| index)
            .unwrap_or(VOLUME_STEPS.len() - 1);

        let new_volume = match "${direction}" {
            "up" => {
                *VOLUME_STEPS
                    .get(current_volume_step + 1)
                    .unwrap_or(&VOLUME_STEPS[current_volume_step])
            },
            "down" => {
                VOLUME_STEPS[current_volume_step.saturating_sub(1)]
            },
            _ => unreachable!(),
        };

        Command::new("sh")
            .arg("-c")
            .arg(format!("wpctl set-volume @DEFAULT_AUDIO_SINK@ {}%", new_volume))
            .status()
            .expect("Failed to set volume")
            .success()
            .then(|| ())
            .ok_or_else(|| panic!("Nonzero exit code setting volume"));
    }
''

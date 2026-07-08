{ pkgs, ... }:
pkgs.writers.writeRust "monitor-script" { } /* rust */ ''
    use std::process::Command;

    fn main() {
        let niri_outputs = Command::new("sh")
            .arg("-c")
            .arg("niri msg outputs")
            .output()
            .expect("Failed to get niri outputs");
        if !niri_outputs.status.success() {
            panic!("Nonzero exit code getting niri outputs");
        }
        let niri_outputs = String::from_utf8(niri_outputs.stdout)
            .expect("Failed to parse niri outputs");

        let sections: Vec<_> = niri_outputs.split("\n\n").collect();

        let section = sections
            .into_iter()
            .find(|section| {
                section.contains("Acer Technologies VG240Y S 0x11013D54")
            })
            .expect("Failed to find monitor");

        let lines: Vec<_> = section.split("\n").collect();

        let current_mode = lines
            .into_iter()
            .find(|line| {
                line.contains("(current)")
            })
            .expect("Failed to find current output mode")
            .trim()
            .split(" ")
            .collect::<Vec<_>>()
            [0]
            .trim();

        let new_mode = if current_mode == "1920x1080@165.003" {
            "1920x1080@60.000"
        } else {
            "1920x1080@165.003"
        };

        Command::new("sh")
            .arg("-c")
            .arg(format!("niri msg output \"Acer Technologies VG240Y S 0x11013D54\" mode {}", new_mode))
            .status()
            .expect("Failed to set new output mode")
            .success()
            .then(|| ())
            .ok_or_else(|| panic!("Nonzero exit code setting new output mode"));
    }
''

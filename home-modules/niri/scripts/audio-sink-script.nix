{ pkgs, ... }:
pkgs.writers.writeRust "audio-sink-script" { } /* rust */ ''
    use std::process::Command;

    fn main() {
        let wpctl_status = Command::new("sh")
            .arg("-c")
            .arg("wpctl status")
            .output()
            .expect("Failed to get wpctl status");
        if !wpctl_status.status.success() {
            panic!("Nonzero exit code getting wpctl status");
        }
        let wpctl_status = String::from_utf8(wpctl_status.stdout)
            .expect("Failed to parse wpctl status");

        let lines: Vec<_> = wpctl_status.split("\n").collect();

        let sinks_heading = lines
            .iter()
            .enumerate()
            .find(|(index, line)| {
                line.find(" ├─ Sinks:").is_some()
            })
            .expect("Failed to parse 'Sinks' header")
            .0;

        let sources_heading = lines
            .iter()
            .enumerate()
            .find(|(index, line)| {
                line.find(" ├─ Sources:").is_some()
            })
            .expect("Failed to parse 'Sources' header")
            .0;

        let sinks = &lines[(sinks_heading + 1)..(sources_heading - 1)];

        let selected_sink = sinks
            .iter()
            .enumerate()
            .find(|(index, line)| {
                line.find(" │  *").is_some()
            })
            .expect("Failed to parse selected audio sink")
            .0;
        
        let new_sink_index = (selected_sink + 1) % sinks.len();

        let new_sink_id = &sinks
            [new_sink_index]
            [10..=11];

        Command::new("sh")
            .arg("-c")
            .arg(format!("wpctl set-default {}", new_sink_id))
            .status()
            .expect("Failed to set new audio sink")
            .success()
            .then(|| ())
            .ok_or_else(|| panic!("Nonzero exit code setting new audio sink"));
    }
''

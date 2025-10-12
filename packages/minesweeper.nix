{ pkgs, ... }:
pkgs.rustPlatform.buildRustPackage rec { 
  pname = "minesweeper";
  version = "1.0.0";

  src = pkgs.fetchFromGitHub {
    owner = "jonasskounielsen";
    repo = "minesweeper";
    rev = "v${version}";
    sha256 = "sha256-wEKX7aib5BHLMUCALp7OV0ggPkWRHQLt3lDSKN5UM8c=";
  };

  cargoLock.lockFile = "${src}/Cargo.lock";
}
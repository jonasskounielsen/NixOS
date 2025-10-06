{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  pname = "minecraftia-fixed";
  version = "1.0";

  src = pkgs.minecraftia;

  nativeBuildInputs = [ pkgs.python313Packages.fonttools ];

  unpackPhase = ''
    mkdir src
    cp -r $src/share/fonts/truetype/* src/
  '';

  buildPhase = ''
    # Find the actual TTF file
    TTF_FILE=$(find src -iname '*.ttf' | head -n1)
    echo "Found TTF: $TTF_FILE"

    ttx -o Minecraftia.ttx "$TTF_FILE"
    
    # Change family name
    sed -i 's/Minecraftia/Minecraftia Fixed/g' Minecraftia.ttx
    # Change full name
    sed -i 's/Minecraftia Regular/Minecraftia Fixed Regular/g' Minecraftia.ttx
    # Set fixed width
    sed -i 's/<bProportion value="0"\/>/<bProportion value="9"\/>/' Minecraftia.ttx
    sed -i 's/<isFixedPitch value="0"\/>/<isFixedPitch value="1"\/>/' Minecraftia.ttx
    # Patch all characters to 768 advance, looks bad though
    sed -i 's/\(<mtx[^>]*width="\)[0-9]\{1,4\}\(".*\/>\)/\1768\2/' Minecraftia.ttx
    
    ttx -o Minecraftia-fixed.ttf Minecraftia.ttx
  '';

  installPhase = ''
    mkdir -p $out/share/fonts/truetype
    cp Minecraftia-fixed.ttf $out/share/fonts/truetype/
  '';

  meta = with pkgs.lib; {
    description = "Minecraftia font patched to appear monospaced for Kitty";
    license = licenses.free;
    platforms = platforms.all;
  };
}
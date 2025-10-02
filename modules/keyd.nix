{ ... }:
{
  programs.ydotool = {
    enable = true;
    group = "ydotool";
  };

  environment.variables = {
    YDOOTOL_SOCKET = "/run/ydotoold/socket";
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          main = {
            capslock = "esc";
            esc = "capslock";
          };
          altgr = {
            #"1" = "string °";
            #"'" = "string ′";
            #"-" = "string –";
            
            "a" = "macro(abc)";
            #"b" = "string β";
            #"c" = "string χ";
            #"d" = "string δ";
            #"e" = "string ε";
            #"f" = "string φ";

            #"g" = "string γ";
            #"h" = "string η";
            #"i" = "string ι";
            #"j" = "";
            #"l" = "string λ";
            #"k" = "string κ";
            #"m" = "string μ";
            #"n" = "string ν";
            #"o" = "string ο";
            #"p" = "string π";
            #"q" = "";
            #"r" = "string ρ";
            #"s" = "string σ";
            #"t" = "string τ";
            #"u" = "string ω";
            #"v" = "";
            #"w" = "string ψ";
            #"x" = "string ξ";
            #"y" = "string υ";
            #"z" = "string ζ";
            #"æ" = "";
            #"ø" = "string θ";
            #"å" = "";
          };
          # "altgr+shift" = {
          #   #"a" = "string Α";
          #   "b" = "string Β";
          #   "c" = "string Χ";
          #   "d" = "string Δ";
          #   "e" = "string Ε";
          #   "f" = "string Φ";
          #   "g" = "string Γ";
          #   "h" = "string Η";
          #   "i" = "string Ι";
          #   #"j" = "";
          #   "k" = "string Κ";
          #   "l" = "string Λ";
          #   "m" = "string Μ";
          #   "n" = "string Ν";
          #   "o" = "string Ο";
          #   "p" = "string Π";
          #   #"q" = "";
          #   "r" = "string Ρ";
          #   "s" = "string Σ";
          #   "t" = "string Τ";
          #   "u" = "string Ω";
          #   #"v" = "";
          #   "w" = "string Ψ";
          #   "x" = "string Ξ";
          #   "y" = "string Υ";
          #   "z" = "string Ζ";
          #   #"æ" = "";
          #   "ø" = "string Θ";
          #   #"å" = "";
          # };
          # "control+shift" = { # are seemingly overwritten
          #   "m" = "string ᴍ";
          #   "s" = "string ς";
          # };
        };
      };
    }
    ;
  };
}
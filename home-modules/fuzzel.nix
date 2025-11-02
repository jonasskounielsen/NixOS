{ ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        match-counter = true;
        show-actions = true;
        terminal = "kitty";
        tabs = 4;
      };
    };
  };
}

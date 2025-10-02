{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    vimAlias = true;
    viAlias = true;
    extraPackages = with pkgs.vimPlugins; [
      nvim-surround # Does not seem to work
    ];
  };
}
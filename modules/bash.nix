{ ... }:
{
  programs.bash = {
    interactiveShellInit =
      (builtins.readFile ./bash/load_devshells.sh) +
      (builtins.readFile ./bash/yazi_cd.sh);
    promptInit = ''PS1="\n\[\e[38;5;46;1m\][(''${SHLVL})\u@\h:\w]\$\[\e[0m\] "'';
  };
}

{ ... }:
{
  programs.bash = {
    interactiveShellInit =
      (builtins.readFile ./bash/load_devshells.sh) +
      (builtins.readFile ./bash/yazi_cd.sh);
    promptInit = ''PS1="\n\[\e[38;5;46;1m\][(''${SHLVL})\u@\h:\w]\$\[\e[0m\] "'';
  };
  
  environment.shellAliases = {
    "rebuild" = "sudo nixos-rebuild switch";
    "silde" = ''
      PORT=$(curl -sS silde.dk/api/port)
      kitten ssh -p $PORT silde@ssh.silde.dk
    '';
    "ns" = "niri-session";
  };
}

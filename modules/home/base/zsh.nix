{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      nitch
    '';

    shellAliases =
      let
        flakeDir = "/etc/nixos";
        host = "desktop";
      in {
        rb = "sudo nixos-rebuild switch --flake ${flakeDir}#${host}";
        rbt = "sudo nixos-rebuild test --flake ${flakeDir}#${host}";
        rbd = "sudo nixos-rebuild dry-build --flake ${flakeDir}#${host}";
        upd = "nix flake update --flake ${flakeDir}";
        upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}#${host}";
        del-garbage = "sudo nix-collect-garbage -d";

        ls = "eza";
        la = "eza -la";
        ll = "eza -l";

        v = "nvim";
        se = "sudoedit";
        ff = "fastfetch";
      };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "eza" "fzf" ];
      theme = "agnoster";
    };
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}

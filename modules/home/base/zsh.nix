{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;

    shellAliases = {
      ls = "eza --color=auto --icons=auto --group-directories-first";
      ll = "eza -l --color=auto --icons=auto --group-directories-first";
      la = "eza -la --color=auto --icons=auto --group-directories-first";
      lt = "eza --tree --color=auto --icons=auto --group-directories-first";
      grep = "grep --color=auto";
      v = "nvim";
    };

    history = {
      size = 10000;
      save = 10000;
      path = "${config.home.homeDirectory}/.zsh_history";
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
      append = true;
    };

    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
    ];

    # NOTE: In Nix '' strings:
    # - ''$ escapes to $
    # - ''${ escapes to ${
    # - ''' escapes to '' (two single quotes)
    initContent = ''
      # ── Completion Styling ────────────────────────────────────────
      zstyle ':completion:*' menu select
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' group-name '''
      zstyle ':completion:*:descriptions' format '%F{cyan}── %d ──%f'

      # ── Powerline-style prompt ────────────────────────────────────
      autoload -Uz add-zsh-hook

      __build_prompt() {
        local USER_SEG=$'%{\e[48;2;61;89;161;38;2;200;200;208m%}'
        local SEP_USR_DIR=$'%{\e[48;2;46;46;53;38;2;61;89;161m%}'
        local DIR_SEG=$'%{\e[48;2;46;46;53;38;2;200;200;208m%}'
        local GIT_CLEAN=$'%{\e[48;2;46;46;53;38;2;158;206;106m%}'
        local GIT_DIRTY=$'%{\e[48;2;46;46;53;38;2;247;118;142m%}'
        local GIT_STAGED=$'%{\e[48;2;46;46;53;38;2;224;175;104m%}'
        local CAP_L_FG=$'%{\e[38;2;61;89;161m%}'
        local CAP_R_FG=$'%{\e[0m\e[38;2;46;46;53m%}'
        local RESET=$'%{\e[0m%}'

        local CAP_L=$'\ue0b6'
        local CAP_R=$'\ue0b4'
        local SEP=$'\ue0b0'
        local I_GITHUB=$'\uf09b'
        local I_BRANCH=$'\ue725'
        local I_MOD=$'\u25cf'
        local I_STAGED=$'\u271a'
        local I_UNTRACKED=$'\uf128'

        local git_seg=""
        if git rev-parse --is-inside-work-tree &>/dev/null; then
          local branch
          branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
          local porcelain
          porcelain=$(git status --porcelain 2>/dev/null)
          local icon=$I_BRANCH
          if git config --get remote.origin.url 2>/dev/null | grep -qi github; then
            icon=$I_GITHUB
          fi
          local marks=""
          local color=$GIT_CLEAN
          if [[ -n "''$porcelain" ]]; then
            if echo "''$porcelain" | grep -q '^[MADRC]'; then
              marks="''$marks ''$I_STAGED"
              color=$GIT_STAGED
            fi
            if echo "''$porcelain" | grep -q '^.[MD]'; then
              marks="''$marks ''$I_MOD"
              color=$GIT_DIRTY
            fi
            if echo "''$porcelain" | grep -q '^??'; then
              marks="''$marks ''$I_UNTRACKED"
              [[ "''$color" == "''$GIT_CLEAN" ]] && color=$GIT_DIRTY
            fi
          fi
          git_seg="''$color ''$icon ''$branch''$marks "
        fi

        PROMPT="''$CAP_L_FG''$CAP_L''$USER_SEG %n ''$SEP_USR_DIR''$SEP''$DIR_SEG %~ ''$git_seg''$CAP_R_FG''$CAP_R''$RESET "
      }

      add-zsh-hook precmd __build_prompt

      # ── Run nitch on shell startup ────────────────────────────────
      if command -v nitch &>/dev/null && [[ -z "''$NITCH_SHOWN" ]]; then
        export NITCH_SHOWN=1
        nitch
      fi

      # ── Local Sourcing ────────────────────────────────────────────
      if [ -f "''$HOME/.openclaw/completions/openclaw.zsh" ]; then
        source "''$HOME/.openclaw/completions/openclaw.zsh"
      fi

      if [ -f "''$HOME/.local/bin/env" ]; then
        source "''$HOME/.local/bin/env"
      fi
    '';
  };

  home.packages = with pkgs; [
    eza
    # neovim
    nitch
    git
  ];

  home.sessionPath = [
    "$HOME/.npm-global/bin"
    "$HOME/.local/bin"
  ];
}

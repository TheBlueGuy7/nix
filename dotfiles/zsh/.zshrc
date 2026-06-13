export PATH="/usr/bin:$PATH"
# ~/.zshrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ── Aliases ───────────────────────────────────────────
if command -v eza &>/dev/null; then
    alias ls='eza --color=auto --icons=auto --group-directories-first'
    alias ll='eza -l --color=auto --icons=auto --group-directories-first'
    alias la='eza -la --color=auto --icons=auto --group-directories-first'
    alias lt='eza --tree --color=auto --icons=auto --group-directories-first'
else
    alias ls='ls --color=auto'
fi
alias grep='grep --color=auto'
alias v='nvim'

# ── Completion ────────────────────────────────────────
# Load zsh's completion system
autoload -Uz compinit
compinit

# Nicer completion behavior
zstyle ':completion:*' menu select                          # arrow-key menu
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # case-insensitive
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"     # colorize matches
zstyle ':completion:*' group-name ''                        # group by category
zstyle ':completion:*:descriptions' format '%F{cyan}── %d ──%f'

# History (so up-arrow / Ctrl-R actually remember things)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS HIST_IGNORE_SPACE SHARE_HISTORY INC_APPEND_HISTORY

# ── Powerline-style prompt (matches ags theme) ────────
setopt PROMPT_SUBST
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
        if [[ -n "$porcelain" ]]; then
            if echo "$porcelain" | grep -q '^[MADRC]'; then
                marks="${marks} ${I_STAGED}"
                color=$GIT_STAGED
            fi
            if echo "$porcelain" | grep -q '^.[MD]'; then
                marks="${marks} ${I_MOD}"
                color=$GIT_DIRTY
            fi
            if echo "$porcelain" | grep -q '^??'; then
                marks="${marks} ${I_UNTRACKED}"
                [[ "$color" == "$GIT_CLEAN" ]] && color=$GIT_DIRTY
            fi
        fi
        git_seg="${color} ${icon} ${branch}${marks} "
    fi

    PROMPT="${CAP_L_FG}${CAP_L}${USER_SEG} %n ${SEP_USR_DIR}${SEP}${DIR_SEG} %~ ${git_seg}${CAP_R_FG}${CAP_R}${RESET} "
}

add-zsh-hook precmd __build_prompt

# ── Run nitch on shell startup ────────────────────────
if command -v nitch &>/dev/null && [[ $- == *i* ]] && [[ -z "$NITCH_SHOWN" ]]; then
    export NITCH_SHOWN=1
    nitch
fi

export PATH="$HOME/.npm-global/bin:$PATH"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# OpenClaw Completion
[ -f "/home/blueguy/.openclaw/completions/openclaw.zsh" ] && source "/home/blueguy/.openclaw/completions/openclaw.zsh"

. "$HOME/.local/share/../bin/env"

# Hermes Agent — ensure ~/.local/bin is on PATH
export PATH="$HOME/.local/bin:$PATH"

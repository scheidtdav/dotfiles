# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

# Add kitty to path
export PATH="~/.local/kitten.app/bin:$PATH"

# Zoxide
eval "$(zoxide init bash)"

# fzf
eval "$(fzf --bash)"

# starship
eval "$(starship init bash)"

# dotfiles integration
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# opencode
export PATH=$HOME/.opencode/bin:$PATH

# Flyline - enhanced Bash experience
enable flyline 2>/dev/null || enable -f "/home/david/.local/lib/libflyline.so" flyline

flyline_fzf_cd() {
    local cmd
    cmd=$(__fzf_cd__) && READLINE_LINE="$cmd" READLINE_POINT=${#cmd}
}

flyline key bind Ctrl+r 'always=runBashCommand(__fzf_history__)' # or runBashCommand(__fzf_history__)+submitOrNewline
flyline key bind Ctrl+t 'always=runBashCommand(fzf-file-widget)'
flyline key bind Alt+c  'always=runBashCommand(flyline_fzf_cd)+submitOrNewline'

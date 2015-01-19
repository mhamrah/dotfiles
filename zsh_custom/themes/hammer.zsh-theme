# Hammer theme 

# Machine name.
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || echo $HOST
}

# Directory info.
local current_dir='${PWD/#$HOME/~}'

# Git info.
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}x"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}o"

PROMPT="
%{$terminfo[bold]$fg[yellow]%}${current_dir}%{$reset_color%}\
$(git_super_status) \
%{$fg[green]%}[%*] \
%{$terminfo[bold]$fg[red]%}$ %{$reset_color%}"

# %{$fg[cyan]%}%n \
# %{$fg[white]%}at \
# %{$fg[green]%}$(box_name) \
# %{$fg[white]%}in \


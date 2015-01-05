# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PATH=$PATH:~/bin
 export PATH="$HOME/node_modules/.bin:$PATH"

function parse_git_dirty {
    [[ $(git status --porcelain 2>/dev/null) ]] && echo "*"
}

# echo "<branch name> "
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \1 /"
}

# creates out prompt text
function setUpPS1 {
    export PS1='\u@\h \[\033[1;33m\]\w\[\033[0m\]\[\033[35m\]$(parse_git_branch)\[\033[1m\]$(parse_git_dirty)\[\033[21m\]\[\033[39m\] # '
}

#
# Main, init and execut all
#
setUpPS1;

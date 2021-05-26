# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# Delete all local branches that are fully merged in
alias git-delete-merged="git branch --merged | egrep -v \"(^\*|master|beta)\" | xargs git branch -d"
alias reload!='. ~/.zshrc'

alias cls='clear' # Good 'ol Clear Screen command

# https://seb.jambor.dev/posts/improving-shell-workflows-with-fzf/
function jd() {
  local selected_file
  selected_file=$(cat ~/Library/autojump/autojump.txt | sort -k1nr | cut -f 2 | fzf --tiebreak=index)

  if [ -n "$selected_file" ]; then
      cd $selected_file
  fi
}

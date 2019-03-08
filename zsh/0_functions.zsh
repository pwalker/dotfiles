# Returns whether the given command is executable or aliased.
# from https://github.com/statico/dotfiles
_has() {
  return $( whence $1 >/dev/null )
}

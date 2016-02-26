##
# Functions
##
function vim() {
  editor="/usr/bin/vim"

  if test -e "$1" && test ! -w "$1"; then
    sudo "$editor" "$@"
  else
      "$editor" "$@"
  fi
}

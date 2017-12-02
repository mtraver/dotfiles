##################
# Finding things #
##################
alias llg="ls -al | grep -i"

# Finds files that start with the given string, case sensitive
fn() {
  if [ "$#" -ne 1 ]; then
    echo "usage: fn string"
    return 1
  fi

  find . -name "${1}*"
}

# Finds files that start with the given string, case insensitive
fni() {
  if [ "$#" -ne 1 ]; then
    echo "usage: fni string"
    return 1
  fi

  find . -iname "${1}*"
}

# Finds files that start with the given string and opens them in Sublime
lucky() {
  if [ "$#" -ne 1 ]; then
    echo "usage: lucky string"
    return 1
  fi

  find . -type f -iname "${1}*" -print0 | xargs -0 subl
}

alias fnl="lucky"


##########
# Python #
##########
alias rmpyc='find . -name "*.pyc" -delete'
alias p="python"
alias p3="python3"


#######
# Git #
#######
alias gti="git"

alias gita="git add"
alias gtia="git add"

alias gitb="git branch -v"
alias gtib="git branch -v"

alias gitbd="git branch -vD"
alias gtibd="git branch -vD"

alias gitd="git diff"
alias gtid="git diff"

alias gitl="git log"
alias gtil="git log"

alias gitlshort='git log --pretty=format:"%h %s"'
alias gtilshort='git log --pretty=format:"%h %s"'

alias gits="git status -u"
alias gtis="git status -u"

alias gitsuperc="git clean -dfx && git checkout ."


########
# Misc #
########
alias now="date '+%Y-%m-%d'"

# Lists the keys for which a file is encrypted
alias gpgls="gpg --list-only --no-default-keyring --secret-keyring /dev/null"

# Diffs a subset of two files
diff_range() {
  if [ "$#" -ne 4 ]; then
    echo "usage: diff_range file1 start,end file2 start,end"
    return 1
  fi

  local f1="$1"
  local r1="$2"

  local f2="$3"
  local r2="$4"

  meld <(sed -n "${r1}p" "$f1") <(sed -n "${r2}p" "$f2")
}
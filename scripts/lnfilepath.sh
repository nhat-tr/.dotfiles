#!/bin/zsh
function ensure_link() {
    local src
    src=$1
    echo "Source: $src"
    local target
    target=$2
    echo "Target: $target"
    local targetDir
    targetDir=$(dirname "$target")
    echo "TargetDir: $targetDir"

    mkdir -p "$target"
    ln -F -v -s "$src" "$target"
}

lastarg=${@: -1}
echo "args: $@ (lastarg: $lastarg)"
for arg in "$@"
do
  if [[ "$arg" != "$lastarg" ]]
  then
    ensure_link $arg $lastarg
  fi
done

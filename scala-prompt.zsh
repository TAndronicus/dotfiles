# Shows Scala version.
# | Variable | Default | Meaning |
# | :------- | :-----: | ------- |
# | `SPACESHIP_SCALA_SHOW` | `true` | Show current Scala version |
# | `SPACESHIP_SCALA_PREFIX` | `on ` | Prefix before the Scala section |
# | `SPACESHIP_SCALA_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the Scala section |
# | `SPACESHIP_SCALA_SYMBOL` | `☕☕☕☕☕` | Character to be shown before Scala version |
# | `SPACESHIP_SCALA_COLOR` | `magenta` | Color of Scala section |

SPACESHIP_SCALA_SHOW="${SPACESHIP_SCALA_SHOW:=true}"
SPACESHIP_SCALA_PREFIX="${SPACESHIP_SCALA_PREFIX:="on "}"
SPACESHIP_SCALA_SUFFIX="${SPACESHIP_SCALA_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_SCALA_SYMBOL="${SPACESHIP_SCALA_SYMBOL:="☕:scala:"}"
SPACESHIP_SCALA_COLOR="${SPACESHIP_SCALA_COLOR:="red"}"

spaceship_SCALA() {
  [[ $SPACESHIP_SCALA_SHOW == false ]] && return
  
   spaceship::exists SCALA || return
   
   # Show SCALA version only for SCALA-related folders
       [[ -f build.sbt ]] || [[ -n *.scala(#qN^/) || -n *.class(#qN^/) ]] || return
  
   local scala_version=$(scala --version 2>&1 | sed -r 's/.*version (\S*) .*/\1/')
   
   spaceship::section \
    "$SPACESHIP_SCALA_COLOR" \
    "$SPACESHIP_SCALA_PREFIX" \
    "${SPACESHIP_SCALA_SYMBOL}v${scala_version}" \
    "$SPACESHIP_SCALA_SUFFIX"
}

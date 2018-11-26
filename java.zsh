# Shows Java version.
# | Variable | Default | Meaning |
# | :------- | :-----: | ------- |
# | `SPACESHIP_JAVA_SHOW` | `true` | Show current Java version or not |
# | `SPACESHIP_JAVA_PREFIX` | `on ` | Prefix before the Java section |
# | `SPACESHIP_JAVA_SUFFIX` | `$SPACESHIP_PROMPT_DEFAULT_SUFFIX` | Suffix after the Java section |
# | `SPACESHIP_JAVA_SYMBOL` | `☕☕☕☕☕` | Character to be shown before Java version |
# | `SPACESHIP_JAVA_COLOR` | `magenta` | Color of Java section |

SPACESHIP_JAVA_SHOW="${SPACESHIP_JAVA_SHOW:=true}"
SPACESHIP_JAVA_PREFIX="${SPACESHIP_JAVA_PREFIX:="on "}"
SPACESHIP_JAVA_SUFFIX="${SPACESHIP_JAVA_SUFFIX:="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_JAVA_SYMBOL="${SPACESHIP_JAVA_SYMBOL:="☕ "}"
SPACESHIP_JAVA_COLOR="${SPACESHIP_JAVA_COLOR:="green"}"

spaceship_java() {
  [[ $SPACESHIP_JAVA_SHOW == false ]] && return
  
   spaceship::exists java || return
   
   # Show Java version only for Java-related folders
       [[ -f pom.xml ]] || [[ -f build.gradle ]] || [[ -n *.java(#qN^/) || -n *.class(#qN^/) ]] || return
  
   local java_version=$(java -version 2>&1 | head -n 1 | awk -F '"' '{print $2}')
   
   spaceship::section \
    "$SPACESHIP_JAVA_COLOR" \
    "$SPACESHIP_JAVA_PREFIX" \
    "${SPACESHIP_JAVA_SYMBOL}v${java_version}" \
    "$SPACESHIP_JAVA_SUFFIX"
}

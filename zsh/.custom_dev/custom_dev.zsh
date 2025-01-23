export GTK_THEME=GruvBox-Dark

# Default editor
export EDITOR=/usr/bin/nvim
export SHELL=/bin/zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# CACHE
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$HOME/.local/bin:$PATH"

# Ruby
#export PATH="$PATH:/usr/bin"

# Rest
source "$HOME/.cargo/env"
#export PATH="$HOME/.cargo/env:$PATH"

# Java Environtment
export PATH="/usr/lib/jvm/default/bin:$PATH"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

#export PATH="/usr/lib/jvm/java-8-openjdk/bin:$PATH"

# Android Environtment
export ANDROID_HOME="$HOME/.development/android/Sdk"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"
export PATH="$PATH":"$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"

# Flutter Environtment
export PATH="/usr/lib/dart/bin:$PATH"
export PATH="$HOME/.development/flutter/bin:$PATH"
export FVM_CACHE_PATH="$HOME/.development/fvm/cache"

# Chrome Environtment
export CHROME_EXECUTABLE="/usr/bin/chromium"

export CXX="g++"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

alias vi="nvim"
alias vim="nvim"
alias vit="nvim +'terminal' +'startinsert'"
alias python="python3"
alias pip="pip3"
alias folder="pcmanfm"

# Docker
alias dcd="docker-compose -f docker-compose.yml -f docker-compose.dev.yml down"
alias dcu="docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d"
alias dcub="docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d --build"

alias dcdp="docker-compose -f docker-compose.yml -f docker-compose.prod.yml down"
alias dcup="docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d"
alias dcubp="docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d --build"

# Flutter Development
# alias fr="flutter pub run bin/flavor development && flutter run --flavor development | grep --color=never '/flutter'"
alias fr="fvm flutter pub run bin/flavor development && flutter run --flavor development | grep -v -e 'gralloc4' -e 'I/ScrollIdentify'"
alias frmobile="fvm flutter pub run bin/flavor development && flutter run --flavor development -d emulator-5554 | grep -v -e 'gralloc4' -e 'I/ScrollIdentify'"
alias frweb="fvm flutter pub run bin/flavor development && flutter run --flavor development -d web-server --web-hostname localhost --web-port 5000 | grep -v -e 'gralloc4' -e 'I/ScrollIdentify'"
# alias frchrome="flutter pub run bin/flavor development && flutter run --flavor development -d chrome | grep --color=never '/flutter'"
# alias frchrome="flutter pub run bin/flavor development && flutter run -d chrome | grep --color=never '/flutter'"
alias frchrome="fvm flutter pub run bin/flavor development && flutter run -d chrome"
alias frlinux="fvm flutter pub run bin/flavor development && flutter run --flavor development -d linux | grep -v -e 'gralloc4' -e 'I/ScrollIdentify'"
alias frd="flutter pub run bin/flavor development && flutter run --flavor development | grep -v -e 'gralloc4' -e 'I/ScrollIdentify'"
alias frdp="flutter pub run bin/flavor production && flutter run --flavor development | grep -v -e 'gralloc4' -e 'I/ScrollIdentify'"
alias frs="flutter pub run bin/flavor staging && flutter run --flavor staging | grep -v -e 'gralloc4' -e 'I/ScrollIdentify'"
alias frp="flutter pub run bin/flavor production && flutter run --release --flavor production | grep -v -e 'gralloc4' -e 'I/ScrollIdentify'"

alias fba="flutter pub run bin/flavor development && flutter build apk --flavor development"
alias fbad="flutter pub run bin/flavor development && flutter build apk --flavor development"
alias fbadp="flutter pub run bin/flavor development && flutter build apk --flavor production"
alias fbas="flutter pub run bin/flavor staging && flutter build apk --flavor staging"
alias fbap="flutter pub run bin/flavor production && flutter build apk --flavor production"

alias fbab="flutter pub run bin/flavor development && flutter build appbundle --flavor development"
alias fbabd="flutter pub run bin/flavor development && flutter build appbundle --flavor development"
alias fbabs="flutter pub run bin/flavor staging && flutter build appbundle --flavor staging"
alias fbabp="flutter pub run bin/flavor production && flutter build appbundle --flavor production"

alias fbwebp="flutter pub run bin/flavor production && flutter build web --release"

alias fpg="fvm flutter pub get"

# Android Emulator
alias fee="flutter emulators --launch Pixel_4a_API_33"
alias feei="flutter emulators --launch apple_ios_simulator"

# Open Terminal SSH
alias sshwork="~/.config/i3/scripts/alacritty_ssh.sh"

# Open ViM work_document.md
alias docwork="~/.config/i3/scripts/alacritty_work_doc.sh"

# Open ViM pass_document.txt
alias docpass="sudo vim ~/.file_pass/pass_document.txt"

# Open vifm ~/Pictures/Screenshots/
alias ssp="open ~/Pictures/Screenshots/"

# Tmux open new-session dev
alias tmux_session_dev="~/.config/tmux-session/tmux_init_sessions.sh"

# Lua run posmane
alias posmane="lua /home/mane/works/lua/mane_post/main.lua"

# Open file
alias open="nohup pcmanfm > /dev/null 2>&1 &"

# Open file
alias scrcpy="nohup scrcpy --no-audio > /dev/null 2>&1 &"

# tmux alias
alias tm=tmux
alias tma=tmux a







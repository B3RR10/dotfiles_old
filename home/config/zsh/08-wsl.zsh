# Usefull aliases and functions for WSL

alias dotnet=dotnet.exe
alias nuget=nuget.exe

vs_path="/mnt/c/Program Files (x86)/Microsoft Visual Studio/2019/Professional/Common7/IDE/devenv.exe"
vs() {
    if [[ $# -eq 0 ]]; then
        $vs_path > /dev/null &
    else
        $vs_path "$@" > /dev/null &
    fi
}

wix_path="/mnt/c/Program Files (x86)/Microsoft Visual Studio/2019/Professional/MSBuild/Current/Bin/MSBuild.exe"
wix() {
    $wix_path ${@/\\/\/} /p:VisualStudioVersion=14.0 /p:Configuration=Release
}

alias e='explorer.exe .'

mount-drives() {
    sudo mount -t drvfs H: /mnt/h -o uid=$(id -u),gid=$(id -g)
    sudo mount -t drvfs T: /mnt/t -o uid=$(id -u),gid=$(id -g)
    sudo mount -t drvfs W: /mnt/w -o uid=$(id -u),gid=$(id -g)
}

alias zd10="sudo mount -t drvfs '\\\\zentraldl10\\dmi$' /mnt/ZD10 -o uid=$(id -u),gid=$(id -g)"
alias zd11="sudo mount -t drvfs '\\\\zentraldl11\\dmi$' /mnt/ZD11 -o uid=$(id -u),gid=$(id -g)"
alias zd12="sudo mount -t drvfs '\\\\zentraldl12\\dmi$' /mnt/ZD12 -o uid=$(id -u),gid=$(id -g)"

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

alias e='explorer.exe .'

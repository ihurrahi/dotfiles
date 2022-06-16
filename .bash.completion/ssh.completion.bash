# Add bash completion for ssh: it tries to complete the host to which you 
# want to connect from the list of the ones contained in ~/.ssh/known_hosts

__ssh_known_hosts() {
    if [[ -f ~/.ssh/known_hosts ]]; then
        cut -d " " -f1 ~/.ssh/known_hosts | cut -d "," -f1
    fi
}

_ssh() {
    local cur known_hosts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    known_hosts="$(__ssh_known_hosts)"
    
    if [[ ! ${cur} == -* ]] ; then
        if [[ ${cur} == *@* ]] ; then
            COMPREPLY=( $(compgen -W "${known_hosts}" -P @ -- ${cur/*@/}) )
        else
            COMPREPLY=( $(compgen -W "${known_hosts}" -- ${cur}) )
        fi
    fi
    return 0
}

_auto_complete() {
  complete -o bashdefault -o default -F $1 $2 2>/dev/null || complete -o default -F $1 $2
}

_auto_complete _ssh ssh
_auto_complete _ssh scp


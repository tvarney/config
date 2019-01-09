
# Prevent double eval
if [ ! -z "${_PROFILE_LOADED}" ]; then
    return
fi
export _PROFILE_LOADED="TRUE"

# Functon which encapsulates the check and sourcing of a sub-script
function import() {
    if [ -e "$1" ]; then
        source "$1"
    fi
}

# I love this
export import

export GOPATH="${HOME}/Source/Golang"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    import "${HOME}/.bashrc"
fi

import "${HOME}/.path"


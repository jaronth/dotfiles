#  ---------------------------------------------------------------------------
#
#  Description:  My configuration for Z Shell
#
#  Sections:
#  1.   Initialize Prompt
#  2.   Load Profile
#  3.   Reminders & Notes
#
#  ---------------------------------------------------------------------------

#   ---------------------------------------
#   1. INITIALIZE PROMPT
#   ---------------------------------------
    eval "$(starship init zsh)"
    eval "$(/usr/local/bin/brew shellenv)"

#   ---------------------------------------
#   2. LOAD PROFILE
#   ---------------------------------------
    if [[ -z ${COMING_FROM_PROFILE} ]]; then        # If NOT coming from .profile
        if [[ -r ~/.profile ]]; then
            export COMING_FROM_SHELLRC=1
            source ~/.profile                       # Load .profile
            unset COMING_FROM_SHELLRC
        fi
    fi


#   ---------------------------------------
#   3.  REMINDERS & NOTES
#   ---------------------------------------
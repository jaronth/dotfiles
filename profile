#  ---------------------------------------------------------------------------
#
#  Description:  This file holds my shell configurations.
#                Content for ~/.profile file.
#                On macOS and Linux.
#
#  Sections:
#  1.   Determine Environment
#  2.   Environment Configuration
#  3.   Reminders & Notes
#
#  ---------------------------------------------------------------------------

#   ---------------------------------------
#   1.  DETERMINE ENVIRONMENT
#   ---------------------------------------

#   Init Variables
#   ------------------------------------------------------------
    unset IS_MACOS
    unset IS_LINUX

    case "$(uname -s)" in
    Darwin*)
        IS_MACOS=true
        ;;
    Linux*)
        IS_LINUX=true
        ;;
    esac

#   Load Shell RC Files
#   ------------------------------------------------------------
    if [[ -z ${COMING_FROM_SHELLRC} ]]; then        # If NOT coming from .zshrc or .bashrc
        if [[ -n ${IS_LINUX} && -r ~/.bashrc ]]; then
            export COMING_FROM_PROFILE=1
            source ~/.bashrc                        # Load .bashrc if using bash
            unset COMING_FROM_PROFILE
        fi
        if [[ -n ${IS_MACOS} && -r ~/.zshrc ]]; then
            export COMING_FROM_PROFILE=1
            source ~/.zshrc                         # Load .zshrc if using zshell
            unset COMING_FROM_PROFILE
        fi
    fi

#   If Running macOS
#   ------------------------------------------------------------
    if [[ -n ${IS_MACOS} ]]; then
        setopt HIST_IGNORE_SPACE 2>/dev/null        # Don't put lines starting with space in the history
    fi

#   If Running Linux
#   ------------------------------------------------------------
    if [[ -n ${IS_LINUX} ]]; then
        HISTCONTROL=ignoreboth                      # Don't put duplicate lines or lines starting with space in the history
        HISTSIZE=1000
        HISTFILESIZE=2000
        shopt -s histappend                         # Append to the history file, don't overwrite it        
    fi


#   ---------------------------------------
#   2.  ENVIRONMENT CONFIGURATION
#   ---------------------------------------

#   Set Paths
#   ------------------------------------------------------------
    prepend_path() {                                # Prepend directory to PATH
        if [[ -d ${1} ]]; then                      # -d:           Skipped if directory does not exist
            export PATH="$1:$PATH"                  # $1:           Argument should be /absolute/path or ~/user/path
        else
            return 1
        fi
    }

#   Add User Local Binaries
#   ------------------------------------------------------------
    prepend_path /bin                               # /bin
    prepend_path ~/.local/bin                       # ~/.local/bin

#   Add Homebrew Binaries
#   ------------------------------------------------------------
    prepend_path /usr/local/bin                     # /usr/local/bin
    prepend_path /usr/local/sbin                    # /usr/local/sbin
    prepend_path /home/linuxbrew/.linuxbrew/bin     # /home/linuxbrew/.linuxbrew/bin

#   Add Other Binaries
#   ------------------------------------------------------------
    prepend_path ~/.composer/vendor/bin             # ~/.composer/vendor/bin
    prepend_path ~/.pyenv/bin                       # ~/.pyenv/bin

#   Set Default Editor
#   ------------------------------------------------------------
    export EDITOR=/usr/bin/vim

#   Load Environment Variables
#   ------------------------------------------------------------
    if [[ -r ~/.env ]]; then
        source ~/.env
    fi

#   Load Aliases and Functions
#   ------------------------------------------------------------
    if [[ -r ~/.aliases ]]; then
        source ~/.aliases
    fi


#   ---------------------------------------
#   3.  REMINDERS & NOTES
#   ---------------------------------------

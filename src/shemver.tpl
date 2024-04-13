#!/usr/bin/env sh

COMMAND="$1"
case "$COMMAND" in
"" | help | "-h" | "--help")
    cat <<EOHELP
Usage: $0 [OPTION]... [COMMAND]

Inspect and modify Semantic Version numbers.

Commands:
    help     show this help text
    license  show the license this tool is distributed under
    version  show this tool's version number
EOHELP
    return 0
    ;;

license)
    cat <<EOLICENSE
<% $LICENSE %>
EOLICENSE
    return 0
    ;;

version | "--version")
    cat <<EOVERSION
shemver <% $VERSION %>
Copyright (C) 2024 Tom Chapple
This tool is licensed under the MIT License. Use the "license" command
for more detail.
EOVERSION
    return 0
    ;;

*)
    >&2 cat <<EOINVALID
Invalid command received "$COMMAND".
Refer to "$0 help" for a list of commands.
EOINVALID
    return 1
    ;;

esac

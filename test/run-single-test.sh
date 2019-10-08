#!/usr/bin/env bash

###############################################################################
# Run single test case
###############################################################################

if [ $# -eq 0 ]; then
    echo "Please supply an input *.vader file"
    exit 1
fi

RUNVIM="nvim"

VADER_OUTPUT_FILE=$(mktemp)
trap "rm -f ${VADER_OUTPUT_FILE}" EXIT INT QUIT TERM

if [[ ! -d "vader.vim" ]]; then
  git clone https://github.com/junegunn/vader.vim.git
fi

# Open neovim with readonly mode just to execute specific test.
${RUNVIM} -u minimal_init.vim -c "Vader! ${1}" > /dev/null
VADER_EXIT=$?

if [[ -n "${VADER_OUTPUT_FILE}" ]]; then
    cat "${VADER_OUTPUT_FILE}"
fi

exit ${VADER_EXIT}

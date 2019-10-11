#!/usr/bin/env bash

###############################################################################
# Run all test case
###############################################################################

RUNVIM="nvim"

VADER_OUTPUT_FILE=$(mktemp)
trap "rm -f ${VADER_OUTPUT_FILE}" EXIT INT QUIT TERM

if [[ ! -d "vader.vim" ]]; then
    git clone https://github.com/junegunn/vader.vim.git
fi

# Open neovim with readonly mode just to execute all *.vader tests.
covimerage run ${RUNVIM} -u minimal_init.vim -c 'Vader! case/*.vader' >/dev/null
VADER_EXIT=$?

if [[ -n "${VADER_OUTPUT_FILE}" ]]; then
    cat "${VADER_OUTPUT_FILE}"

    covimerage xml
fi

exit ${VADER_EXIT}

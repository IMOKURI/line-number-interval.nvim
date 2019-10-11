#!/usr/bin/env bash

###############################################################################
# Run all test case
###############################################################################

RUNVIM="nvim"

VADER_OUTPUT_FILE=$(mktemp)
trap "rm -f ${VADER_OUTPUT_FILE}" EXIT INT QUIT TERM

if [[ ! -d "test/vader.vim" ]]; then
    git clone https://github.com/junegunn/vader.vim.git test/vader.vim
fi

# Open neovim with readonly mode just to execute all *.vader tests.
covimerage run ${RUNVIM} -u test/minimal_init.vim -c 'Vader! test/case/*.vader' >/dev/null
VADER_EXIT=$?

if [[ -n "${VADER_OUTPUT_FILE}" ]]; then
    cat "${VADER_OUTPUT_FILE}"
fi

exit ${VADER_EXIT}

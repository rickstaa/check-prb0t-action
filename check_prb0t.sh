#!/bin/bash

# Check if PRB0T is in the list of authors.
if [[ $GITHUB_ACTOR =~ "PRB0t" ]]; then
    used_prbot="true"
    echo "Pull request was created using PRB0t."
else
    used_prbot="false"
    echo "Pull request was not created using PRB0t."
fi

# Set output and environment variable.
echo "used_prb0t=${used_prbot}" >> "${GITHUB_OUTPUT}"
echo "USED_PRB0T=${used_prbot}" >> "${GITHUB_ENV}"
exit 0

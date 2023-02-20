#!/bin/bash

# Check if PRB0T is in the list of authors.
if [[ $GITHUB_ACTOR =~ "PRb0t" ]]; then
    used_prbot="true"
    echo "Pull request was created using PRb0t."
else
    used_prbot="false"
    echo "Pull request was not created using PRb0t."
fi

# Set output and environment variable.
echo "used_prb0t=${used_prbot}" >> "${GITHUB_OUTPUT}"
echo "USED_PRB0T=${used_prbot}" >> "${GITHUB_ENV}"
exit 0

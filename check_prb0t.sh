#!/bin/bash

# Get main author.
authors=$(git log -1 --pretty=format:'%an ')

# Get co-authors.
authors+=$(git log -1 --pretty=format:'%b')

# Check if PRB0T is in the list of authors.
if [[ $authors =~ "PRB0T" ]]; then
    used_prbot="true"
    echo "PRB0T is in the list of authors."
else
    used_prbot="false"
    echo "PRB0T is not in the list of authors."
fi

# Set output and environment variable.
echo "used_prb0t=$used_prbot" >> $GITHUB_OUTPUT
echo "USED_PRB0T=$used_prbot" >> $GITHUB_ENV
exit 0

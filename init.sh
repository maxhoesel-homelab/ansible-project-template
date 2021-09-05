#!/usr/bin/env bash

# Updates the project repository by inserting the project name into all files
# where an explicit mention is required (e.g. ansible inventory, tox)

set -eu
set -o pipefail

REPLACE_STRING_REPO="REPLACEME_PROJECT_REPO"
REPLACE_STRING_NAME="REPLACEME_PROJECT_NAME"

main() {
    project_repo=$(git remote get-url origin | rev | cut -d '/' -f 1 | rev | sed 's/.git$//')
    project_name=$(echo "$project_repo" | cut -d '-' -f3-)

    find ./ \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "s/$REPLACE_STRING_REPO/$project_repo/g"
    find ./ \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "s/$REPLACE_STRING_NAME/$project_name/g"

    #sed -i "s/$REPLACE_STRING_REPO/$project_repo/" .github/**/*.yml inventory/**/*.yml tox.ini
    #sed -i "s/$REPLACE_STRING_NAME/$project_name/" .github/**/*.yml inventory/**/*.yml tox.ini

    echo Project Initialized!
    rm ./init.sh
}

main

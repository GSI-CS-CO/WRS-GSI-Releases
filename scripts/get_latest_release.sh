#!/bin/bash

# Download the latest WRS release (tarball) from the Github repo

# URLs
url_repo_api="https://api.github.com/repos/GSI-CS-CO/wrs-gsi-releases"
url_latest_api="$url_repo_api/releases/latest"

# Get the information about the latest release

latest_release_api=$(curl -s $url_latest_api)
#echo $latest_release_api

# Extract a download URL from the release information

url_download=$(echo $latest_release_api | sed -e 's/.*"browser_download_url": "\([^"]*\)".*/\1/')
#url_download=$(echo $latest_release_api | sed -E 's/.*"browser_download_url": "?([^,"]*)"?.*/\1/')  # works too
#echo $url_download

# Download a target tarball

wget -nc $url_download

# Command options

# curl options:
# -L: redirect to moved location
# -s: silent

# sed options:
# -e: basic expression
# s/regexp/replacement/[flags]: attempt to match the pattern space against 'regexp'
#              if the match found, then that portion is replaced with 'replacement'
# \1: in 'replacement' it refers to a portion of the match which is contained
#              between the 'n'th and '\)' and its matching '\)'
# [^"]: bracket subexpression that excludes '"' from list
# \(regexp\): groups 'regexp' as a whole
# \([^"]*\): all characters until first '"'

# -E: extended regular expression

# wget options:
# -nc: prevent download an existing target file

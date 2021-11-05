#!/bin/bash
set -e

# To update elasticsearch exporter, update the version number in the VERSION file
version_num=$(cat VERSION)
download_url="https://github.com/prometheus-community/elasticsearch_exporter/releases/download/v$version_num"
archive_name="elasticsearch_exporter-$version_num.linux-amd64.tar.gz"

archive_url="$download_url/$archive_name"
shasum_url="$download_url/sha256sums.txt"

# Download the elasticsearch exporter archive and shasum file
wget --quiet "$archive_url"
wget --quiet "$shasum_url"

# Compare sha256sum
sha256sum --check --ignore-missing --status sha256sums.txt

# Extract the archive to the current directory
tar -xzf "$archive_name" --strip-components 1
rm "$archive_name" sha256sums.txt

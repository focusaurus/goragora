#!/usr/bin/env bash
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
echo -n "node…"
local node_version
node_version="$(cat .nvmrc)"
local node_archive="node-v${node_version}-linux-x64.tar.gz"
local node_url
node_url="https://nodejs.org/dist/v${node_version}/${node_archive}"
if [[ ! -f "${node_archive}" ]]; then
  curl --silent --fail --location --remote-name "${node_url}"
fi
install_dir="./node"
if [[ -d "${install_dir}" ]]; then
  rm -rf "${install_dir}"
fi
mkdir -p "${install_dir}"
tar --directory "${install_dir}" --strip-components=1 --extract --file "${node_archive}"
echo "✓"

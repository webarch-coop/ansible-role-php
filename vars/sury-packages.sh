#!/usr/bin/env bash
# Ansible managed

# Copyright 2019-2024 Chris Croome
#
# This file is part of the Webarchitects PHP Ansible role.
#
# The Webarchitects PHP Ansible role is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#
# The Webarchitects PHP Ansible role is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with the Webarchitects PHP Ansible role. If not, see <https://www.gnu.org/licenses/>

set -euo pipefail

debian_distros=(bookworm bullseye)

for distro in "${debian_distros[@]}"; do
  # shellcheck disable=SC2016 disable=SC2086
  packages="$(wget -q https://packages.sury.org/php/dists/${distro}/main/binary-amd64/Packages.gz -O - | gunzip - | grep -e '^Package' | grep -ve '-dbgsym$' -e '-dbg$' -e '-dev$' | sed 's/^Package: /  - /' | sort )"
  echo ""
  echo "# Debian ${distro} packages"
  echo "php_debian_${distro}_pkg:"
  echo "${packages}"
done
echo "..."


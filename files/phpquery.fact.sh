#!/usr/bin/env bash
# Ansible managed

set -euo pipefail

gawk_path="$(type -p gawk)"
grep_path="$(type -p grep)"
jo_path="$(type -p jo)"
phpquery_path="/usr/sbin/phpquery"
sort_path="$(type -p sort)"

# shellcheck disable=SC2046
if [[ -e "${gawk_path}" && -e "${grep_path}" && -e "${jo_path}" && -e "${phpquery_path}" && -e "${sort_path}" ]]
then
  declare -a versions
  readarray -t versions < <("${phpquery_path}" -V | "${sort_path}" -V)
  "${jo_path}" state=present versions=$(
    "${jo_path}" $(
      for v in "${versions[@]}"
      do
        declare -a mods_available
        readarray -t mods_available < <("${phpquery_path}" -v "${v}" -M | "${sort_path}")
        declare -a sapis
        readarray -t sapis < <("${phpquery_path}" -v "${v}" -S | "${sort_path}")
        echo "${v}"=$(
          "${jo_path}" state=present mods_available=$("${jo_path}" -a "${mods_available[@]}") $(
            for s in "${sapis[@]}"
            do
              declare -a mods_enabled
              readarray -t mods_enabled < <("${phpquery_path}" -d -v "${v}" -s "${s}" -M | "${grep_path}" "Enabled for ${s}" | "${gawk_path}" '{ print $1 }' | "${sort_path}")
              echo sapis["${s}"]=$(
                "${jo_path}" state=present mods_enabled=$(
                  "${jo_path}" -e -a "${mods_enabled[@]}"
                )
              )
            done
          )
        )
      done
    )
  )
elif [[ -e "${jo_path}" ]]
then
  "${jo_path}" state=absent
else
  echo '{"state":"absent"}'
fi

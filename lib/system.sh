#!/usr/bin/env bash

get_hostname() {
    hostname
}

get_os_name() {
    . /etc/os-release
    echo "$NAME"
}

get_os_version() {
    . /etc/os-release
    echo "$VERSION_ID"
}

get_os() {
    echo "$(get_os_name) $(get_os_version)"
}

get_environment() {
    if grep -qi microsoft /proc/version; then
        echo "WSL2"
        return
    fi

    if command -v systemd-detect-virt >/dev/null 2>&1; then
        local virt
        virt=$(systemd-detect-virt)

        if [[ "$virt" != "none" ]]; then
            echo "$virt"
            return
        fi
    fi

    echo "BareMetal"
}

get_github_key_title() {
    echo "$(get_hostname) $(get_environment) $(get_os)"
}

#!/bin/sh
# Runs every VanaBlu test suite against the addon in the repository root.
# Usage: sh tests/run_all.sh   (from the repository root)
cd "$(dirname "$0")/.." || exit 1
status=0
for t in tests/test_*.lua; do
    rm -rf /tmp/vbspd /tmp/vbtrk /tmp/vbtest /tmp/vbaudit /tmp/vbequip
    printf '%-28s ' "$t"
    out=$(texlua "$t" . 2>&1)
    rc=$?
    echo "$out" | tail -n 1
    if [ $rc -ne 0 ]; then
        echo "$out" | grep '^FAIL'
        status=1
    fi
done
exit $status

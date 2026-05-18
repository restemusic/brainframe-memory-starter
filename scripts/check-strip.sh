#!/usr/bin/env bash
# Checks for forbidden internal references before distribution commits
# Exits non-zero if any forbidden term is found in non-.git files

FORBIDDEN=(
    "YOUR_GITHUB_USER"
    "YOUR_COMMS_REPO"
    "YOUR_PUBLIC_REPO"
    "Project Owner"
    "Bitcoin Brains"
    "Doppler"
    "Nightwatch"
    "coinbeast"
    "admin DAI"
    "dp.st.admin"
)

FOUND=0
for term in "${FORBIDDEN[@]}"; do
    matches=$(grep -rn --exclude-dir=.git --exclude="check-strip.sh" "$term" . 2>/dev/null || true)
    if [[ -n "$matches" ]]; then
        echo "FORBIDDEN TERM FOUND: $term"
        echo "$matches"
        FOUND=1
    fi
done

if [[ $FOUND -eq 1 ]]; then
    echo ""
    echo "Strip check FAILED. Remove internal references before distributing."
    exit 1
else
    echo "Strip check PASSED."
fi

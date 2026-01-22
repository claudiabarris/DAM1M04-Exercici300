#!/bin/bash
SCHEMA=$1
DATA=$2

TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

cp "$SCHEMA" "$DATA" validate.cjs "$TMP_DIR"
cd "$TMP_DIR"

npm init -y >/dev/null 2>&1
npm install ajv ajv-formats >/dev/null 2>&1

node validate.cjs "$(basename "$SCHEMA")" "$(basename "$DATA")"
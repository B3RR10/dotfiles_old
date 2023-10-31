#!/usr/bin/bash

filename="$(mktemp -d)/the_economist.mobi"

echo "--- Downloading The Economist"
ebook-convert "The Economist.recipe" "$filename" \
    --output-profile "kindle_pw"

echo "--- Sending to Kindle"
calibre-smtp \
    --relay "smtp.mailbox.org" \
    --encryption-method "TLS" \
    --port 587 \
    --username "mail@berrio.dev" \
    --password "0TGNrRReCYPfbidCiaRRjXORsiojEBlw" \
    --subject "The Economist" \
    --attachment "$filename" \
    mail@berrio.dev \
    miguelberrio_34@kindle.com \
    "Automatic message"

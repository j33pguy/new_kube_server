   
#!/bin/sh
set -e

cd "$(mktemp -d)"

# TODO eventually update this to detect
os=linux
arch=amd64

file=$(curl -sSL  "https://golang.org/dl/?mode=json" \
	  | jq -r '.[0].files[]
	  | select(.os == "'"$os"'")
	  | select(.arch == "'"$arch"'")
          | .filename')

curl -sSLO \
  -H "Accept: application/vnd.github.v3+json" \
   "https://dl.google.com/go/$file"

sudo tar xzf "$file" -C /usr/local/

echo "Make sure /usr/local/go/bin is in PATH"

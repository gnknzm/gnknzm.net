#!/bin/bash

set -eux
shopt -s extglob

depends=( curl inkscape )
notfound=()

for app in "${depends[@]}"; do
	if ! type "$app" > /dev/null 2>&1; then
		notfound+=("$app")
	fi
done

if [[ ${#notfound[@]} -ne 0 ]]; then
	echo Failed to lookup dependency:

	for app in "${notfound[@]}"; do
		echo "- $app"
	done

	exit 1
fi

# depName=git@github.com:notofonts/noto-fonts.git
NOTOFONTS_COMMIT="2725c70baa8b0176c7577093ba1fc6179aa79478"

mkdir -p ~/.fonts

curl -L -f -s \
	--output ~/.fonts/NotoSans-Medium.ttf \
	"https://raw.githubusercontent.com/notofonts/noto-fonts/${NOTOFONTS_COMMIT}/hinted/ttf/NotoSans/NotoSans-Medium.ttf"

inkscape --export-type=png ./logo/*.svg

mkdir -p ./static/imgs/

cp ./logo/*.png ./static/imgs/

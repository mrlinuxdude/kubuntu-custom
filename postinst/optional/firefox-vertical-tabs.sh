#!/bin/bash
set -e
# Firefox vertical tabs
mkdir -p "$(fdfind default-release "$HOME"/.mozilla/firefox)"/chrome
cp -rf\
  kubuntu-custom/assets/text/firefox-vertical-tabs.css\
  "$(fdfind default-release "$HOME"/.mozilla/firefox)"/chrome/userChrome.css
cat <<EOF |tee "$(fdfind default-release "$HOME"/.mozilla/firefox)"/user.js>/dev/null
user_pref("extensions.pocket.enabled", false);
user_pref("mousewheel.default.delta_multiplier_y", 40);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
EOF
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://api.github.com/repos/mbnuqw/sidebery/releases|\
	grep browser_download_url|grep download|grep .xpi|head -n1|cut -d '"' -f4)"
mv sideberry.xpi /tmp/
firefox /tmp/sidebery.xpi&
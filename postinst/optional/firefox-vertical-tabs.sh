#!/bin/bash
set -e
# Firefox vertical tabs
mkdir -p "$(fdfind default-release "$HOME"/.mozilla/firefox)"/chrome
cp -rf\
  kubuntu-custom/assets/text/firefox-vertical-tabs.css\
  "$(fdfind default-release "$HOME"/.mozilla/firefox)"/chrome/userChrome.css
cat <<EOF |tee "$(fdfind default-release "$HOME"/.mozilla/firefox)"/user.js>/dev/null
/* UI/UX */
user_pref("extensions.pocket.enabled", false);
user_pref("mousewheel.default.delta_multiplier_y", 40);
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
/* Telemetry */
user_pref("devtools.onboarding.telemetry.logged" = false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry" = false);
user_pref("browser.newtabpage.activity-stream.telemetry" = false);
user_pref("browser.ping-centre.telemetry" = false);
user_pref("datareporting.healthreport.service.enabled" = false);
user_pref("datareporting.healthreport.uploadEnabled" = false);
user_pref("datareporting.policy.dataSubmissionEnabled" = false);
user_pref("datareporting.sessions.current.clean" = true);
user_pref("toolkit.telemetry.archive.enabled" = false);
user_pref("toolkit.telemetry.bhrPing.enabled" = false);
user_pref("toolkit.telemetry.enabled" = false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled" = false);
user_pref("toolkit.telemetry.hybridContent.enabled" = false);
user_pref("toolkit.telemetry.newProfilePing.enabled" = false);
user_pref("toolkit.telemetry.prompted", 2);
user_pref("toolkit.telemetry.rejected" = true);
user_pref("toolkit.telemetry.reportingpolicy.firstRun" = false);
user_pref("toolkit.telemetry.server" = <clear value>);
user_pref("toolkit.telemetry.shutdownPingSender.enabled" = false);
user_pref("toolkit.telemetry.unified" = false);
user_pref("toolkit.telemetry.unifiedIsOptIn" = false);
user_pref("toolkit.telemetry.updatePing.enabled" = false);
EOF
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://api.github.com/repos/mbnuqw/sidebery/releases|\
	grep browser_download_url|grep download|grep .xpi|head -n1|cut -d '"' -f4)"
mv sideberry.xpi /tmp/
firefox /tmp/sidebery.xpi&
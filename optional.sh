#!/bin/bash
set -e

rm -rf kubuntu-custom
git clone -q\
    https://github.com/rauldipeas/kubuntu-custom

# optional
bash -x kubuntu-custom/postinst/optional/anydesk.sh #extenal-apt
bash -x kubuntu-custom/postinst/optional/apprepo.sh #appimage
bash -x kubuntu-custom/postinst/optional/blender.sh #no-packaged
bash -x kubuntu-custom/postinst/optional/buildkite.sh #external-apt
bash -x kubuntu-custom/postinst/optional/discord.sh #external-package
bash -x kubuntu-custom/postinst/optional/firefox-vertical-tabs.sh
bash -x kubuntu-custom/postinst/optional/gemfury.sh #external-apt
bash -x kubuntu-custom/postinst/optional/gitqlient.sh #external-package
bash -x kubuntu-custom/postinst/optional/heroic.sh #external-package
bash -x kubuntu-custom/postinst/optional/lunacy.sh #external-package
bash -x kubuntu-custom/postinst/optional/retropie.sh #no-packaged
bash -x kubuntu-custom/postinst/optional/surge.sh #npm
bash -x kubuntu-custom/postinst/optional/telegram.sh #no-packaged
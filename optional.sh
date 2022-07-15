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
bash -x kubuntu-custom/postinst/optional/emoji.sh #stock-apt
bash -x kubuntu-custom/postinst/optional/firefox-vertical-tabs.sh #no-packaged
bash -x kubuntu-custom/postinst/optional/gemfury.sh #external-apt
bash -x kubuntu-custom/postinst/optional/gitqlient.sh #external-package
bash -x kubuntu-custom/postinst/optional/heroic.sh #external-package
bash -x kubuntu-custom/postinst/optional/internxt.sh #external-package
bash -x kubuntu-custom/postinst/testing/transfuse.sh #no-packaged #pip
bash -x kubuntu-custom/postinst/optional/lunacy.sh #external-package
bash -x kubuntu-custom/postinst/optional/morgen.sh #external-package
bash -x kubuntu-custom/postinst/optional/nvm.sh #no-packaged
bash -x kubuntu-custom/postinst/optional/retropie.sh #no-packaged
bash -x kubuntu-custom/postinst/optional/rmtrash.sh #external-package
bash -x kubuntu-custom/postinst/optional/surge.sh #npm
bash -x kubuntu-custom/postinst/optional/telegram.sh #no-packaged
bash -x kubuntu-custom/postinst/optional/tonelib.sh #external-package
bash -x kubuntu-custom/postinst/testing/transfuse.sh #no-package #binary
bash -x kubuntu-custom/postinst/optional/wrangler.sh #npm
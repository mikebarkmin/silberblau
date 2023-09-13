!include /usr/share/ublue-os/just/bling.just

# Assemble distrobox containers
assemble:
  echo 'Assembling and replacing distroboxes ...'
  distrobox assemble create --replace --file /etc/distrobox/distrobox.ini

# Install recommended GNOME extensions
gnome-extensions:
  pip install --upgrade gnome-extensions-cli
  gext install tailscale-status@maxgallup.github.com
  gext install nightthemeswitcher@romainvigier.fr
  gext install pano@elhan.io
  gext install weatheroclock@CleoMenezesJr.github.io

# Install JetBrains Toolbox | https://www.jetbrains.com/toolbox-app/
jetbrains-toolbox:
  #!/usr/bin/env bash
  pushd "$(mktemp -d)"
  echo "Get latest JetBrains Toolbox version"
  # Get the json with latest releases
  curl -sSfL -o releases.json "https://data.services.jetbrains.com/products/releases?code=TBA&latest=true&type=release"
  # Extract information
  BUILD_VERSION=$(jq -r '.TBA[0].build' ./releases.json)
  DOWNLOAD_LINK=$(jq -r '.TBA[0].downloads.linux.link' ./releases.json)
  CHECKSUM_LINK=$(jq -r '.TBA[0].downloads.linux.checksumLink' ./releases.json)
  echo "Installing JetBrains Toolbox ${BUILD_VERSION}"
  curl -sSfL -O "${DOWNLOAD_LINK}"
  curl -sSfL "${CHECKSUM_LINK}" | sha256sum -c
  tar zxf jetbrains-toolbox-"${BUILD_VERSION}".tar.gz
  echo "Launching JetBrains Toolbox"
  ./jetbrains-toolbox-"${BUILD_VERSION}"/jetbrains-toolbox

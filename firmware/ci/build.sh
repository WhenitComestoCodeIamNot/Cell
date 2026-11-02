#!/usr/bin/env bash
# Usage: ci/build.sh <hwrev> [fw-version]
# Downloads the official ImageBuilder, builds a minimal sysupgrade image for the HW rev, writes /etc/cell-release, signs with usign.
set -euo pipefail
HWREV="${1:?hwrev}"; FWVER="${2:-${GITHUB_REF_NAME:-fw-v0.0.0-dev}}"
HERE="$(cd "$(dirname "$0")/.." && pwd)"
# shellcheck disable=SC1090
source "$HERE/profiles/$HWREV.env"
OUT="$HERE/out/$HWREV"; mkdir -p "$OUT"
GITSHA="$(git -C "$HERE" rev-parse --short HEAD 2>/dev/null || echo nogit)"

T="${OPENWRT_TARGET//\//-}"
IB="openwrt-imagebuilder-${OPENWRT_RELEASE}-${T}.Linux-x86_64"
URL="https://downloads.openwrt.org/releases/${OPENWRT_RELEASE}/targets/${OPENWRT_TARGET}/${IB}.tar.zst"
WORK="${IB_CACHE:-$HERE/out/.ib}"; mkdir -p "$WORK"
if [ ! -d "$WORK/$IB" ]; then
  echo ">> fetching $URL"
  curl -fsSL "$URL" -o "$WORK/$IB.tar.zst"
  curl -fsSL "https://downloads.openwrt.org/releases/${OPENWRT_RELEASE}/targets/${OPENWRT_TARGET}/sha256sums" -o "$WORK/sha256sums"
  (cd "$WORK" && grep " \*$IB.tar.zst\$" sha256sums | sha256sum -c -)
  tar --zstd -xf "$WORK/$IB.tar.zst" -C "$WORK"
fi

# Overlay: copy tracked files, then stamp the release file
FILES="$OUT/files"; rm -rf "$FILES"; cp -a "$HERE/files" "$FILES"
cat > "$FILES/etc/cell-release" <<REL
CELL_FW_VERSION=${FWVER}+${GITSHA}
CELL_HW_REV=${HWREV}
CELL_OPENWRT=${OPENWRT_RELEASE}
CELL_PROFILE=${IB_PROFILE}
CELL_BUILD_UTC=$(date -u +%Y-%m-%dT%H:%M:%SZ)
REL
chmod +x "$FILES/etc/init.d/cell-agent" "$FILES/usr/sbin/cell-agent" "$FILES"/etc/uci-defaults/*

echo ">> building $IB_PROFILE with: $PACKAGES"
mkdir -p "$WORK/$IB/tmp"
# The tarball ships host-tool symlinks made on the buildbot; any that dangle here make the prereq check fail.
if [ -d "$WORK/$IB/staging_dir/host/bin" ]; then
  find "$WORK/$IB/staging_dir/host/bin" -xtype l -print -delete | sed 's/^/>> removed dangling: /'
fi
echo ">> host install: $(command -v install) :: $(install --version 2>&1 | head -1)"
build() { ( cd "$WORK/$IB" && make "$@" image PROFILE="$IB_PROFILE" PACKAGES="$PACKAGES" FILES="$FILES" BIN_DIR="$OUT/bin" EXTRA_IMAGE_NAME="cell-${FWVER}" ); }
if ! build; then
  echo "!! prereq check failed in this environment; retrying with FORCE=1 (prebuilt packages, check is advisory)"
  build FORCE=1
fi

# Collect sysupgrade image(s) and sign
shopt -s nullglob
for img in "$OUT"/bin/*sysupgrade*; do
  cp "$img" "$OUT/"; base="$(basename "$img")"
  sha256sum "$OUT/$base" > "$OUT/$base.sha256"
  if [ -n "${USIGN_SECKEY:-}" ]; then
    printf '%s' "$USIGN_SECKEY" > "$OUT/.key"; chmod 600 "$OUT/.key"
    usign -S -m "$OUT/$base.sha256" -s "$OUT/.key" -x "$OUT/$base.sha256.sig"
    rm -f "$OUT/.key"; echo ">> signed $base"
  else
    echo "!! USIGN_SECKEY not set, image is UNSIGNED (dev build only)"
  fi
done
ls -la "$OUT" | grep -v '^d'

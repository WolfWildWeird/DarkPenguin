#!/usr/bin/env bash
set -e
( grep -q "Chromium OS" /proc/version ) || {
	echo "Not in Chromium OS Virtual Machine"
	exit 1
}
[ "$USER" == "root" ] && { echo "Don't use sudo to run this script"; exit 2;}


THEME=CrosAdapta
THEME_DARK=true



THEME_PATH=""

if [ -e "/usr/share/themes/${THEME}/" ]; then
	THEME_PATH="/usr/share/themes/${THEME}"
elif [ -e "${HOME}/.themes/${THEME}/" ]; then
	THEME_PATH="${HOME}/.themes/${THEME}"
elif [ -e "${HOME}/.local/share/themes/${THEME}/" ]; then
	THEME_PATH="${HOME}/.local/share/themes/${THEME}"
else
	echo "Theme ${THEME} not found" && exit 1
fi


export GTK_THEME="${THEME}${THEME_DARK:+:dark}"
export GTK2_RC_FILES=${THEME_PATH}/gtk-2.0/gtkrc
export QT_STYLE_OVERRIDE="${THEME_DARK:+gtk-dark}"

PATH_ENVCONF="${HOME}/.config/environment.d/gtk.conf"
cat <<-EOF_GTK > $PATH_ENVCONF
	GTK_THEME=${GTK_THEME}
	GTK2_RC_FILES=${GTK2_RC_FILES}
	QT_STYLE_OVERRIDE=${QT_STYLE_OVERRIDE}
EOF_GTK


PATH_CONFIG_GTK_3_22="${HOME}/.config/gtk-3.22/settings.ini"
mkdir -p ${PATH_CONFIG_GTK_3_22%/*}
cat <<-EOF_GTK > $PATH_CONFIG_GTK_3_22
	[Settings]
	gtk-theme-name = ${THEME}
	gtk-application-prefer-dark-theme = ${THEME_DARK:-false}
EOF_GTK

PATH_CONFIG_GTK_3_0="${HOME}/.config/gtk-3.0/settings.ini"
mkdir -p ${PATH_CONFIG_GTK_3_0%/*}
cat <<-EOF_GTK > $PATH_CONFIG_GTK_3_0
	[Settings]
	gtk-theme-name = ${THEME}
	gtk-application-prefer-dark-theme = ${THEME_DARK:-false}
EOF_GTK

[ -e /usr/bin/gsettings ] && {
	gsettings reset org.gnome.desktop.interface color-scheme
	[ "${THEME_DARK}" == "true" ] && gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
}
echo "Installation of \"${THEME}${THEME_DARK:+:dark}\" completed"
echo "You need to restart your Virtual Machine Penguin"

exit 0

#!/bin/bash
# Script restore (install ulang) Wayland di Kali Linux XFCE
# Tested on Kali 2024/2025

echo "[*] Update repositori..."
sudo apt update

echo "[*] Install paket Wayland utama..."
sudo apt install -y wayland libwayland-dev xwayland weston

echo "[*] Memastikan ada session Wayland..."
if [ ! -d /usr/share/wayland-sessions ]; then
    sudo mkdir -p /usr/share/wayland-sessions
    echo "[+] Folder /usr/share/wayland-sessions dibuat."
fi

echo "[*] Jika pakai GDM3, aktifkan Wayland..."
if [ -f /etc/gdm3/custom.conf ]; then
    sudo sed -i 's/^WaylandEnable=false/#WaylandEnable=false/' /etc/gdm3/custom.conf
    echo "[+] Wayland diaktifkan di GDM3 (default)."
fi

echo ""
echo "[+] Wayland berhasil direstore."
echo "[i] Reboot dengan: sudo reboot"
echo "[i] Setelah login, pilih sesi Wayland di login manager,"
echo "    lalu cek dengan: echo \$XDG_SESSION_TYPE"
echo "    Hasil harus 'wayland'."

#!/bin/bash

# --- 1. INSTALACIÓN DE BASE Y GUI ---
echo "Instalando paquetes de repositorios oficiales..."
sudo pacman -S --needed - <pkglist.txt

# --- 2. INSTALACIÓN DE YAY (AUR) ---
if ! command -v yay &>/dev/null; then
  echo "Instalando yay..."
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay && makepkg -si --noconfirm
  cd -
fi

echo "Instalando paquetes de AUR..."
yay -S --needed - <aur_pkglist.txt

# --- 3. PERSONALIDAD (DOTFILES) ---
echo "Configurando Neovim (LazyVim)..."
rm -rf ~/.config/nvim
git clone -b nvim-lazy https://github.com/MasterHacker667/Arch-PC-nvidia.git ~/.config/nvim

echo "Configurando Kitty..."
mkdir -p ~/.config/kitty
# Extraemos el config de la rama específica
git archive --remote=https://github.com/MasterHacker667/Arch-PC-nvidia.git terminal-kitty config/kitty/kitty.conf | tar -xO >~/.config/kitty/kitty.conf

echo "Configurando Shell (Bashrc)..."
curl -s https://raw.githubusercontent.com/MasterHacker667/Arch-PC-nvidia/shell-decor/bashrc -o ~/.bashrc

# --- 4. SISTEMA Y SERVICIOS ---
echo "Habilitando servicios..."
# Esto lee tu archivo y hace 'systemctl enable' a cada uno
while read -r service; do
  # Limpiamos espacios y saltos de línea
  s=$(echo "$service" | xargs)
  [ -n "$s" ] && sudo systemctl enable "$s"
done <enabled_services.txt

echo "¡Reconstrucción completa, MasterHacker!"

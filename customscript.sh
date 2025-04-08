#!/bin/bash
set -e

# Instalar dependencias
sudo apt update
sudo apt install -y zsh git curl wget

# Instalar Oh My Zsh (sin cambiar de shell automáticamente)
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalar plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions $ZSH_CUSTOM/plugins/zsh-completions

# Configurar plugins en .zshrc
sed -i '/^plugins=/c\plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)' ~/.zshrc
echo 'autoload -U compinit && compinit' >> ~/.zshrc
echo 'export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"' >> ~/.zshrc

# Instalar tema Powerlevel10k
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
fi

# Configurar tema en .zshrc
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Configurar historial
echo -e "\n# Configuración del historial" >> ~/.zshrc
cat <<EOL >> ~/.zshrc
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
EOL

# Instalar fuentes MesloLGS NF
FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

wget -P "$FONT_DIR" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget -P "$FONT_DIR" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget -P "$FONT_DIR" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget -P "$FONT_DIR" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

fc-cache -fv

# Cambiar shell por defecto a zsh
sudo chsh -s "$(which zsh)" "$USER"

# Mensaje final
echo -e "\n\e[1;32mInstalación completada!\e[0m"
echo "1. Cierra todas las terminales y abre una nueva"
echo "2. La primera vez se iniciará la configuración de Powerlevel10k"
echo "3. Para VS Code:"
echo "   - Ve a Configuración > Features > Terminal"
echo "   - Establece 'MesloLGS NF' como fuente del terminal"

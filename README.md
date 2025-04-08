# customterminal
# Instalar zsh
sudo apt update && sudo apt install zsh

# Instalar oh my zsh
sudo apt install git curl -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Instalar plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

# onfigurar plugins
abrir el archivo ~/.zshrc , en el apartado plugins añadir:
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions)
autoload -U compinit && compinit
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# Instalar el theme Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Habilitar historioal zsh-autosuggestions
abrir el archivo ~/.zshrc , añadimos:
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Añadir las fuentes (en vscode cambiar la font MesloLGS NF )
    MesloLGS NF Regular.ttf
    MesloLGS NF Bold.ttf
    MesloLGS NF Italic.ttf
    MesloLGS NF Bold Italic.ttf

# Poner el theme powerlevel10k
editar el archivo ~/.zshrc , cambiar el apartado ZSH_THEME para que quede asi:
ZSH_THEME="powerlevel10k/powerlevel10k"

# Añadir para que muestre el usuario a la izquierda
Editar ~/.p10k.zsh, aqui buscamos context en typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  ...
  context  # user@hostname
  ...
)
y lo comentamos, para añadirlo en POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
)

ademas comentamos la linea:
typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=

# Poner zsh como terminal predeterminada
chsh -s $(which zsh)

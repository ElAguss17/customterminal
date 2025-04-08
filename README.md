# Custom Terminal Setup with Zsh + Powerlevel10k

Guía para configurar una terminal personalizada con:
- 🐚 Zsh como shell principal
- 🎨 Oh My Zsh como framework de gestión
- ✨ Tema Powerlevel10k
- 🔌 Plugins útiles (autocompletado, sugerencias y syntax highlighting)

## 🛠 Requisitos
- Sistema basado en Debian/Ubuntu
- Privilegios de sudo
- Conexión a internet

## 📥 Instalación

### 1. Instalar Zsh
```bash
sudo apt update && sudo apt install zsh
```

### 2. Instalar Oh My Zsh
```bash
sudo apt install git curl -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 3. Instalar Plugins
```bash
# Autosugerencias
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Resaltado de sintaxis
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Autocompletado mejorado
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions
```

### 4. Configurar Plugins
Editar `~/.zshrc` y agregar:
```zsh
plugins=(
  git 
  zsh-autosuggestions 
  zsh-syntax-highlighting 
  zsh-completions
)

autoload -U compinit && compinit
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
```

### 5. Instalar Powerlevel10k
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc
```

### 6. Configurar Historial
Editar `~/.zshrc` y agregar:
```zsh
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
```

### 7. Fuentes MesloLGS NF (Requeridas)
```bash
# Descargar fuentes
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# Instalar manualmente las fuentes y configurar tu terminal para usarlas
```

### 8. Configurar Tema Powerlevel10k
Editar `~/.zshrc` y establecer:
```zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
```

### 9. Mover usuario/host a la izquierda
Editar `~/.p10k.zsh` y realizar estos cambios:
```diff
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
+  context  # user@hostname
  # ... otros elementos
)

typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
-  context  # user@hostname
  # ... otros elementos
)

# Comentar esta línea:
-# typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=
```

### 10. Establecer Zsh como predeterminado
```bash
sudo chsh -s $(which zsh) $USER
```

## 🚀 Post-Instalación
1. Cierra todas las terminales
2. Abre una nueva terminal
3. Sigue el asistente interactivo de Powerlevel10k
4. Configura tu terminal para usar la fuente `MesloLGS NF`

> **Nota:** Para VS Code ve a:  
> `File > Preferences > Settings > Terminal > Font Family`  
> y escribe: `MesloLGS NF`

## 🌟 Recomendación
Si quieres un script de instalación automática, revisa [este enlace](https://github.com/tu-usuario/customterminal/blob/main/install_zsh_p10k.sh).

#
# ~/.bashrc
#

# If not running interactively, don't do anything
# Si no es una sesión interactiva, no hacer nada
[[ $- != *i* ]] && return

# --- Colores para Comandos ---
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'
# 'cd' y 'exit' no soportan --color, así que los dejamos normales
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'

# --- Lógica de Errores (Calaveras) ---
# Esta función revisa si el último comando falló
# --- Lógica de Errores Minimalista ---
prompt_status() {
    local exit_code=$?
    local RED='\e[1;31m'
    local RESET='\e[0m'

    if [ $exit_code -ne 0 ]; then
        # Solo imprimimos si hay error: Salto de línea + Calaveras
        echo -e "\n${RED}💀 💀 ERROR ($exit_code) 💀 💀${RESET}\n "
    fi
    # Si el código es 0, no hace nada (silencio total)
}

# --- Prompt Personalizado (PS1) ---
# Eliminamos el \n que estaba antes de \u para que no deje espacios vacíos en éxito
export PS1="\$(prompt_status)\[\e[38;5;199m\]\u\[\e[0m\]@\[\e[38;5;45m\]\h \[\e[38;5;93m\][\w]\[\e[0m\]\n\[\e[38;5;201m\]⚡ \[\e[0m\]"
# --- Colores para Programación (Java, Node, Rust, etc.) ---
# Usamos GRC (Generic Colouriser) si está instalado para que todo brille
if [ -f /etc/profile.d/grc.sh ]; then
    source /etc/profile.d/grc.sh
fi

# --- Banner de Bienvenida ---
fastfetch
figlet "Welcome" | lolcat
figlet "MasterHacker" | lolcat

# Colores para comandos básicos
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'

# Para que las páginas del manual (man) tengan colores (muy útil)
export MANPAGER="sh -c 'sed -u \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -l man' "
# Nota: Requiere instalar 'bat' (sudo pacman -S bat), que es un 'cat' con esteroides.


#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# --- Banner de Bienvenida Personalizado ---
fastfetch
figlet "Welcome" | lolcat
figlet "MasterHacker" | lolcat

#
# ~/.bash_profile
#

# Enviromental variables
export PATH="$PATH:$HOME/.local/bin:$HOME/Scripts"
export EDITOR="/bin/nvim"
export VISUAL="/bin/nvim"
export TERMINAL="konsole"
export BROWSER="firefox"
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export NODE_PATH="/usr/local/bin"

# Make discrete graphics the default OpenGL renderer
#export __NV_PRIME_RENDER_OFFLOAD=1
#export __VK_LAYER_NV_optimus=NVIDIA_only
#export __GLX_VENDOR_LIBRARY_NAME=nvidia

# Call .bashrc on login shell
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start Xorg if not started already
if [ "$(tty)" = "/dev/tty1" ]; then
	pgrep -x Xorg || exec startx
fi


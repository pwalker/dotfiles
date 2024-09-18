#!/bin/sh

# Function to handle errors
handle_error() {
  echo "Error occurred during: $1"
  exit 1
}

# Zoxide
# https://github.com/ajeetdsouza/zoxide
echo "Installing zoxide..."
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh || handle_error "zoxide installation"

# Starship
# https://starship.rs/
echo "Installing starship..."
curl -sS https://starship.rs/install.sh | sh || handle_error "starship installation"

# Atuin
# https://github.com/ellie/atuin
echo "Installing atuin..."
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh || handle_error "atuin installation"

# fnm
# https://github.com/Schniz/fnm
echo "Installing fnm..."
curl -fsSL https://fnm.vercel.app/install | bash || handle_error "fnm installation"

# direnv
# https://direnv.net/
echo "Installing direnv..."
curl -sfL https://direnv.net/install.sh | bash || handle_error "direnv installation"

# fzf
# https://github.com/junegunn/fzf
echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo "All tools installed successfully."

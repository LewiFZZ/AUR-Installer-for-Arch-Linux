#!/bin/bash
# Made by Levi Josué Candeias de Figueiredo

# Fuction to display the banner from: Cristophe Avonture (cavo789)
function __main() {

    clear

    cat <<\EOF

              _    _ _____    _____           _        _ _
         /\  | |  | |  __ \  |_   _|         | |      | | |
        /  \ | |  | | |__) |   | |  _ __  ___| |_ __ _| | | ___ _ __
       / /\ \| |  | |  _  /    | | | '_ \/ __| __/ _` | | |/ _ \ '__|
      / ____ \ |__| | | \ \   _| |_| | | \__ \ || (_| | | |  __/ |
     /_/    \_\____/|_|  \_\ |_____|_| |_|___/\__\__,_|_|_|\___|_|

EOF
    printf "%s\n\n" "Made by LewiFZZ"

    return 0
}

# Call the __main function to display the banner
__main

echo "Welcome to the AUR package installer!"
echo "This script will build the package from the AUR and install it on your system."

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Please install Git and rerun the script."
    exit 1
fi

# Check if base-devel is installed
if ! pacman -Qi base-devel &> /dev/null; then
    echo "base-devel is not installed. Installing it now..."
    sudo pacman -S --needed base-devel
    if [ $? -ne 0 ]; then
        echo "Failed to install base-devel. Please install it manually and rerun the script."
        exit 1
    fi
fi

# Prompt for the AUR package link
read -rp "Please paste the AUR package Git clone link here: " package_link

# Extract package name from the URL
package_name=$(basename "${package_link%.git}")

# Confirm the package name with the user
echo "Detected package name: '$package_name'"

read -rp "Is this correct? (y/N): " confirmation
if [[ "${confirmation,,}" != "y" ]]; then
    read -rp "Please enter the correct package name: " package_name
fi

# Check if the directory already exists
if [ -d "$package_name" ]; then
    echo "The package directory '$package_name' already exists. Please remove it and try again."
    exit 1
fi

# Clone the package repository
if ! git clone "$package_link"; then
    echo "Failed to clone the package repository. Please check the link and try again."
    exit 1
fi

# Navigate to the package directory
if ! cd "$package_name"; then
    echo "Failed to enter the package directory. Please check the package name and try again."
    exit 1
fi

# Build and install the package
if ! makepkg -si; then
    echo "Failed to build and install the package. Please check the output for errors."
    exit 1
fi

# Offer to clean up the cloned repository
read -rp "Package '$package_name' has been successfully installed. Do you want to delete the cloned repository? (y/N): " cleanup
if [[ "${cleanup,,}" == "y" ]]; then
    cd ..
    rm -rf "$package_name"
    echo "Cleaned up the cloned repository."
fi

echo "Installation process completed."

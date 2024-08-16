# AUR-Installer-for-Arch-Linux
This is just a simple bash script to help lazy people (like myself) install AUR packages directly from the AUR without using an helper (like yay) for a better stability when downloading packages.

# AUR Package Installer for Arch Linux

This script automates the process of installing AUR (Arch User Repository) packages on Arch Linux. It handles the installation of necessary dependencies, cloning of the AUR package repository, and building and installing the package on your system.

## Features

- **Automated Dependency Check**: Ensures that essential tools like Git and `base-devel` are installed on your system before proceeding with the AUR package installation.
- **User-Friendly Prompts**: Guides you through the process with clear prompts and confirmations, reducing the risk of errors.
- **Automated Cleanup**: Optionally removes the cloned repository after the package is installed, keeping your system clean.

## Prerequisites

- **Arch Linux** or an Arch-based distribution.
- **Git**: The script checks if Git is installed on your system.
- **base-devel**: The script checks and installs this group of packages if they are not already installed. `base-devel` is required for building AUR packages.

## Quick Start Guide

### How to Use This Script

1. **Download the Script**:
    - Clone the repository or download the script directly from GitHub.

    ```sh
    git clone <repository_link>
    cd <repository_directory>
    ```

2. **Make the Script Executable**:
    - Ensure the script has executable permissions.

    ```sh
    chmod +x aur_installer.sh
    ```

3. **Run the Script**:
    - Simply run the script and follow the on-screen instructions.

    ```sh
    ./aur_installer.sh
    ```

4. **Provide the AUR Package Link**:
    - When prompted, paste the Git clone link of the AUR package you want to install. For example:

    ```sh
    https://aur.archlinux.org/package-name.git
    ```

5. **Confirm the Package Name**:
    - The script will auto-detect the package name from the URL. Confirm if it is correct or manually enter the correct package name.

6. **Let the Script Handle the Rest**:
    - The script will take care of cloning the repository, building the package, and installing it on your system. After installation, you can choose whether to delete the cloned repository to keep your system clean.

### Things to Avoid

- **Incorrect URLs**: Make sure you provide the correct Git clone link from the AUR. An incorrect link will cause the script to fail at the cloning step.
  
- **Directory Conflicts**: Ensure the directory for the package does not already exist. If it does, the script will stop to prevent overwriting. You’ll need to remove the existing directory manually before running the script again.

- **Interrupting the Process**: Avoid interrupting the script (e.g., closing the terminal) during the cloning, building, or installation steps, as this might leave your system in an inconsistent state.

### Modify and Improve

This script is open-source, and you are free to download, modify, and distribute it as you wish. Feel free to customize it to better suit your needs or improve its functionality. Contributions are welcome!

To make changes:

1. **Fork the Repository**:
    - Create your own copy of the repository on GitHub.

2. **Make Your Changes**:
    - Edit the script or add new features as you see fit.

3. **Submit a Pull Request**:
    - If you think your improvements could benefit others, consider submitting a pull request to the original repository.

---

**Made by LewiFZZ**

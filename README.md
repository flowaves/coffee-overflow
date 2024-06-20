# Coffee Overflow
Inspired by the hangman game, except that the hangman is replaced by an overflowing coffee, a reference to **[Le café des devs](https://discord.gg/cafedesdevs) server ;)**

![image](https://github.com/parencil/coffee-overflow/assets/106678916/118fcce8-3ad4-408a-8781-4d3833084015)

## Installation

### Clone
###### *Clone the repository*
```bash
git clone https://github.com/parencil/coffee-overflow.git
```

### Install Nim
Install Nim if not already done:

#### Linux

###### *Debian*
```bash
sudo apt install nim
```
###### *Fedora*
```bash
sudo dnf install nim
```
###### *Arch*
```bash
sudo pacman -S nim
```

#### Windows

###### *Download*
Go to [the official Nim download page](https://nim-lang.org/install_windows.html).  
Download the installer for Windows adapted to your system.

###### *Install*
Run the downloaded installer.  
Follow the installation instructions.  
Make sure the option to add Nim to your PATH is checked.

#### macOS

###### *Using the Official Installer*
Go to the [official Nim download page](https://nim-lang.org/install.html).  
Download the package for macOS (`nim-<version>-macosx.tar.xz`).  
Extract the downloaded package.  
Follow the instructions in the `README.md` file included in the archive.

###### *Using Homebrew*
```bash
brew install nim
```

### Compile
```bash
nim compile coffee_overflow.nim
```

### Run
**Linux/MacOS**
```bash
./coffee_overflow
```

**Windows**
```bash
coffee_overflow.exe
```

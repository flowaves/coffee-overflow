# Coffee Overflow
Inspired by the hangman game, except that the hangman is replaced by an overflowing coffee, a reference to **[Le café des devs](https://discord.gg/cafedesdevs) server ;)**


The goal of the game is to guess the word by proposing letters **before the coffee overflows !**


The words are related to **the world of programming**.


Let's find out if you're a true dev or not ;)


**Good luck !**

### There are three difficulty modes
1. **Expresso** (hard) 

    ![image](https://github.com/parencil/coffee-overflow/assets/106678916/8b67ee6f-df9e-48d3-a7fd-f0487f21bdad)


2. **Standard** (balanced)

    ![image](https://github.com/parencil/coffee-overflow/assets/106678916/118fcce8-3ad4-408a-8781-4d3833084015)

3. **Large** (easy)

    ![image](https://github.com/parencil/coffee-overflow/assets/106678916/293a6605-341d-4934-a2d1-32bfa1c3f28e)

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

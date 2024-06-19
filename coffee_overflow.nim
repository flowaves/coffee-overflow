import os, strutils, random

let debug = false

proc loadWords(): seq[string] =
  var words: seq[string] = @[]
  if not fileExists("words.txt"):
    quit("The file 'words.txt' does not exist.")
  for line in lines("words.txt"):
    words.add(line.strip)
  return words

let words = loadWords()

randomize()
let secretWord = words[rand(words.len)]
var guessedWord = repeat('-', secretWord.len)
var attempts = 0

let coffeeStages = [
"""
|         |_
|         | |
|         | |
|         |-
|_________|
""",
"""
|         |_
|         | |
|     )   | |
|    (    |-
|█████████|
""",
"""
|         |_
|    (    | |
|     )   | |
|█████████|-
|█████████|
""",
"""
|     )   |_
|    (    | |
|█████████| |
|█████████|-
|█████████|
""",
"""
    ( 
|    )    |_
|█████████| |
|█████████| |
|█████████|-
|█████████|
""",
"""
      )
     (
|█████████|_
|█████████| |
|█████████| |
|█████████|-
|█████████|
""",
"""
    (
     )
███████████
█|█████████|_
█|█████████| |
█|█████████| |
█|█████████|-
█|█████████|
"""
]

proc displayGame() =
  echo coffeeStages[attempts]
  echo "Word: ", guessedWord
  echo "Attempts left: ", 6 - attempts

proc updateGuessedWord(letter: char) =
  var found = false
  for i in 0..<secretWord.len:
    if secretWord[i] == letter:
      guessedWord[i] = letter
      found = true
  if not found:
    attempts += 1

proc delayPrint(message: string) =
    for c in message:
        stdout.write(c)
        stdout.flushFile()
        sleep(70) 

proc clearConsole() =
  echo "\x1b[2J\x1b[H"

if debug == false:
  clearConsole()

  delayPrint("Welcome to Coffee Overflow !")
  sleep(1500)
  echo ""

  delayPrint("The goal of the game is to guess the word by proposing letters before the coffee overflows !")
  sleep(2000)
  echo ""

  delayPrint("The words are related to the world of programming")
  sleep(1000)
  echo ""

  delayPrint("Let's find out if you're a true dev or not ;)")
  sleep(800)
  echo ""

  delayPrint("Good luck!")
  sleep(300)
  echo ""

  clearConsole()



while attempts < 6 and guessedWord != secretWord:
  clearConsole()
  displayGame()
  echo "Guess a letter: "
  let input = stdin.readLine()
  if input.len == 1:
    let guess = input[0]
    updateGuessedWord(guess)
  else:
    echo "Please enter only one letter."

if guessedWord == secretWord:
  echo "Congratulations! You guessed the word: ", secretWord
else:
  clearConsole()
  echo coffeeStages[6]
  echo "Sorry, you lost. You must be a false developer !"
  echo "The word was: ", secretWord

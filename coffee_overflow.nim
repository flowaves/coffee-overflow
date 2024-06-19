import os, strutils, random

let debug = false
var firstGame = true

proc loadWords(): seq[string] =
  var words: seq[string] = @[]
  if not fileExists("words.txt"):
    quit("The file 'words.txt' does not exist.")
  for line in lines("words.txt"):
    words.add(line.strip)
  return words

let words = loadWords()

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
      █████████████
      █|█████████|█_
      █|█████████|█ |
      █|█████████|█ |
      █|█████████|-
███████|█████████|█████████████
  """
]

proc displayGame(guessedWord: string, attempts: int) =
  echo coffeeStages[attempts]
  echo "Word: ", guessedWord
  echo "Attempts left: ", 6 - attempts

proc updateGuessedWord(secretWord: string, guessedWord: var string, attempts: var int, letter: char) =
  var found = false
  for i, c in secretWord:
    if c == letter:
      guessedWord[i] = letter
      found = true
  if not found:
    inc attempts

proc delayPrint(message: string) =
  for c in message:
    stdout.write(c)
    stdout.flushFile()
    sleep(70) 

proc clearConsole() =
  echo "\x1b[2J\x1b[H"

proc setup() =
  if not debug and firstGame:
      clearConsole()

      delayPrint("Welcome to Coffee Overflow !")
      sleep(1300)
      echo ""

      delayPrint("The goal of the game is to guess the word by proposing letters before the coffee overflows !")
      sleep(1500)
      echo ""

      delayPrint("The words are related to the world of programming.")
      sleep(1900)
      echo ""

      delayPrint("Let's find out if you're a true dev or not ;)")
      sleep(700)
      echo ""

      delayPrint("Good luck !")
      sleep(300)
      echo ""

      clearConsole()
  if not firstGame:
    clearConsole()
    delayPrint("New game !")
    sleep(1500)

proc play() =
  clearConsole()
  randomize()
  let secretWord = words[rand(words.len)]
  var guessedWord = repeat('-', secretWord.len)
  var attempts = 0

  while attempts < 6 and guessedWord != secretWord:
    clearConsole()
    displayGame(guessedWord, attempts)
    echo "Guess a letter: "
    let input = stdin.readLine()
    if input.len == 1:
      updateGuessedWord(secretWord, guessedWord, attempts, input[0])
    else:
      delayPrint("Please enter only one letter")
      sleep(500)


  if guessedWord == secretWord:
    echo "Congratulations ! You guessed the word: ", secretWord
    sleep(1500)
  else:
    clearConsole()
    echo coffeeStages[6]
    echo "Sorry, you lost. You must be a false developer !"
    echo "The word was: ", secretWord
    sleep(1500)

while true:
  setup()
  play()
  firstGame = false

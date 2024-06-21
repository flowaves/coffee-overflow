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

let ExpressoStages = [
  """
    |      |-
    |      | |
    |______|-
  """,
  """
    |    ) |-
    |   (  | |
    |██████|-
  """,
  """
      (
    |  )   |-
    |██████| |
    |██████|-
  """,
  """
         )
        (
    |██████|-
    |██████| |
    |██████|-
  """,
  """
        (
         )
    █████████
   █|██████|█-  (
   █|██████|█ |  )
████|██████|-██████████
  """
]

let StandardStages = [
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
      ████████████
      █|█████████|█_
      █|█████████|█ |
      █|█████████|█ |     (
      █|█████████|-        )
███████|█████████|█████████████
  """
]

let LargeStages = [
  """
    |             |
    |             |__
    |             |  \
    |             |   \
    |             |   /
    |             |__/
    |             |
    |_____________|
  """,
  """
    |             |
    |             |__
    |             |  \
    |             |   \
    |             |   /
    |      )      |__/
    |     (       |
    |█████████████|
  """,
  """
    |             |
    |             |__
    |             |  \
    |             |   \
    |      (      |   /
    |       )     |__/
    |█████████████|
    |█████████████|
  """,
  """
    |             |
    |             |__
    |             |  \
    |      )      |   \
    |     (       |   /
    |█████████████|__/
    |█████████████|
    |█████████████|
  """,
  """
    |             |
    |             |__
    |       (     |  \
    |        )    |   \
    |█████████████|   /
    |█████████████|__/
    |█████████████|
    |█████████████|
  """,
  """
    |             |
    |      )      |__
    |     (       |  \
    |█████████████|   \
    |█████████████|   /
    |█████████████|__/
    |█████████████|
    |█████████████|
  """,
  """
    |      (     |
    |       )     |__
    |█████████████|  \
    |█████████████|   \
    |█████████████|   /
    |█████████████|__/
    |█████████████|
    |█████████████|
  """,
  """
           )
    |     (        |
    |█████████████|__
    |█████████████|  \
    |█████████████|   \
    |█████████████|   /
    |█████████████|__/
    |█████████████|
    |█████████████|
  """,
  """
           (
            )
    |█████████████|
    |█████████████|__
    |█████████████|  \
    |█████████████|   \
    |█████████████|   /
    |█████████████|__/
    |█████████████|
    |█████████████|
  """,
  """          
                 )
                (
       ███████████████
      █|█████████████|█
      █|█████████████|█_
      █|█████████████|█ \
      █|█████████████|█  \
      █|█████████████|█  /
      █|█████████████|█_/    (
      █|█████████████|█       )
███████|█████████████|███████████████
  """
  ]

proc displayGame(guessedWord: string, attempts: int, maxAttempts: int) =
  case maxAttempts
  of 3:
    echo ExpressoStages[attempts]
  of 5:
    echo StandardStages[attempts]
  of 8:
    echo LargeStages[attempts]
  else:
    echo "Error : maxAttempts is not valid"
  
  echo "Word: ", guessedWord
  echo "Attempts left: ", maxAttempts - attempts

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
      sleep(400)
      echo ""

      delayPrint("The goal of the game is to guess the word by proposing letters before the coffee overflows !")
      sleep(800)
      echo ""

      delayPrint("The words are related to the world of programming.")
      sleep(1000)
      echo ""

      delayPrint("Let's find out if you're a true dev or not ;)")
      sleep(600)
      echo ""

      delayPrint("Good luck !")
      sleep(400)
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
  var maxAttempts = 0

  delayPrint("1 - Expresso (hard)")
  echo ""
  delayPrint("2 - Standard (balanced)")
  echo ""
  delayPrint("3 - Large (easy)")
  echo ""
  echo ""
  sleep(400)
  echo "Select game difficulty : "

  while maxAttempts notin {3, 5, 8}:
    case readLine(stdin)
    of "1":
      maxAttempts = 3
    of "2":
      maxAttempts = 5
    of "3":
      maxAttempts = 8
    else: 
      delayPrint("Please enter a number between 1 and 3")
      echo ""
      echo "Select game difficulty : "

  while attempts < maxAttempts and guessedWord != secretWord:
    clearConsole()
    displayGame(guessedWord, attempts, maxAttempts)
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
    case maxAttempts
    of 3:
      echo ExpressoStages[4]
    of 5:
      echo StandardStages[6]
    of 8:
      echo LargeStages[9]
    else:
      echo "Error : maxAttempts is not valid"

    echo "Sorry, you lost. You must be a false developer !"
    echo "The word was: ", secretWord
    sleep(3000)

while true:
  setup()
  play()
  firstGame = false

import os, strutils, random

let words = [
  "bug", "commit", "merge", "push", "pull", "fork", "clone", "issue", "branch", 
  "deploy", "compile", "debug", "syntax", "runtime", "variable", "function", 
  "loop", "array", "object", "class", "module", "script", "server", "client", 
  "api", "token", "cookie", "session", "error", "refactor"
]

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
|#########|
""",
"""
|         |_
|    (    | |
|     )   | |
|#########|-
|#########|
""",
"""
|     )   |_
|    (    | |
|#########| |
|#########|-
|#########|
""",
"""
    ( 
|    )    |_
|#########| |
|#########| |
|#########|-
|#########|
""",
"""
      )
     (
|#########|_
|#########| |
|#########| |
|#########|-
|#########|
""",
"""
    (
     )
###########
#|#########|_
#|#########| |
#|#########| |
#|#########|-
#|#########|
"""
]

proc displayGame() =
  echo coffeeStages[attempts]
  echo "Mot: ", guessedWord
  echo "Essais restants: ", 6 - attempts

proc updateGuessedWord(letter: char) =
  var found = false
  for i in 0..<secretWord.len:
    if secretWord[i] == letter:
      guessedWord[i] = letter
      found = true
  if not found:
    attempts += 1

echo "Bienvenue dans Coffee Overflow !"

while attempts < 6 and guessedWord != secretWord:
  displayGame()
  echo "Devine une lettre: "
  let input = stdin.readLine()
  if input.len == 1:
    let guess = input[0]
    updateGuessedWord(guess)
  else:
    echo "Veuillez entrer une seule lettre."

if guessedWord == secretWord:
  echo "Félicitations ! Tu as trouvé le mot : ", secretWord
else:
  echo "Désolé, tu as perdu. Le mot était : ", secretWord

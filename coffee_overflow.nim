import os, strutils, random

let words = [
  "bug", "commit", "merge", "push", "pull", "fork", "clone", "issue", "branch",
  "deploy", "compile", "debug", "syntax", "runtime", "variable", "function", 
  "loop", "array", "object", "class", "module", "script", "server", "client", 
  "api", "token", "cookie", "session", "error", "refactor"
]

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

proc delayPrint(message: string) =
    for c in message:
        stdout.write(c)
        stdout.flushFile()
        sleep(70)  # Délai en millisecondes (ajuste selon ton besoin)

delayPrint("Bienvenue dans Coffee Overflow !")
sleep(1500)
echo ""
delayPrint("Le but du jeu est de deviner le mot en proposant des lettres avant que le café ne déborde")
sleep(2000)
echo ""
delayPrint("Les mots sont en rapport avec le monde de la programmtion")
sleep(1000)
echo ""
delayPrint("On va découvrir si tu es un vrai dev ou pas ;)")
sleep(600)
echo ""
delayPrint("Bonne chance !")
sleep(300)
echo ""

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

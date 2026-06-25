#!/bin/bash

# Ellenőrzi, hogy a fájl tartalmaz-e while kulcsszót
if ! grep -q 'while' ~/code/step_1_challenge.rb; then
  echo "Hiba: Nem található 'while' kulcsszó a fájlban!"
  exit 1
fi

# Futtatja a scriptet és megszámolja a 'Hello World!' előfordulásait
OUTPUT=$(ruby ~/code/step_1_challenge.rb 2>&1)
COUNT=$(echo "$OUTPUT" | grep -c 'Hello World!')

if [ "$COUNT" -ne 8 ]; then
  echo "Hiba: A 'Hello World!' $COUNT alkalommal jelent meg, 8 helyett."
  exit 1
fi

echo "Siker! 8x 'Hello World!' while ciklussal."

#!/bin/bash

# Ellenőrzi, hogy a fájl tartalmaz-e 'loop' kulcsszót
if ! grep -q 'loop' ~/code/step_3_challenge.rb; then
  echo "Hiba: Nem található 'loop' kulcsszó a fájlban!"
  exit 1
fi

# Futtatja a scriptet és megszámolja a 'Ruby loop!' előfordulásait
OUTPUT=$(ruby ~/code/step_3_challenge.rb 2>&1)
COUNT=$(echo "$OUTPUT" | grep -c 'Ruby loop!')

if [ "$COUNT" -ne 5 ]; then
  echo "Hiba: A 'Ruby loop!' $COUNT alkalommal jelent meg, 5 helyett."
  exit 1
fi

echo "Siker! 5x 'Ruby loop!' loop ciklussal."

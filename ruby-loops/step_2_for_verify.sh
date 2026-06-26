#!/bin/bash

# Ellenőrzi, hogy a fájl tartalmaz-e 'for' kulcsszót
if ! grep -q 'for' ~/code/step_2_challenge.rb; then
  echo "Hiba: Nem található 'for' kulcsszó a fájlban!"
  exit 1
fi

# Futtatja a scriptet
OUTPUT=$(ruby ~/code/step_2_challenge.rb 2>&1)

# Ellenőrzi a 10 sort: 1: 2, 2: 4, ... 10: 20
for i in $(seq 1 10); do
  dupla=$((i * 2))
  if ! echo "$OUTPUT" | grep -q "${i}: ${dupla}"; then
    echo "Hiba: Hiányzik a '${i}: ${dupla}' sor a kimenetből!"
    exit 1
  fi
done

echo "Siker! A for ciklus helyesen írta ki az összes számot és dupláját."

# Ruby Objektum Orientáció — Házépítési hasonlat

> **"Minden egy objektum" — még a tervrajz is.**

Ebben a gyakorlati scenarióban a Ruby OOP alapjait tanulod meg egy **házépítési hasonlat** segítségével.

## Mit fogsz megtanulni?

| Lépés | Téma                    | Hasonlat                          |
|-------|-------------------------|-----------------------------------|
| 1     | Minden egy objektum     | Épületanyagok                     |
| 2     | Osztályok és példányok  | Tervrajz vs. valódi ház           |
| 3     | Öröklodés               | IS-A kapcsolat (Épulet)           |
| 4     | Mixinek                 | HAS-A kapcsolat (eloregyártott)   |
| 5     | Enkapszuláció           | Falak és magánszféra              |
| 6     | Polimorfizmus           | Sok forma, egy üzenet             |
| 7     | Duck Typing             | "Ha kacsaként viselkedik..."      |
| 8     | Metódus keresés         | Elektromos vezetékek követése     |
| 9     | Gyors referencia        | Puska                             |

## Kezdeti lépések

A Ruby telepítése folyamatban van a háttérben. Várj, amíg kész lesz:

`while [ ! -f /tmp/.ruby-ready ]; do sleep 1; done && echo "Ruby ready!"`{{exec}}

Ellenorizd a verziót:

`ruby --version`{{exec}}

A környezet automatikusan UTF-8-ra van állítva (LANG, LC_ALL, RUBYOPT), így az ékezetes karakterek gond nélkül muködnek.

Indítsd el az interaktív Ruby konzolt (IRB) ha szeretnél kísérletezni:

`irb`{{exec}}

> ❗ Ha beragadtál az IRB-be, nyomj `Ctrl+D`-t vagy írd be az `exit` parancsot a kilépéshez.

---

Kattints a **következo** gombra, amikor készen állsz!

# 11. Gyors Referencia

| Kulcsszó / Metódus | Típus | Leírás | Példa |
|--------------------|-------|--------|-------|
| `while` | Ciklus | Feltétel-vezérelt | `while i < n` |
| `until` | Ciklus | Invertált feltétel | `until i == n` |
| `loop` | Ciklus | Végtelen ciklus | `loop { break if ... }` |
| `for` | Ciklus | Tartományon/tömbön | `for x in 1..5` |
| `times` | Iterátor | N-szer | `5.times { ... }` |
| `upto` | Iterátor | Növekvő | `1.upto(5)` |
| `downto` | Iterátor | Csökkenő | `5.downto(1)` |
| `step` | Iterátor | Lépésközzel | `0.step(10,2)` |
| `each` | Iterátor | Végigiterál | `[].each { \|e\| ... }` |
| `map` | Iterátor | Átalakítás | `[].map { \|e\| e*2 }` |
| `select` | Iterátor | Szűrés (igaz) | `[].select { \|e\| e>0 }` |
| `reject` | Iterátor | Szűrés (hamis) | `[].reject { \|e\| e>0 }` |
| `inject` | Iterátor | Aggregálás | `[].inject(0) { \|a,e\| a+e }` |
| `break` | Vezérlés | Kilépés a ciklusból | `break if i > 5` |
| `next` | Vezérlés | Következő iteráció | `next if i.even?` |
| `redo` | Vezérlés | Iteráció újraindítása | `redo if input <= 0` |

> A `&` operátor blokkot alakít át `Proc`-ként: `[].map(&:upcase)`

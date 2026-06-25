# 9. Gyors Referencia

| Iterátor | Leírás | Példa |
|----------|--------|-------|
| `while` | Feltétel-vezérelt | `while i < n` |
| `until` | Invertált feltétel | `until i == n` |
| `for` | Tartományon/tömbön | `for x in 1..5` |
| `times` | N-szer | `5.times { ... }` |
| `each` | Végigiterál | `[].each { \|e\| ... }` |
| `map` | Átalakítás | `[].map { \|e\| e*2 }` |
| `select` | Szűrés (igaz) | `[].select { \|e\| e>0 }` |
| `reject` | Szűrés (hamis) | `[].reject { \|e\| e>0 }` |
| `inject` | Aggregálás | `[].inject(0) { \|a,e\| a+e }` |
| `upto` | Növekvő | `1.upto(5)` |
| `downto` | Csökkenő | `5.downto(1)` |
| `step` | Lépésközzel | `0.step(10,2)` |

> A `&` operátor blokkot alakít át `Proc`-ként: `[].map(&:upcase)`

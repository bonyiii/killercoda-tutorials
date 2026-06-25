# 6. `inject` és `reduce`

Az `inject` (alias: `reduce`) összegyűjti az elemeket egyetlen értékbe:

```ruby
osszeg = [1, 2, 3, 4, 5].inject(0) { |acc, n| acc + n }
puts osszeg
# => 15
```

Sztringek összefűzése:

```ruby
["R", "u", "b", "y"].inject("") { |acc, c| acc + c }
# => "Ruby"
```

> Próbálja ki: `ruby ~/code/step_6_inject.rb` — a lépés akkor teljesül, ha a script lefut.

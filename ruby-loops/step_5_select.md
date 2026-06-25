# 5. `select` és `reject`

A `select` kiválasztja azokat az elemeket, amelyekre a blokk igazat ad:

```ruby
[1, 2, 3, 4, 5, 6].select { |n| n.even? }
# => [2, 4, 6]
```

A `reject` pont az ellenkezőjét csinálja (kiveszi az igazakat):

```ruby
[1, 2, 3, 4, 5, 6].reject { |n| n.even? }
# => [1, 3, 5]
```

> Próbálja ki: `ruby ~/code/step_5_select.rb` — a lépés akkor teljesül, ha a script lefut.

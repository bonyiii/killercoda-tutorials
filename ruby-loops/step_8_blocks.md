# 8. Blocks, `Proc` és `lambda`

A Ruby ciklusok mögött mindig egy **blokk** áll, amit átadhatunk változóként is:

```ruby
duplaz = Proc.new { |n| n * 2 }
puts [1, 2, 3].map(&duplaz).inspect
# => [2, 4, 6]
```

A `lambda` szigorúbb paraméterellenőrzést ad:

```ruby
negyzet = lambda { |n| n ** 2 }
puts [2, 3, 4].map(&negyzet).inspect
# => [4, 9, 16]
```

> Próbálja ki: `ruby ~/code/step_8_blocks.rb` — a lépés akkor teljesül, ha a script lefut.

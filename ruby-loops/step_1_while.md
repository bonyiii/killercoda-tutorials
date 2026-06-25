# 1. `while` és `until`

A `while` ciklus addig fut, amíg a feltétel igaz (`true`).

```ruby
i = 0
while i < 5
  puts i
  i += 1
end
```

Az `until` a fordítottja: addig fut, amíg a feltétel hamis (`false`).

```ruby
i = 0
until i == 5
  puts i
  i += 1
end
```

> Próbálja ki: `ruby ~/code/step_1_while.rb` — a lépés akkor teljesül, ha a script lefut.

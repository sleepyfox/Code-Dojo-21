m = require 'mori'

random = -> Math.floor((Math.random() * 256) + 1)

nums = (x) ->
  m.take(x, m.repeatedly(random))

pos_int = (x) ->
  x > 0 and (x is Math.floor(x))

# TODO this fails for a list of 100k items,
# presumably due to a stack overflow. Needs TCO
isSorted = (l) ->
  if m.count(l) <= 1
    true
  else
    m.first(l) <= m.first(m.rest(l)) and isSorted(m.rest(l))

isPrime = (x) ->
  is_not_zero = (y) -> y isnt 0
  is_divisible_by = (y) -> x % y
  switch x
    when 1 then false
    when 2 then true
    else
      range = [2..Math.sqrt(x)]
      m.every(is_not_zero, m.map(is_divisible_by, range))

module.exports =
  random: random
  nums: nums
  pos_int: pos_int
  isSorted: isSorted
  isPrime: isPrime

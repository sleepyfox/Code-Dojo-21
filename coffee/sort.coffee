random = -> Math.floor((Math.random() * 256) + 1)

# nums:Number -> Seq[Num]
nums = (x) ->
  if x < 1
    []
  else
    [1..x].map(random)

# Number -> Boolean
pos_int = (x) ->
  x > 0 and (x is Math.floor(x))

# head:Seq[A] -> A
head = (l) -> l[0]

# tail:Seq[A] -> Seq[A]
tail = (l) -> l[1..]

# is_sorted:Seq[Number] -> Boolean
is_sorted = (l) ->
  if l.length <= 1
    true
  else
    head(l) <= head(tail(l)) and is_sorted(tail(l))

# is_prime:Number -> Boolean
is_prime = (x) ->
  is_not_zero = (y) -> y isnt 0
  is_divisible_by = (y) -> x % y
  switch x
    when 1 then false
    when 2 then true
    else
      [2..Math.sqrt(x)].map(is_divisible_by).every(is_not_zero)

# sort:Seq[Number] -> Seq[Number]
sort = (l) ->
  if l.length < 2
    l
  else
    insertion_sort [head(l)], tail(l)

# insertion_sort:Seq[Number] -> Seq[Number] -> Seq[Number]
insertion_sort = (sorted, unsorted) ->
  if unsorted.length is 0
    sorted
  else
    next_item = head(unsorted)
    lower_part = sorted.filter((n) -> n <= next_item)
    upper_part = sorted.filter((n) -> n > next_item)
    new_sorted = lower_part.concat next_item, upper_part
    insertion_sort new_sorted, tail(unsorted)

memoize = (func) ->
  unless memo? then memo = {}
  (arg) ->
    memo[arg] = func arg unless memo[arg]
    memo[arg]

module.exports =
  random: random
  nums: nums
  pos_int: pos_int
  is_sorted: is_sorted
  is_prime: is_prime
  sort: memoize(sort)

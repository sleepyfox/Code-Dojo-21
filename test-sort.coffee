require('chai').should()
m = require 'mori'

random = -> Math.floor((Math.random() * 256) + 1)

nums = (x) ->
  m.take(x, m.repeatedly(random))

pos_int = (x) ->
  x > 0 and (x is Math.floor(x))

describe 'A positive integer range checker', ->
  it 'should return true for 1', ->
    pos_int(1).should.be.true
  it 'should return false for -1', ->
    pos_int(-1).should.be.false
  it 'should return false for 1.5', ->
    pos_int(1.5).should.be.false

describe 'a list of numbers', ->
  describe 'when asked for no numbers', ->
    it 'should produce an empty list', ->
      m.isEmpty(nums(0)).should.be.true
  describe 'when asked for one number', ->
    it 'should produce a list of length one', ->
      m.count(nums(1)).should.equal 1
  describe 'when asked for 5 numbers', ->
    it 'should produce a list of 5 things', ->
      m.count(nums(5)).should.equal 5
    it 'each one should be a positive integer', ->
      m.every(pos_int, nums(5)).should.be.true
    it 'each one should be between 1 and 256', ->
      between_1_256 = (x) -> 1 <= x <= 256
      m.every(between_1_256, nums(5)).should.be.true

isSorted = (l) ->
  if m.count(l) <= 1
    true
  else
    m.first(l) <= m.first(m.rest(l)) and isSorted(m.rest(l))

describe 'A sorted list checker', ->
  it 'should recognise an empty list as sorted', ->
    isSorted(m.list()).should.be.true
  it 'should recognise a one-item list as sorted', ->
    isSorted(m.list(1)).should.be.true
  it 'should recognise (1,2) as sorted', ->
    isSorted(m.list(1,2)).should.be.true
  it 'should recognise (2,1) as unsorted', ->
    isSorted(m.list(2,1)).should.be.false

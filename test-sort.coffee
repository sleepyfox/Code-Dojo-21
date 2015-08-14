require('chai').should()
m = require 'mori'

nums = (x) ->
  m.take(x, m.repeat(1))

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
    # it 'each one should be a positive integer', ->
    #   m.every(pos_int)

# describe 'A sorted list of numbers', ->
#   describe 'when given an empty list', ->
#     it 'should return an empty list', ->
#       numbers.

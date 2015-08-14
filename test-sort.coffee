require('chai').should()
m = require 'mori'

nums = (x) ->
  m.take(x, m.repeat(1))

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
    # it 'should '

# describe 'A sorted list of numbers', ->
#   describe 'when given an empty list', ->
#     it 'should return an empty list', ->
#       numbers.

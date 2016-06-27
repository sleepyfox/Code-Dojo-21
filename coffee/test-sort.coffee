require('chai').should()
{ random, nums, pos_int, is_sorted, is_prime, sort } = require './sort'

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
      nums(0).should.have.length 0

  describe 'when asked for one number', ->
    it 'should produce a list of length one', ->
      nums(1).should.have.length 1

  describe 'when asked for 5 numbers', ->
    it 'should produce a list of 5 things', ->
      nums(5).should.have.length 5
    it 'each one should be a positive integer', ->
      nums(5).filter(pos_int).should.have.length 5
    it 'each one should be between 1 and 256', ->
      between_1_256 = (x) -> 1 <= x <= 256
      nums(5).filter(between_1_256).should.have.length 5

  describe 'when asked for 256 numbers', ->
    it 'should have 256 numbers!', ->
      nums(256).should.have.length 256

  describe 'when asked for 100k numbers', ->
    it 'should have 100000 numbers!', ->
      nums(100000).should.have.length 100000

  describe 'when asked for 10 million numbers', ->
    it 'should have 10000000 numbers!', (done) ->
      nums(10000000).should.have.length 10000000
      done()


describe 'A sorted list checker', ->
  it 'should recognise an empty list as sorted', ->
    is_sorted([]).should.be.true
  it 'should recognise a one-item list as sorted', ->
    is_sorted([1]).should.be.true
  it 'should recognise (1,2) as sorted', ->
    is_sorted([1,2]).should.be.true
  it 'should recognise (2,1) as unsorted', ->
    is_sorted([2,1]).should.be.false


describe 'A list sorter', ->
  describe 'when given an empty list', ->
    it 'should return the empty list', ->
      sort([]).should.be.empty
  describe 'when given a list with one element', ->
    it 'should return a list of one item', ->
      sort([1]).should.have.length 1
    it 'should return the same list', ->
      sort([1]).should.deep.equal [1]
  describe 'when given a list with 2 numbers in order', ->
    it 'should return the same list', ->
      result = sort [1,5]
      result.should.deep.equal [1,5]
      result[0].should.equal 1
      result[1].should.equal 5
  describe 'when given a list of 3 numbers', ->
    it 'should sort them into order', ->
      sort([3,1,2]).should.deep.equal [1,2,3]
  describe 'when given a list of 100000 numbers', ->
    it 'should sort them into order', ->
      is_sorted(sort(nums(10000))).should.be.true


describe 'A prime number checker', ->
  it 'should recognise 1 as not prime', ->
    is_prime(1).should.be.false
  it 'should recognise 2 as prime', ->
    is_prime(2).should.be.true
  it 'should recognise 3 as prime', ->
    is_prime(3).should.be.true
  it 'should recognise 4 as not prime', ->
    is_prime(4).should.be.false
  it 'should recognise 5 as prime', ->
    is_prime(5).should.be.true
  it 'should recognise 1000 as not prime', ->
    is_prime(1000).should.be.false
  it 'should recognise 997 as prime', ->
    is_prime(997).should.be.true
    

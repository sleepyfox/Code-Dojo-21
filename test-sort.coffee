require('chai').should()
m = require 'mori'
{ random, nums, pos_int, isSorted, isPrime } = require './sort'

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

  describe 'when asked for 256 numbers', ->
    it 'should have 256 numbers!', ->
      m.count(nums(256)).should.equal 256

  describe 'when asked for 100k numbers', ->
    it 'should have 100000 numbers!', ->
      m.count(nums(100000)).should.equal 100000

  describe 'when asked for 10 million numbers', ->
    it 'should have 10000000 numbers!', (done) ->
      m.count(nums(10000000)).should.equal 10000000
      done()

describe 'A sorted list checker', ->
  it 'should recognise an empty list as sorted', ->
    isSorted(m.list()).should.be.true
  it 'should recognise a one-item list as sorted', ->
    isSorted(m.list(1)).should.be.true
  it 'should recognise (1,2) as sorted', ->
    isSorted(m.list(1,2)).should.be.true
  it 'should recognise (2,1) as unsorted', ->
    isSorted(m.list(2,1)).should.be.false


describe 'A list sorter', ->
  describe 'when given an empty list', ->
    it 'should return the empty list', ->
      m.isEmpty(m.sort(m.list())).should.be.true
  describe 'when given a list of 3 numbers', ->
    it 'should sort them into order', ->
      m.toJs(m.sort(m.list(3,1,2))).should.deep.equal [1,2,3]
  describe 'when given a list of 100000 numbers', ->
    it 'should sort them into order', ->
      isSorted(m.sort(nums(10000))).should.be.true

describe 'A prime number checker', ->
  it 'should recognise 1 as not prime', ->
    isPrime(1).should.be.false
  it 'should recognise 2 as prime', ->
    isPrime(2).should.be.true
  it 'should recognise 3 as prime', ->
    isPrime(3).should.be.true
  it 'should recognise 4 as not prime', ->
    isPrime(4).should.be.false
  it 'should recognise 5 as prime', ->
    isPrime(5).should.be.true

### 1 ###


=begin Check to see if a string has the same amount of 'x's and 'o's. 
The method must return a boolean and be case insensitive. The string can contains any char.

Examples input/output:

XO("ooxx") => true
XO("xooxx") => false
XO("ooxXm") => true
XO("zpzpzpp") => true // when no 'x' and 'o' is present should return true
XO("zzoo") => false

Test Cases:

Test.assert_equals(XO('xo'),true)
Test.assert_equals(XO('XO'),true)
Test.assert_equals(XO('xo0'),true)
Test.assert_equals(XO('xxxoo'),false)
Test.assert_equals(XO("xxOo"),true)

=end

# My Solution

def XO(str)
  x = str.downcase.count("x")
  o = str.downcase.count("o")
  x == o ? true : false
end

# Other Solutions

def XO(str)
  str.downcase.count('x') == str.downcase.count('o')
end

def XO(str)
  str.scan(/o/i).count == str.scan(/x/i).count
end




### 2 ###

=begin
  
 
 When writing on Twitter, he was known for almost always capitalizing every word.

Your task is to convert strings to how they would be written by Jaden Smith. 
The strings are actual quotes from Jaden Smith, but they are not capitalized in 
the same way he originally typed them.

Example:

Not Jaden-Cased: "How can mirrors be real if our eyes aren't real"
Jaden-Cased:     "How Can Mirrors Be Real If Our Eyes Aren't Real" 

=end

# My Solution

class String
  def toJadenCase
    self.split(" ").map(&:capitalize).join(" ")
  end
end

# Other Solutions

class String
  def toJadenCase
    self.split.map(&:capitalize)*' '
  end
end


### 3 ###

=begin
Your task is to split the chocolate bar of given dimension n x m into small squares.
 Each square is of size 1x1 and unbreakable. Implement a function that will return
  minimum number of breaks needed.

For example if you are given a chocolate bar of size 2 x 1 you can split it
 to single squares in just one break, but for size 3 x 1 you must do two breaks.

If input data is invalid you should return 0 (as in no breaks are needed 
if we do not have any chocolate to split). Input will always be a non-negative integer.

Test.assert_equals(break_chocolate(5, 5), 24)
Test.assert_equals(break_chocolate(7, 4), 27)

My Solution
=end

def break_chocolate(n, m)
  if n < 2
    0
  else
    n * m - 1
  end
end


### Other Solutions ###

def break_chocolate(n, m)
  n == 0 || m == 0 ? 0 : n * m - 1
end


def break_chocolate(n, m)
  [n * m - 1, 0].max
end


def break_chocolate(n, m)
  (n * m).zero? ? 0 : n * m - 1
end



### 4 ###

=begin

An isogram is a word that has no repeating letters, consecutive or non-consecutive. 
Implement a function that determines whether a string that contains only letters is 
an isogram. Assume the empty string is an isogram. Ignore letter case.

is_isogram("Dermatoglyphics" ) == true
is_isogram("aba" ) == false
is_isogram("moOse" ) == false # -- ignore letter case

=end

# My Solution

def is_isogram(string)
  string.length == string.downcase.chars.uniq.length ? true : false
end

# Other Solutions

def is_isogram(string)
  string.downcase.chars.uniq == string.downcase.chars
end

def is_isogram(string)
   ('a'..'z').none?{|l| string.downcase.count(l) > 1}
   # Counts how many times same char occures in a string. Returns false if it's > 1
end


### 5 ###


=begin
  
 Given a non-negative integer, return an array / a list 
 of the individual digits in order.

Examples:

123 => [1,2,3]

1 => [1]

8675309 => [8,6,7,5,3,0,9]

=end


### My Solution ###

def digitize(n)
  n.to_s.chars.map(&:to_i)
end

### Other Solutions ###

def digitize(n)
  n.inspect.chars.collect(&:to_i)
end


### 6 ###

=begin

The Western Suburbs Croquet Club has two categories of membership,
 Senior and Open. They would like your help with an application form 
 that will tell prospective members which category they will be placed.

To be a senior, a member must be at least 55 years old and have a 
handicap greater than 7. In this croquet club, handicaps 
range from -2 to +26; the better the player the lower the handicap.

Input

Input will consist of a list of lists containing two items each. 
Each list contains information for a single potential member. 
Information consists of an integer for the person's age and an 
integer for the person's handicap.

Example Input

[[18, 20],[45, 2],[61, 12],[37, 6],[21, 21],[78, 9]]
Output

Output will consist of a list of string values (in Haskell: 
Open or Senior) stating whether the respective member is to be 
placed in the senior or open category.

Example Output

["Open", "Open", "Senior", "Open", "Open", "Senior"]

=end

### My Solution ###

def openOrSenior(data)
   list = []
   data.each do |member|
     if member.first >= 55 && member.last > 7
       list << "Senior"
     else
       list << "Open"
     end
   end
   list
end


### Other Solutions ###

#1
def openOrSenior(data)
  data.map { |i| Member.new(i).category }
end

class Member
  def initialize(data)
    @age = data.first
    @handicap = data.last
  end
  
  def category
    if @age >= 55 && @handicap > 7
      'Senior'
    else
      'Open'
    end
  end
 end

#2
def openOrSenior(data)
  data.map { |member| member[0] > 54 && member[1] > 7 ? 'Senior' : 'Open' }
end

#3
class Member
  attr_reader :age, :handicap
  
  SENIOR_MIN_AGE = 55
  SENIOR_MIN_HANDICAP = 8
  
  def initialize(attributes)
    @age = attributes[0]
    @handicap = attributes[1]
  end
  
  def senior?
    age >= SENIOR_MIN_AGE && handicap >= SENIOR_MIN_HANDICAP
  end
end


def openOrSenior(data)
  members = data.map{ |member_data| Member.new(member_data) }
  members.map{ |member| member.senior? ? 'Senior' : 'Open' }
end

#4

def openOrSenior(data)
  data.map { |age,handycap| age >= 55 && handycap > 7 ? "Senior" : "Open" }
end



### 7 ###

#Vampire Numbers

=begin

Our loose definition of Vampire Numbers can be described as follows:

6 * 21 = 126
# 6 and 21 would be valid 'fangs' for a vampire number as the 
# digits 6, 1, and 2 are present in both the product and multiplicands

10 * 11 = 110
# 110 is not a vampire number since there are three 1's in the
# multiplicands, but only two 1's in the product
Create a function that can receive two 'fangs' and determine if the product of
 the two is a valid vampire number.

=end

### My Solution Not working ((( ###

def vampire_test(a,b)
  if a <= 0 and b <= 0
    false
  elsif 
    
  else
    arr = (a*b).to_s.chars.map(&:to_i)
    [arr.include?(a), arr.include?(b), (arr.last != 0)].include?(false)
  end
end


### Other Solutions ###

def vampire_test(a,b)
  (a.to_s + b.to_s).chars.sort == (a * b).to_s.chars.sort
end

def vampire_test(a,b)
  "#{a}#{b}".chars.sort.join == (a*b).to_s.chars.sort.join
end

def vampire_test(a,b)
  product = (a * b).to_s.chars.sort
  fangs = "#{a}#{b}".chars.sort
  fangs == product
end


### 8 ###

# Return String of First Characters

=begin 

In this exercise, a string is passed to a method and a new string 
has to be returned with the first character of each word in the string

example: 'This Is A Test' will return 'TIAS'

=end


### My Solution ###

def make_string(s)
  s.split.map { |str| str.chars.first}.join
end

### Other Solutions ###

# Wow what do you know. chr works like chars but only with first occurance
def make_string(s)
  s.split.map(&:chr).join
end

# \b stands for breaks, \w for words. But why do we get the first character
# of the first string? There is no space before it
def make_string(s)
  s.scan(/\b\w/).join
end


### 9 ###
#
#
# Number Pairs
#
# In this Kata the aim is to compare each pair of integers from 2 arrays, and return a new array of large numbers.
#
# Note: Both arrays have the same dimensions.
#
# Example:
#
# arr1 = [13, 64, 15, 17, 88]
# arr2 = [23, 14, 53, 17, 80]
# get_larger_numbers(arr1, arr2) == [23, 64, 53, 17, 88]
#
#
#
### My Solution
def get_larger_numbers(a, b)
  x = 0
  result = []
  loop do
    a[x] > b[x] ? result << a[x] : result << b[x]
  x += 1
  break if a[x] == nil
  end
  result
end


### Other Solutions ###

def get_larger_numbers(a, b)
  a.zip(b).map(&:max)
end

def get_larger_numbers(a, b)
  a.zip(b).map {|x, y| x > y ? x : y}
end


### Green Glass Door  ###
#
#Step through my green glass door.
#You can take the moon, but not the sun.
#You can take your slippers, but not your sandals.
#You can go through yelling, but not shouting.
#You can't run through fast, but you can run with speed.
#You can take a sheet, but not your blanket.
#You can wear your glasses, but not your contacts.
#Have you figured it out? Good! Then write a program that can figure it out as well
#
#Test.assert_equals(step_through_with("moon"), true,
#Test.assert_equals(step_through_with("test")
#
#We have to check if the input string got repetitions in it.
#
#
#
#  While solving that i wrote this code. And it seemed interesting to me.
#  str = "You can take the moon, but not the sun"
#  str.split(",")[1] - this will return the part after comma.
#  str.split(",")[0] - this will return the part before comma.
### My Solution ###

def step_through_with(s)i
  # It doesn't solve the kata because it returns true even if same chars are met in diffrent part of the word. Like "ThaT"
  s.chars.count == s.chars.uniq.count
end

### Other Solutions ###

def step_through_with(s)
  !!s[/(.)\1/]
end

def step_through_with(s)
  # Found out how String#squeeze works. It returns a string without duplications accuring one after another.
  s.squeeze != s
end



### Number of People in the Bus ###


=begin

There is a bus moving in the city, and it takes and drop some people in each bus stop.

You are provided a list (or array in JS) of integer array. Each integer array has two
 items which represent number of people get into bus (The first item) and number of
  people get off the bus (The second item).
The first integer array has 0 number in the second item, since the bus is empty in 
the first bus stop.
Your task is to return number of people in the bus after the last bus station. 
Take a look on the test cases :)
Please keep in mind that the test cases ensure that the number of
people in the bus is always >= 0. So the return integer can't be negative.

describe "number" do
  it "works for some examples" do
    Test.assert_equals number([[10, 0], [3, 5], [5, 8]]), 5, "didn't work for [[10, 0], [3, 5], [5, 8]]"
    Test.assert_equals number([[3, 0], [9, 1], [4, 10], [12, 2], [6, 1], [7, 10]]), 17, "didn't work for [[3, 0], [9, 1], [4, 10], [12, 2], [6, 1], [7, 10]]"
    Test.assert_equals number([[3, 0], [9, 1], [4, 8], [12, 2], [6, 1], [7, 8]]), 21, "didn't work for [[3, 0], [9, 1], [4, 8], [12, 2], [6, 1], [7, 8]]"
  end
end

=end


### My Solution ###

def number(bus_stops)
  x = bus_stops.flatten
  ins = x.select.with_index{|_,i| (i+2) % 2 == 0}.inject(:+)
  outs = x.each_slice(2).map(&:last).inject(:+)
  ins - outs
end

### Other Solutions ###

def number(bus_stops)
  bus_stops.map {|(on,off)| on - off }.reduce(:+)
end

def number(bus_stops)
  bus_stops.map{|x| x[0] - x[1]}.reduce(0, :+)
end

def number(bus_stops)
  bus_stops = bus_stops.map {|stop| stop[0] - stop[1]}
  bus_stops.inject(&:+)
end

### String to integer conversion  ###
#
#JavaScript provides a built-in parseInt method.
#
#It can be used like this:
#
#parseInt("10") returns 10
#parseInt("10 apples") also returns 10
#We would like it to return "NaN" (as a string) for the second case because the input string is not a valid number.
#
#You are asked to write a myParseInt method with the following rules:
#
#It should make the conversion if the given string only contains a single integer value (and eventually spaces - including tabs, line feeds... - at both ends)
#For all other strings (including the ones representing float values), it should return NaN
#It should assume that all numbers are not signed and written in base 10
#
#
#
#Test.assert_equals(my_parse_int("1"), 1)
#Test.assert_equals(my_parse_int("  1 "), 1)
#Test.assert_equals(my_parse_int("08"), 8)
#Test.assert_equals(my_parse_int("5 friends"), "NaN")
#Test.assert_equals(my_parse_int("16.5"), "NaN")
#
#
### My Solution ###
#incorrect

def my_parse_int(string)
  string.respond_to?(:to_i) ? string.to_i : "NaN"
end

### Other Solutions ###


def parse_int(string)
  array = string.split()
  return "NaN" if array.size > 1
  array = array.pop.split('.')
  return "NaN" if array.size > 1
  return "NaN" if array[0]  if array[0][/[0-9]+/]  != array[0]
  array.pop.to_i
end


def my_parse_int(string)
  string.strip =~ /^\d+$/ ? string.to_i : "NaN"
end

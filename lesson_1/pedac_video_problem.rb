=begin

Imagine a sequence of consecutive even integers beginning with 2. The
integers are grouped in rows, with the first row containing one integer,
the second row two integers, the third row three integers, and so on. Given
an integer representing the number of a particular row, return an integer
representing the sum of all the integers in that row.

P - Understand the Problem

- Sequence of even integers
- Sequence begins with 2
- Integers are consecutive
- Sequence is grouped into rows
- Each row is incrementally larger than the last (1, 2, 3...)
- Row `number` will equal the number of elements in that row
  - Row 1 has 1 element, Row 2 has 2 elements, ...
- Input: a single integer
  - Identifies a row, which is a subset of a sequence of integers
- Output: a single integer
  - Sum of integers in a row indentified by the input integer

- Sequence:
  2, 4, 6, 8, 10, 12, 14, 16, 18...

- Structure:
  2
  4, 6
  8, 10, 12
  14, 16, 18
  ...

- How do we create the structure?

E - Examples and Test Cases

row number: 1 --> sum of integers in row: 2
row number: 2 --> sum of integers in row: 10
row number: 4 --> sum of integers in row: 68

  2 --> 2
  4, 6 --> 10
  8, 10, 12 --> 30
  14, 16, 18 --> 68

D - Data Structures

- Overall structure representing a sequence as a whole
- Individual rows within overall structure
- Individual rows in a set order in context of sequence
- Individual rows contain integers
- Can assume that integers are in a set order in the context of the sequence

[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  ...
]

A - Algorithm

1. Create an empty `rows` array to contain all of the rows
2. Create a `row` array and add it to the overall `rows` array
3. Repeat step 2 until all the necessary rows have been created
  - All rows have been created when the length of the `rows` array is equal
  to the input integer
4. Sum the final row
5. Return the sum of the final row

Calculate the Starting Integer:

Problem
- Rule: First integer of row == last integer of preceding row + 2

Algorithm:
- Get the last row of the `rows` array
- Get last integer of that row
- Add 2 to the integer


--------------------------------

*Problem: Create a Row

Rules:
- Row is an array
- Arrays contain integers
- Integers are consecutive even integers
- Integers in each row form part of an overall larger sequence
- Rows are of different lengths
- Input: the information needed to create the output
  - The starting integer
  - Length of the row
- Output: the row itself

Examples:
Start: 2, Length: 1 --> [2]
Start: 4, Length: 2 --> [4, 6]
Start: 8, Length: 3 --> [8, 10, 12]

Data Stuctures:
- An array of integers

Algorithm:
1. Create an empty 'row' to contain integers
2. Add the starting integer
3. Increment starting integer by 2 to get the next integer in the sequence
4. Repeat steps 2 and 3 until the array has reached the correct length
5. Return the 'row' array

- Start the loop
  - Add the start of integer to the row
  - Increment the start integer by 2
  - Break out of the loop if length of row equals row length

------------------------

C - Code

=end

def sum_even_number_row(row_number)
  rows = []
  start_integer = 2
  (1..row_number).each do |current_row_number|    
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  p rows
  rows.last.sum
end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end

p sum_even_number_row(1) == 2   # true
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68

p create_row(2, 1) == [2]
p create_row(4, 2) == [4, 6]
p create_row(8, 3) == [8, 10, 12]
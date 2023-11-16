=begin

Imagine a sequence of consecutive even integers beginning with 2. The
integers are grouped in rows, with the first row containing one integer,
the second row two integers, the third row three integers, and so on. Given
an integer representing the number of a particular row, return an integer
representing the sum of all the integers in that row.

P - Understand the Problem

- Sequence of integers
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

=end

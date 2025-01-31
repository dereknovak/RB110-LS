=begin

PROBLEM

Given a string, write a method change_me which returns the same string
but with all the words in it that are palindromes upercased.

Test cases:

change_me("We will meet at noon") == "We will meet at NOON"
change_me("No palindromes here") == "No palindromes here"
change_me("") == ""
change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

input: string
output: string (not the same object)
rules:
    Explicit requirements:
      - Every palindrome in the string must be converted to uppercase. 
      (Reminder: a palindrome is a word that reads the same forwards and
      backwards).
      - Palindromes are case sensitive ("Dad" is not a palindrome, but "dad"
      is.)

    Implicit requirements:
      - The returned string shouldn't be the same string object.
      - If the string is an empty string, the result should be an empty string

-

PROBLEM

Given a string, write a method `palindrome_substrings` which returns all the
substrings from a given string which are palindromes. Consider palindrome
words case sensitive.

Test cases:

palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
palidrome_substrings("palindrome") == []
palindrome_substrings("") == []

input: string
output: array
rules:
    Explicit requirements
      - push all substrings that are palindromes into an array (palindromes
      are read the same foreward and backward)
      - Palindromes are case-sensitive

    Implicit requirements
      - If no palindromes, returns an empty array


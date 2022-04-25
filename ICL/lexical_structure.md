# Lexical Structure

The lexical units are integers, type identifiers, object identifiers, special notation, strings, keywords, and white space.

## Integers, Identifiers, and Special Notation

Integers are non-empty strings of digits 0-9. 
Identifiers are strings (other than keywords) consisting of letters, digits, and the underscore character. 
Type identifiers begin with a capital letter; object identifiers begin with a lower case letter. There are two other identifiers, self and SELF TYPE that are treated specially by Cool but are not treated as keywords. The special syntactic symbols (e.g., parentheses, assignment operator, etc.) are given in Figure 1.

## Strings

Strings are enclosed in double quotes ```"..."```. 
Within a string, a sequence ‘\c’ denotes the character ‘c’, with the exception of the following:
\b backspace \t tab
\n newline \f formfeed

A non-escaped newline character may not appear in a string:
```
"This \
is OK"
``` 
```
"This is not
OK"
```
A string may not contain EOF. 
A string may not contain the null (character \0). 
Any other character may be included in a string. Strings cannot cross file boundaries.

###  Comments

There are two forms of comments in Cool. Any characters between two dashes “--” and the next newline (or EOF, if there is no next newline) are treated as comments. Comments may also be written by enclosing text in (∗ . . . ∗). The latter form of comment may be nested. Comments cannot cross file boundaries.

### Keywords

The keywords of cool are: class, else, false, fi, if, in, inherits, isvoid, let, loop, pool, then, while, case, esac, new, of, not, true. Except for the constants true and false, keywords are case insensitive. To conform to the rules for other objects, the first letter of true and false must be lowercase; the trailing letters may be upper or lower case.

### White Space

White space consists of any sequence of the characters: blank (ascii 32), \n (newline, ascii 10), \f (form feed, ascii 12), \r (carriage return, ascii 13), \t (tab, ascii 9), \v (vertical tab, ascii 11).


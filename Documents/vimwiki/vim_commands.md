1. x - delete a single characnter
2. A - append text in the end of a line
3. i - insert text
4. u - undo the last command
5. U - to fix a whole line
6. ctrl+r - redo the commands
7. p - put previously deleted text after the cursor
8. r + [target character] - replace the character at the cursor with the [target character]
9. G - move you to the bottom of the file
10. gg - move you to the start of the file
11. number + G - move the a specific line of the file
12. ctrl + g - show your location in the file and the file status
13. / - followed by a phrase to search for the phrase
    1. ? - followed by a phrase to search for the phrase in the opposite direction
    2. n - search for the same phrase again
    3. N - search for the same phrase in the opposite direction
    4. ctrl+o - to go back to where came from
    5. ctrl+i - goes forward
14. % - place the cursor on any parentheses and type % to move to the matching parentheses or bracket
15. :s substitute
    1. :#,#s/old/new/g - where #,# are the line numbers of the range of lines where the substitution is to be done.
    2. :s/old/new/g - to change every occurrence in the whole file
    3. :s/old/new/gc - to find every occurrence in the whole file, with a prompt whether to substitute or not.
16. :! followed by an external command to execute that command
17. :w filename - to save the changes made to the text.
18. v - visual mode
    1. move the cursor and press : character, :'<,'> will appear, and type w filename to save part of the file.

19. :r - insert the contents of a file, type :r FILENAME, the content will appear below the cursor line, and also :r !ls can read the output of the commands and put it below the cursor.
20. o - open a line below the cursor and place you in insert mode
21. O - open a line above the cursor and place you in insert mode
22. e - jump to the end of the next word
23. a - insert after the cursor
24. $ - jump to the end of a line
25. :set - set an option so a search or substitute ignores casae
    - :set ic - ignore case
    - :set hlsearch - highlight search
    - :set is - :
26. >, < - in visual mode, it can tab multiple lines of code 



operation and motion

// typing a number before a motion repeats it that many times

1. d - delete operation

   - w - until the start of the next word, exclude its first character
   - e - to the end of the current word, include the last character
   - $ - to the end of the line, include the last character
   - d - to delete a line

2. c - change operation

   - e - deletes the word and places you in insert mode.
   - c - does the same for the whole line.
   - $ - to the end of the line, include the last character
   - w - the same as d operation

3.  y - copy

   - yw copy a word from cursor to the end of the word
   - yy copy the whole line

   

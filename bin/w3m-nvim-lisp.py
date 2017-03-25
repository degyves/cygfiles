#!/usr/bin/env python
import subprocess, sys, fileinput
tokens = []
txt =  sys.argv[1].translate(str.maketrans({ "*": r"ST" }))
txt =  sys.argv[1].translate(str.maketrans({ "&": r"AM" }))
print ("Searching "+txt)
for line in sys.stdin:
    idx = line.rfind('#');
    if ( idx > 0 and (
        line[idx:].startswith( '#'+txt ) 
        # or
        # line[idx:].startswith( '#AM'+txt ) 
        # or
        # line[idx:].startswith( '#find-'+txt ) 
        )):
        tokens.append(line)

if ( tokens.__len__() == 1 ):
    subprocess.call(['w3m', tokens[0]])
else:
    for index, token in enumerate(tokens):
        idx = token.rfind('/');
        print (index+1, "- "+token[idx+1:], end='')

    # read from terminal because stdin is already in use
    sys.stdin = open('/dev/tty')
    try:
        token_number = int(input("Choose a token number, ENTER to cancel: "))
        print ( "You have chosen "+ str(token_number) +".")
        token = tokens[int(token_number) - 1]
        subprocess.call(['w3m', token])
    except ValueError:
        print ("Cancelled.")



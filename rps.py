#! /usr/bin/python3
from sys import exit
from random import choice
R="r"
P="p"
S="s"
e={R:chr(129704),P:chr(129531),S:chr(128298)}
c=tuple(e.keys())
def i():
    while True:
        u=input(f"Rock ({R}), paper ({P}), scissors ({S}): ").lower()
        if u in c:
            return u
        else:
            print(f"Try again! Valid choices are {R}, {P}, {S}.")
def p(u,c):
    print(f"You've chosen {e[u]}.")
    print(f"Computer chosen {e[c]}.")
def w(u,c):
    if u==c:
        print("Tie!")
    elif (u==R and c==S) or (u==P and c==R) or (u==S and c==P):
        print("Victory!")
    else:
        print("Defeat!")
def main():
    while True:
        u=i()
        r=choice(c)
        p(u,r)
        w(u,r)
        if input("\"Enter\" to continue, \"q\" to quit: ").lower()=="q":
            exit(0)
main()


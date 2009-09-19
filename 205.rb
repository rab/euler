# Problem 205
# 06 September 2008
#
# Peter has nine four-sided (pyramidal) dice, each
# with faces numbered 1, 2, 3, 4.
#
# Colin has six six-sided (cubic) dice, each
# with faces numbered 1, 2, 3, 4, 5, 6.
#
# Peter and Colin roll their dice and compare totals: the highest total
# wins. The result is a draw if the totals are equal.
#
# What is the probability that Pyramidal Pete beats Cubic Colin? Give your
# answer rounded to seven decimal places in the form 0.abcdefg

###########################################################################

# Pete: 9d4 range 9..36
1d4 (1..4)
1 .25
2 .25
3 .25
4 .25

2d4 (2..8)

+ 1 2 3 4
1 2 3 4 5
2 3 4 5 6
3 4 5 6 7
4 5 6 7 8

2 .25**2 * 1   =   C(2,2) = 1
3 .25**2 * 2   = 2*C(1,1) = 2
4 .25**2 * 3   =   C(2,1)
5 .25**2 * 4   = n
6 .25**2 * 3   = 
7 .25**2 * 2
8 .25**2 * 1

3d4 (3..12)

+ 1 2 3 4  + 1 2 3 4  + 1 2 3 4  + 1 2 3 4
1 3 4 5 6  1 4 5 6 7  1 5 6 7 8  1 6 7 8 9
2 4 5 6 7  2 5 6 7 8  2 6 7 8 9  2 7 8 9 a
3 5 6 7 8  3 6 7 8 9  3 7 8 9 a  3 8 9 a b
4 6 7 8 9  4 7 8 9 a  4 8 9 a b  4 9 a b c

3 .25**3 * 1
4 .25**3 * 3
5 .25**3 * 6
6 .25**3 * 10
7 .25**3 * 12
8 .25**3 * 12
9 .25**3 * 10
a .25**3 * 6
b .25**3 * 3
c .25**3 * 1

4d4 (4..16) 256 options

4   C(4,4)
5   C(4,1)
6   C(4,1)+C(4,2)
7   C(4,1)+C(3,1)+C(3,2)+
8
9
a
b
c
d
e
f
g

# Colin: 6d6 range 6..36

# There are 4**9 rolls for Pete and 6**6 rolls for Colin so over 12 billion
# possibles (i.e., brute-force is out!)

puts "%09.7f"%pete

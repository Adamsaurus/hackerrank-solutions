# Enter your code here. Read input from STDIN. Print output to STDOUT
N = raw_input()
L = map(int,list(raw_input().split()))

#print L
max_num = None
second_max_num = None

for number in xrange(0, len(L)):
    if L[number] > max_num:
            max_num = L[number]

for number in xrange(0, len(L)):
    if L[number] != max_num:
        if L[number] > second_max_num:
            second_max_num = L[number]

print second_max_num

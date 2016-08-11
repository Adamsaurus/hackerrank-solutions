#!/bin/bash
read N
#z=$((x / y))

tree_space=0

for k in `seq $((N))`;
do
    #printf $k
	tree_space=$((tree_space+(32/(2**(k-1)))))
done

top_space=$((63-tree_space))

# print empty top space
for((l=$top_space;l--;));
do
    for columns in {1..100};
    do
        printf "_"
    done
    printf "\n"
done



# print tree 
#for ((i=10;i>0;i-=2)) ; do echo -n "$i," ; done
#for i in `seq $((N))`;
for((i=$((N));i>0;i-=1))
do
    #echo $i
    branches=$((2**i))
    #if [ $((branches)) -le 2 ]; then
    #    inside_padding=32
    #    tot_inside_padding=32
    #else
    #    inside_padding=$((2**(6-i)))
    #    tot_inside_padding=$((inside_padding*(branches-1)))
    #fi
    inside_padding=$((2**(6-i)))
    tot_inside_padding=$((inside_padding*(branches-1)))
    left_padding=$(((102-branches-tot_inside_padding)/2))
    right_padding=$((left_padding+branches+tot_inside_padding))
    rows=$((16/(2**(i-1))))
    #echo $branches
    #echo $inside_padding
    #echo $tot_inside_padding
    #echo $left_padding
    #echo $right_padding
     
    #print slants
    for((j=$rows;j--;))
    do
        for column in {1..100};
        do
            if [ $((column)) -lt $((left_padding)) ]; then 
                printf "_"; 
            elif [ $column -ge $right_padding ]; then
                printf "_";
            elif [ $((column-left_padding)) -eq 0 ]; then
                printf "1";
            elif [ $(((column-left_padding)%inside_padding)) -eq 0 ]; then
                printf "1";
            else 
                printf "_" 
            fi       
        done
        left_padding=$((left_padding+1))
        right_padding=$((right_padding-1))
        inside_padding=$((inside_padding-2))
        printf "\n"    
    done

    branches=$((2**(i-1)))
    inside_padding=$((32-(2**(6-branches))))
    tot_inside_padding=$((inside_spacing*(branches-1)))
    left_padding=$(((101-branches-tot_inside_padding)/2))
    right_padding=$((left_padding+branches+tot_inside_padding))
    rows=$((16/(2**(i-1))))
    #echo $branches
    #echo $inside_padding
    #echo $tot_inside_padding
    #echo $left_padding
    #echo $right_padding
    #echo $rows

    #print straights
    for((m=$rows;m--;))
    do
        for column in {1..100};
        do
            if [ $((column)) -lt $((left_padding)) ]; then 
                printf "_"; 
            elif [ $column -ge $right_padding ]; then
                printf "_";
            elif [ $((column-left_padding)) -eq 0 ]; then
                printf "1";
            elif [ $(((column-left_padding)%inside_padding)) -eq 0 ]; then
                printf "1";    
            else 
                printf "_" 
            fi       
        done
        printf "\n"    
    done
done

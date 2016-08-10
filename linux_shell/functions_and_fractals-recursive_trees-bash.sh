#!/bin/bash
read N

#z=$((x / y))

tree_space=0

for((i=$N;i--;));
do
	tree_space=$((tree_space+(32/(2**(N-1)))))
done

top_space=$((63-$tree_space))

# print empty top space
for((i=$top_space;i--;));
do
    for columns in {1..100};
    do
        printf "_"
    done
    printf "\n"
done

echo $N

# print tree 
for((i=$N;i--;));
do
    branches=$((2**N))
    inside_padding=$((32/(branches-1)))
    tot_inside_padding=$((inside_padding*(branches-1)))
    left_padding=$(((102-branches-inside_padding)/2))
    right_padding=$((left_padding+branches+tot_inside_padding))
    rows=$((16/(2**(N-1))))
    echo $branches
    echo $inside_padding
    echo $tot_inside_padding
    echo $left_padding
    echo $right_padding
     

    #print slants
    for((i=$rows;i--;))
    do
        for column in {1..100};
        do
            if [ $((column)) -lt $((left_padding)) ]; then 
                printf "_"; 
            elif [ $column -gt $right_padding ]; then
                printf "_";
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

    branches=$((2**N))
    inside_padding=$((32/branches))
    total_inside_padding=$((inside_spacing*(branches-1)))
    left_padding=$(((100-branches-inside_padding)/2))
    right_padding=
    rows=$((16/(2**(N-1))))

    #print straights
    #for((i=$rows;i--;))
    #do
    #    for columns in {1..100}
    #    do
    #        printf "i"
    #    done
    #done
    #printf "\n"
    
done

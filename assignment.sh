#! /bin/bash


items=("Partridge in a Pear Tree" "Turtle Dove" "French Hen" "Calling Bird" "Gold Ring" "Geese a Laying" "Swans a Swimming" "Maides a Milking" "Ladies Dancing" "Lords A Leaping" "Piper Piping" "Drummer Drumming")
costs=(15 27 15 14 9 25 5 7 18 14 27 26)

# Computes and returns the total cost of all items 
# starting with the first and continuing up 
# to and including the item at the input number.
get_total_cost () {
    local index=0
    local total_cost=0
    local limit=$1
    until [ $index -gt $limit ]
    do
        total_cost=$((total_cost + ${costs[$index]}))
        index=$((index + 1))
    done
    echo $total_cost
}

# Prompt user for input and validate it
read -p "Enter a number between 1 and 12: " input_number
if ((input_number < 1 || input_number > 12)); then
    echo "Input Number is not between 1 and 12"
else
    index=$((input_number - 1)) 
    item=${items[$index]}
    cost=${costs[$index]}
    total_cost=$(get_total_cost $index)
    echo "Input Number: $input_number"
    echo "Item: $item"
    echo "Cost: $cost"
    echo "Total: $total_cost"
fi
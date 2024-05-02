#! /bin/bash
languages=("C" "C++" "R" "Bash" "Go" "Rust")

# Function to display array
display_array() {
    echo "Programming Languages: ${languages[@]}"
}

# Function to update a language
update_language() {
    local old_lang=$1
    local new_lang=$2
    for i in "${!languages[@]}"; do
        if [[ "${languages[i]}" == "$old_lang" ]]; then
            languages[i]=$new_lang
            echo "Update successful: $old_lang to $new_lang"
            display_array
            return
        fi
    done
    echo "Update failed: $old_lang not found in the array"
}

add_language() {
    local new_lang=$1
    languages+=($new_lang)
    echo "Add successful: $new_lang added to the array"
    display_array
}

read -p "Enter 'U' to update or 'A' to add a language: " action

if [ $action == 'U' ]
then
    read -p "Enter the language to update: " old_lang
    read -p "Enter the new language: " new_lang
    update_language $old_lang $new_lang
elif [ $action == 'A' ]
then
    read -p "Enter the new language to add: " new_lang
    add_language $new_lang
else 
    echo Invalid input
fi
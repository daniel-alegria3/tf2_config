#!/bin/bash

# Parameters
file_path="$1"
entry_name="$2"
key="$3"
new_value="$4"

# Variables to track the entry
in_entry=false

# Process the file line by line
while IFS= read -r line; do
    # Check if we are entering the target entry
    if [[ $line == *"\"$entry_name\""* ]]; then
        in_entry=true
    fi

    # Check if we are exiting the entry
    if [[ $in_entry == true && $line == *"}"* ]]; then
        in_entry=false
    fi

    # Replace the key value if inside the target entry
    if [[ $in_entry == true && $line == *"\"$key\""* ]]; then
        line=$(echo "$line" | sed -E "s/(\"$key\"[[:space:]]+\")[^\"]+/\1$new_value/")
    fi

    # Print the processed line
    echo "$line"
done < "$file_path" > temp_file && mv temp_file "$file_path"


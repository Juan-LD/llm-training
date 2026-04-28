
# Usage: ./create_files.sh <file_name> <number_of_files> [starting_number]
# Example: ./create_files.sh base_text 10      (starts from 1)
# Example: ./create_files.sh base_text 5 45    (starts from 45)

file_name="$1"
num_files="$2"
start_num="${3:-1}"  # Default to 1 if not provided

# Validate inputs
if [ $# -lt 2 ] || [ $# -gt 3 ]; then
    echo "Usage: $0 <file_name> <number_of_files> [starting_number]"
    echo "Example: $0 base_text 10"
    echo "Example: $0 base_text 5 45"
    exit 1
fi

# Generate files
for ((i=0; i<num_files; i++)); do
    current_num=$((start_num + i))
    # Format with 4 digits (0001, 0012, 0123, 1234)
    formatted_num=$(printf "%04d" $current_num)
    filename="${file_name}_${formatted_num}.json"

    echo "{}" > "$filename"
    echo "Created: $filename"
done

echo "Done! Created $num_files file(s)"

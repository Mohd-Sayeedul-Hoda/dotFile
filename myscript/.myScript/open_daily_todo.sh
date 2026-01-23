#!/bin/bash

OBSIDIAN_DIR="/home/aman/Obsidian "

SELECT_DATE="today"

case "$1" in
    -yes)
        SELECT_DATE="yesterday"
        ;;
    -tom)
        SELECT_DATE="tomorrow"
        ;;
esac

if [[ "$SELECT_DATE" == "yesterday" ]]; then
    FILE_DATE=$(date -d "yesterday" +%d-%b-%y)
    FILE_DAY=$(date -d "yesterday" +%a)
elif [[ "$SELECT_DATE" == "tomorrow" ]]; then
    FILE_DATE=$(date -d "tomorrow" +%d-%b-%y)
    FILE_DAY=$(date -d "tomorrow" +%a)
else
    FILE_DATE=$(date +%d-%b-%y)
    FILE_DAY=$(date +%a)
fi

filename="$OBSIDIAN_DIR/dailyNotes/${FILE_DATE}-${FILE_DAY}_todo.md"

mkdir -p "$OBSIDIAN_DIR/dailyNotes"

if [[ ! -f "$filename" ]]; then
    cat <<EOF > "$filename"

#### Important and Urgent (Do First)

- 

#### Important and Not Urgent (Schedule)

- 

#### Not Important But Urgent (Delegate)

- 

#### Not Important and Not Urgent (Eliminate)

- 
EOF
fi


nvim "$filename"

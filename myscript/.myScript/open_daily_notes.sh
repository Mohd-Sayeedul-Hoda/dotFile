#!/bin/bash

OBSIDIAN_DIR="/home/aman/Obsidian "
DAILY_NOTES_DIR="$OBSIDIAN_DIR/dailyNotes/Dairy"

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

filename="$DAILY_NOTES_DIR/${FILE_DATE}_daily.md"

mkdir -p "$DAILY_NOTES_DIR"

if [[ ! -f "$filename" ]]; then
    cat <<EOF > "$filename"
### 📅 Daily Questions

##### 📌 Quick summary of today:
- 

##### 🙌 One thing I'm excited about right now is...
- 

##### 🚀 One+ thing I plan to accomplish today is...
- 

##### 👎 One thing I'm struggling with today is...
- 

---
# 📝 Journal

EOF
fi

nvim "$filename"


word_to_search="word-to-search-for"

git stash list | while read -r line; do
  stash=$(echo "$line" | cut -d':' -f1)  
  matches=$(git stash show -p "$stash" | grep -n "$word_to_search") 
  
  if [[ -n "$matches" ]]; then  
    echo "Searching in $stash..."
    echo "$matches" 
  fi
done
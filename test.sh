for dir in */ ; do
    if [ -d "$dir" ]; then
        count=$(find "$dir" -type f | wc -l)
    fi
    echo "$dir: $count files"
done

#!/bin/sh

set -e

save_dir='/tmp/stackdata'
save_file="$save_dir/stack_$PPID"

usage() {
        echo 'stack [ up | dw | sw | ls | rm | help ]'
}

help() {
        echo 'stack [ up | dw | sw | ls | rm | help ] :'
        echo ' | up : Push the current directory onto the stack'
        echo ' | dw : Pop the top of the stack and return it'
        echo ' | sw : Replace the top of the stack with the current directory and return it'
        echo ' | ls : List the contents of the stack'
        echo ' | rm : Remove the stack'
}

up() {
        pwd >> "$save_file"
}

dw() {
        touch "$save_file"
        last_line=$(tail -n 1 "$save_file")
        num_lines=$(wc -l < "$save_file")
        new_num_lines=$((num_lines - 1))
        head -n "$new_num_lines" "$save_file" > "$save_file"
        echo $last_line
}

sw() {
        dw
        up
}

list() {
        touch "$save_file"
        cat "$save_file"
}

remove() {
        rm "$save_file"
        touch "$save_file"
}

if [ "$#" -lt 1 ]; then
        echo 'Error: Insufficient number of arguments!'
        usage
        exit 1
fi

mkdir -p "$save_dir"

case "$1" in
        'up')
                up
                ;;
        'dw')
                dw
                ;;
        'sw')
                sw
                ;;
        'ls')
                list
                ;;
        'rm')
                remove
                ;;
        'help')
                help
                ;;
        *)
                usage
                exit 1
esac

exit 0

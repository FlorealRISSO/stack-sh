# stack.sh

`stack.sh` is a simple shell tool that implements a directory stack, allowing you to save and manage a list of directories.

## Features

- Push the current directory onto the stack
- Pop the top directory from the stack
- Swap the current directory with the top of the stack
- List all directories in the stack
- Remove the entire stack

## Usage

```
stack [ up | dw | sw | ls | rm | help ]
```

### Commands

- `up`: Push the current directory onto the stack
- `dw`: Pop the top directory from the stack and display it
- `sw`: Replace the top of the stack with the current directory and display the previous top
- `ls`: List all directories in the stack
- `rm`: Remove the entire stack
- `help`: Display help information

## Installation

1. Save the script as `stack.sh` in a directory included in your PATH.
2. Make the script executable:
   ```
   chmod +x stack.sh
   ```
3. You can now use the tool by running `stack.sh` or simply `stack` if you rename it.

## How it works

- The stack is stored in a file named `stack_<PPID>` in the `/tmp/stackdata/` directory.
- Each directory is stored as a separate line in the stack file.
- The script uses standard Unix commands like `pwd`, `head`, `tail`, and `wc` to manipulate the stack.

## Notes

- The script uses `set -e` to exit immediately if any command fails.
- If no arguments are provided, the script will display an error message and the usage information.
- Invalid commands will display the usage information and exit with an error code.

## License

This project is licensed under the MIT License. See the LICENSE file in the repository for the full license text.

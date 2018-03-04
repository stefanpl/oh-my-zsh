Functions can be unset with the 'unfunction' command:
unfunction some_function_name

Afterwards, just source .zshenv again
souce .zshenv

Now, the updated version of the fuction is loaded in the shell!
Of course, you can use a watcher to automate this:
chokidar my_function_file -c "clear && unfunction my_function_file && source ./../.zshenv && my_function_file"

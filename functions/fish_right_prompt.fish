function fish_right_prompt -d "Display if in a python package directory"
    if [ -f "__init__.py" ]
        set dir (dirname (pwd))
        set module (basename (pwd))
        while [ -f "$dir/__init__.py" ]
           set module (basename $dir)".$module"
           set dir (dirname $dir)
        end
        set_color yellow
        echo -n $module | grep -o '[^.]*' | head -n1 | xargs echo -n
        set_color green
        echo -n "$module" | grep -o '\..*'
        set_color normal
    end
end
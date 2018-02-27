input_file_path=$1
# FILES=($(ls -1 input_file_path))
FILES=($(ls -1 ${input_file_path}))
echo ${FILES[*]}

input_option () {
    echo ${OPTION}
    if [ ${OPTION} = "n" ]; then
        echo "Move to next student"
        status=0
    elif [ ${OPTION} = "r" ]; then
        echo "Repeat the experiment again"
        status=1
    elif [ ${OPTION} = "v" ]; then
        echo "read program file with vim"
        vim ${progfile}
        status=2
    fi
}

for id in ${FILES[*]}; do 
    echo ${id}
    progfile="${input_file_path}/${id}/${id}-1.c"
    if [ ! -f $progfile ]; then
        echo "NOT EXIST"
    else
        echo ${progfile}
        gcc ${progfile}
        ./a.out
        echo ${progfile}
    fi

    while true; do
        echo "n := next student\nc := Repeat the experiment again\nv := read program file with vim"
        echo "INPUT OPTION -: "
        read OPTION
        input_option ${OPTION}
        if [ ${status} = 0 ]; then
            break
        elif [ ${status} = 2]; then
            continue
        fi
    done
done


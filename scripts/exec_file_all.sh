input_file_path=$1
execute_file_number=$2
FILES=($(ls -1 ${input_file_path}))
echo ${#FILES[*]}

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
    elif [ ${OPTION} = "e" ]; then
        echo "read program file with emacs"
        emacs ${progfile}
        status=2
    elif [ ${OPTION} = "q" ]; then
        echo "shutdown"
        status=3
    else
        status=2
    fi
}

for ((i = 0; i < ${#FILES[*]}; i++)) {
    id=${FILES[i]}
    echo ${id}
    progfile="${input_file_path}/${id}/${id}-${execute_file_number}.c"
    if [ ! -f $progfile ]; then
        echo "NOT EXIST"
    else
        echo ${progfile}
        gcc -lm ${progfile}
        ./a.out
        echo ${progfile}
    fi

    while true; do
        echo "n := next student\nr := Repeat the experiment again\nv := read program file with vim\ne := read program file with emacs\nq := quit this process"
        echo "INPUT OPTION -: "
        read OPTION
        input_option ${OPTION}
        # ここにorで３の処理
        echo ${status}
        if [ ${status} = 0 ] || [ ${status} = 3 ]; then
            break
        elif [ ${status} = 1 ]; then
            i=$i-1
            break
        elif [ ${status} = 2]; then
            continue
        fi
    done


    ##################################################
    # TODO : なんか知らんけどstatusのifがうまく通らない
    echo "thought"
    echo ${status}

    if [ ${status} = 3]; then
        echo "shutdown 222222222"
        exit 0;
    fi
}

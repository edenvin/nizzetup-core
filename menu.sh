#! /usr/bin/env bash

function run_option {
    printf "\nExecuting $1\n"
    $CONFIG_PATH/configs/$1
}

function show_menu {
    NR_OF_OPTIONS="${#MENU_OPTIONS[@]}"

    printf "\n"
    for i in `seq 1 $NR_OF_OPTIONS`; do
        printf "%i) %s\n" $i ${MENU_OPTIONS[$i-1]}
    done
    printf "%i) Quit\n\n" $(($NR_OF_OPTIONS+1))

    read -p "Choose what to run: " ANSWER

    if [ $ANSWER -le $NR_OF_OPTIONS ]; then
        run_option "${MENU_OPTIONS[$ANSWER-1]}"
    elif [ $ANSWER = $(($NR_OF_OPTIONS+1)) ]; then
        exit 0
    else
        printf "Invalid option\n\n"
    fi
}

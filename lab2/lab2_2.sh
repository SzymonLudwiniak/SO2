#!/bin/bash -eu

DIRECTORY=${1}

for NAME in $(ls ${DIRECTORY})
do
    if [[ -d ${DIRECTORY}/${NAME} ]]; then
        continue
    fi

    TEMP=${NAME#*.}
    TAIL="bak"

    if [[ -z ${TEMP} ]]; then
        continue
    fi

    if [[ ${TEMP} = ${TAIL} ]]; then
        if [[ -f ${DIRECTORY}/${NAME} ]]; then
            chmod -w ${DIRECTORY}/${NAME}
        elif [[ -d ${DIRECTORY}/${NAME} ]]; then
            chmod o-r ${DIRECTORY}/${NAME}
        fi
    fi
done

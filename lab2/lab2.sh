#!/bin/bash -eu

PATH1=${1:-}
PATH2=${2:-}

if [[ ! -d ${PATH1} || ! -d ${PATH2} ]]; then
    echo "bledna sciezka"
    exit 2
fi

NAMES=$(ls ${PATH1})
for NAME in ${NAMES}
do
    if [[ -L ${PATH1}/${NAME} ]]; then
        echo "${NAME} to dowiazanie symboliczne"
    elif [[ -d ${PATH1}/${NAME} ]]; then
        echo "${NAME} to katalog"
        TEMP="${NAME^^}"
        ln -s ../${PATH1}/${NAME} ./${PATH2}/${TEMP}_ln  
    elif [[ -f ${PATH1}/${NAME} ]]; then
        echo "${NAME} to plik regularny"
        TEMP="${NAME%.*}."
        TEMP="${TEMP^^}"
        TEMP="${TEMP/./_ln.}"
        TEMP="${TEMP}${NAME#*.}"
        ln -s ../${PATH1}/${NAME} ./${PATH2}/${TEMP}  
    fi
done

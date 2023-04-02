#!/bin/bash

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

if [[ ! -d ${TARGET_DIR} ]]; then
    mkdir ${TARGET_DIR}
fi

TO_DELETE=$(cat ${RM_LIST})
for NAME in ${TO_DELETE}
do
    if [[ -f ${SOURCE_DIR}/${NAME} ]]; then
        rm ${SOURCE_DIR}/${NAME}
    fi
done

TO_DELETE=$(ls ${SOURCE_DIR})
for NAME in ${TO_DELETE}
do
    if [[ -f ${SOURCE_DIR}/${NAME} ]]; then
        mv ${SOURCE_DIR}/${NAME} ${TARGET_DIR}/${NAME}
    elif [[ -d ${SOURCE_DIR}/${NAME} ]]; then
        cp -r ${SOURCE_DIR}/${NAME} ${TARGET_DIR}/${NAME}
    fi
done

FILE_COUNT=$(ls ${SOURCE_DIR} | wc -l)

echo "zostaly jeszcze jakies pliki"

if [[ ${FILE_COUNT} -ge 2 ]]; then
    echo "zostaly conajmniej dwa pliki"
fi

if [[ ${FILE_COUNT} -gt 4 ]]; then
    echo "zostalo wiecej niz 4 pliki"
fi

if [[ ${FILE_COUNT} -le 4 || ${FILE_COUNT} -ge 2 ]]; then
    echo "skibi di ba ba pam"
fi

if [[ ${FILE_COUNT} -eq 0 ]]; then
    echo "co sie stalo sie ten rap to poklosie"
fi

DATE=$(date +'%Y-%m-%d')
zip -q bakap_${DATE} ${TARGET_DIR} 


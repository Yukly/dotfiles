#!/bin/bash

function BEGIN(){
    T=$(date "+%H%M%S%2N")
    H=${T:0:2}
    M=${T:2:2}
    S=${T:4:2}
    N=${T:6:2}
}

function END(){
    T1=$(date "+%H%M%S%2N")
    H1=${T1:0:2}
    M1=${T1:2:2}
    S1=${T1:4:2}
    N1=${T1:6:2}
#終了時間の計算
    H2=`expr ${H1} - ${H}`

    M2=`expr ${M1} - ${M}`
    if [ ${M2} -lt 0 ]; then
        H2=`expr ${H2} - 1`
    fi
    if [ ${M2} -lt 0 ]; then
        M2=`expr ${M2} + 60`
    fi

    S2=`expr ${S1} - ${S}`
    if [ ${S2} -lt 0 ]; then
        M2=`expr ${M2} - 1`
    fi
    if [ ${S2} -lt 0 ]; then
        S2=`expr ${S2} + 60`
    fi

    N2=`expr ${N1} - ${N}`
    if [ ${N2} -lt 0 ]; then
        S2=`expr ${S2} - 1`
    fi
    if [ ${N2} -lt 0 ]; then
        N2=`expr ${N2} + 100`
    fi
#強制二桁表示
    if [ ${N2} -lt 10 ]; then
        N2=0${N2}
    fi

    DPS=`expr ${H2} \* 3600 + ${M2} \* 60 + ${S2}`
    DPS2=${DPS}.${N2}
}

function PRINT(){
    echo -- Time : ${DPS2}s --
}

clear
tempfile=$(date "+%Y%H%M%S")
g++ -o ${tempfile}.exe ${1} -std=c++14 -I/opt/local/include

BEGIN

./${tempfile}.exe < ~/Desktop/programing/input.txt

rm ${tempfile}.exe

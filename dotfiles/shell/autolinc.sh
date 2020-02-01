#!/bin/bash
a=$1
b=$2
perl autolinc.pl answers.json c1 G${a}/${b}/IL
perl autolinc.pl answers.json c1 G${a}/${b}/QR
perl autolinc.pl answers.json c1 G${a}/${b}/SC
perl autolinc.pl answers.json c1 G${a}/${b}/ST
perl autolinc.pl answers.json c1 G${a}/${b}/RC
perl autolinc.pl answers.json c1 G${a}/${b}/SI
perl autolinc.pl answers.json c1 G${a}/${b}/ER
perl autolinc.pl answers.json c1 G${a}/${b}/IS

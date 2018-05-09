#!/bin/sh

NAMEARRAY=(s,s,a,h,n,b,u,k,m,h)
NAMEARRAY[0]="SITU"
NAMEARRAY[1]="SNUT"
NAMEARRAY[2]="ARI"
NAMEARRAY[3]="HRE"
NAMEARRAY[4]="NKN"
NAMEARRAY[5]="BKI"
NAMEARRAY[6]="USI"
NAMEARRAY[7]="KWSM"
NAMEARRAY[8]="MKB"
NAMEARRAY[9]="HSYK"

NUMARRAY=()
for var in {0..9};
do
  NUMARRAY=("${NUMARRAY[@]}" 0)
done

SelectRandomName(){
  num=$(expr $RANDOM % 10)
  NUMARRAY[$num]=$(((NUMARRAY[$num]) + 1))
  echo ${NAMEARRAY[$num]}
}

ShowList(){
  for var in {0..9};
  do
    name=${NAMEARRAY[$var]}
    num=${NUMARRAY[$var]}
    echo $name : $num 
  done
}

if [ $# -gt 0 ];
then
  i=0
  n=$(($1))
  while [ $i -lt $n ] 
  do
    SelectRandomName
    i=`expr $i + 1`
  done
  ShowList
elif [ $# -eq 0 ];
then
  SelectRandomName
fi

#!/bin/sh

NAMEARRAY=(saito,sunouchi,arai,horie,nakano,bekki,usui,kawashima,makabe,hisayuki)
NAMEARRAY[0]="斎藤"
NAMEARRAY[1]="簾内"
NAMEARRAY[2]="荒井"
NAMEARRAY[3]="堀江"
NAMEARRAY[4]="中野"
NAMEARRAY[5]="戸次"
NAMEARRAY[6]="薄井"
NAMEARRAY[7]="川島"
NAMEARRAY[8]="真壁"
NAMEARRAY[9]="久行"

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

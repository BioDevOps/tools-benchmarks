#!/bin/sh

if [ $# -ne 3 ]; then
        echo "Invalid argument. (require software, templatePath, outputDir)" 1>&2
        exit 1
fi

#Template
TEMPLATE=$2
OUTDIR=$3
SOFT=$1

echo "***** [$0] start " `date +'%Y/%m/%d %H:%M:%S'` " *****"
echo ""

Sample=()
while read line
do
Sample=(${Sample[@]} ${line})
echo ${line}
done <./samplelist.txt

# ファイル数
count=${#Sample[@]}

for((i=0;i<$count;i++))
do
        call=`expr $i + 1`
        echo""
        echo "$call / $count of sample files (Name : ${Sample[$i]})"
        echo make shell script tmp_${Sample[$i]}.sh start...
        sed -e "s/XXXXX/${Sample[$i]}/g" "$TEMPLATE" > tmp_${Sample[$i]}_${SOFT}.sh
        chmod +x tmp_${Sample[$i]}_${SOFT}.sh
        sh tmp_${Sample[$i]}_${SOFT}.sh $OUTDIR
done

echo ""
echo "***** [$0] end " `date +'%Y/%m/%d %H:%M:%S'` " *****"

#!/usr/bin/env bash

# ע�⻻�з�����ΪLF

if [ -n "$1" ]; then
    dateStart=$1
else
    dateStart=$(date -d"-1 day" +"%Y-%m-%d")
fi

if [ -n "$2" ]; then
    dateEnd=$2
else
    dateEnd=$(date -d"-1 day" +"%Y-%m-%d")
fi

date=${dateStart}
dateList=""
while [ $(date -d"$date" +"%Y%m%d") -le $(date -d"$dateEnd" +"%Y%m%d") ];
do
    dateList="${dateList} ${date}"
    date=$(date -d"+1 day $date" +"%Y-%m-%d")
done
dateList="${dateList}"

for dt in ${dateList}
do
    echo ${dt}
#    echo "/opt/app/php/bin/php /opt/case/stock/PersistTransToMysql.php ${dt}"
#    /opt/app/php/bin/php /opt/case/stock/PersistTransToMysql.php ${dt}
    # ����ѹ������
    cd /opt/data/stock/ && tar -cjf /opt/data/stock.${dt}.tar.bz2 ${dt}/*

    # ɾ��ԭ�ļ�
#    cd /opt/data/stock/ && rm -rf /opt/data/stock/${dt}
done

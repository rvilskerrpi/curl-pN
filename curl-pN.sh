#!/bin/bash
#by rvilker@synamedia.com
#trap read debug
#set -x

tmpFile=`echo "$(basename $0 .sh)"`
if [ $# -ne 2 ]
then
    echo "Syntax: $0 file-with-urls num-of-parallel-curls"
        echo "Example: $0 curl-pN.sh URLs_PerLine_List.dat 100";
    exit
fi



URL_DAT_FILE=$1
P_RUN=$2

echo "http_code, size_request, size_upload, time_namelookup, time_connect, time_appconnect, time_pretransfer, time_redirect, time_starttransfer, time_total"
cat $URL_DAT_FILE | xargs -L1 -P$P_RUN curl -o /dev/null -s -w "%{http_code}, %{size_request}, %{size_upload}, %{time_namelookup}, %{time_connect}, %{time_appconnect}, %{time_pretransfer}, %{time_redirect}, %{time_starttransfer}, %{time_total}, %{url_effective}\n"

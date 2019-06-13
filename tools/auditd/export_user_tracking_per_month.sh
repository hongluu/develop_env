#!/bin/bash

#Current date time
CURRENT_DATE=`date +"%Y%m%d"`

#Create folder to store
rm -rf ${CURRENT_DATE}
mkdir ${CURRENT_DATE}
cd ${CURRENT_DATE}

#Export authentication log per month
sudo ausearch -m USER_AUTH -ts this-month --format default > ${CURRENT_DATE}_audit_auth.txt

#Export detail log per month
sudo ausearch  -m USER_CMD -ts this-month --format csv > ${CURRENT_DATE}_audit_detail.csv
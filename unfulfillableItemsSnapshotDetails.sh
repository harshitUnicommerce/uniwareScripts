TenantCode=$1
DetailsDated=$2
Summary=$3
Recipient=$4
python3 unfulfillableItemsSnapshotDetails.py "$TenantCode" "$DetailsDated" "$Summary"

# yesterday_date=$(date -d "$DetailsDated" +'%d-%b-%Y')

# echo ${yesterday_date}

temp=/tmp/uf-soiDetails-
temp+=${DetailsDated}
temp+='.csv'

echo ${temp}

ls ${temp}

reportFilename=`ls ${temp}`
echo "Report file: ${reportFilename}"

# MAIL_RECIPIENTS="sourabh.shrivastava@unicommerce.com,dixit.garg@unicommerce.com,ankur.pratik@unicommerce.com,ankit.jain03@unicommerce.com,bhupi@unicommerce.com,kapil@unicommerce.com,prateek.mahajan@unicommerce.com,adarsh.bajpai@unicommerce.com,rakshit.jain@unicommerce.com,oncall@unicommerce.com"

MAIL_RECIPIENTS="sourabh.shrivastava@unicommerce.com,"
MAIL_RECIPIENTS+=$4

echo ${MAIL_RECIPIENTS}

MAIL_SUBJECT="UF SOI Details | ${TenantCode} | ${DetailsDated}"
MAIL_CONTENT="Please find the attachment. Report prepared by alpha team"

echo ${MAIL_CONTENT} | mutt -s "${MAIL_SUBJECT}" -a "${reportFilename}" -- "${MAIL_RECIPIENTS}"




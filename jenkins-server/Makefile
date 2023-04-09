SHELL:=/bin/sh
REGION=us-east-1
BUCKET=sysmon-app-bucket

create-bucket:
	aws s3api create-bucket --bucket $(BUCKET)

init: create-bucket
	terraform init
	terraform import 'aws_s3_bucket.sysmon_tfstate_bucket' $(BUCKET)

plan:
	terraform plan -out=sysmon.tfplan

apply:
	terraform apply sysmon.tfplan

delete-bucket:
	aws s3api delete-objects --bucket ${BUCKET} --delete "$$(aws s3api list-object-versions --bucket "${BUCKET}" --output=json --query='{Objects: Versions[].{Key:Key,VersionId:VersionId}}')"
	aws s3 rb s3://${BUCKET}

destroy:
	terraform state rm 'aws_s3_bucket.sysmon_tfstate_bucket'
	terraform plan -destroy -out=sysmon.tfdestroy
	terraform apply sysmon.tfdestroy

clean: destroy delete-bucket
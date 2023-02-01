#!/bin/bash
/bin/bash remove_ssh_keys.sh 
/usr/bin/terraform destroy -auto-approve
/usr/bin/terraform apply -auto-approve

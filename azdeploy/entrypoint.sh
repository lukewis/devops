#!/bin/sh

./config.sh --deploymentgroup --deploymentgroupname "Default" --unattended --acceptteeeula --agent $HOSTNAME --url https://dev.azure.com/figtreesoftware/ --work _work --projectname 'Base' --addDeploymentGroupTags --deploymentGroupTags "k8s" --auth PAT --token $AZPAT; ./run.sh;
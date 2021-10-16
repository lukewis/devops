#!/bin/sh

./config.sh --unattended --acceptteeeula --pool $AZPOOL --agent $AZHOST --url $AZURL --work _work --projectname $AZPROJECT --auth PAT --token $AZPAT; ./run.sh;
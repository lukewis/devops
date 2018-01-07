docker run \
  --rm \
  --name vsts \
  -e VSTS_ACCOUNT=figtreesoftware \
  -e VSTS_TOKEN_FILE=/var/vsts/token \
  -e VSTS_AGENT='WIKIDEBIAN' \
  -e VSTS_POOL=Pittsburgh \
  -e VSTS_WORK='/var/vsts/$VSTS_AGENT' \
  -v /var/vsts:/var/vsts \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -d microsoft/vsts-agent:ubuntu-16.04-docker-17.06.0-ce

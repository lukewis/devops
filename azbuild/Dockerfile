FROM debian:bullseye
WORKDIR /azagent
RUN apt update && apt install -y \
    curl \
    nano \
    git
COPY ./entrypoint.sh .
COPY ./setup.sh .
# The setup script needs to be run as root
RUN ./setup.sh
# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-dotnet-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" azuser && chown -R azuser /azagent
# The configure script canNOT be run as root
USER azuser
ENTRYPOINT [ "./entrypoint.sh" ]

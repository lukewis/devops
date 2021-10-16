FROM debian:bullseye
WORKDIR /azagent
RUN apt update && apt install -y \
    # build tools
    nano \
    git \
    # docker pre-reqs
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
COPY ./entrypoint.sh .
COPY ./setup.sh .
# The setup script needs to be run as root
RUN ./setup.sh
# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-dotnet-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" azuser \
    # change ownership of all files we've copied thus far
    && chown -R azuser /azagent \
    # grant user permission to execute docker commands
    && usermod -aG docker azuser
# The entrypoint script canNOT be run as root
USER azuser
ENTRYPOINT [ "./entrypoint.sh" ]

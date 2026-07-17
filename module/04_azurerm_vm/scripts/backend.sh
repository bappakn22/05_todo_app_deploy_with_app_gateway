#!/bin/bash

apt-get update && apt-get install -y curl gnupg2 unixodbc unixodbc-dev

curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/debian/12/prod bookworm main" \
    > /etc/apt/sources.list.d/mssql-release.list

apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql18

apt install python3-pip -y
cd /home/devopsadmin
git clone https://github.com/devopsinsiders/PyTodoBackendMonolith.git
cd PyTodoBackendMonolith
pip install -r requirements.txt

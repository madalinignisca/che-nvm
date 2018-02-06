# Copyright (c) 2017 Madalin Ignisca
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Eclipse Public License v1.0
# which accompanies this distribution, and is available at
# http://www.eclipse.org/legal/epl-v10.html
# Contributors:
# Madalin Ignisca - custom NodeJS with NVM Docker image
# Codenvy, S.A. - initial API and implementation

FROM eclipse/stack-base:ubuntu

ENV NVM_DIR="$HOME/.nvm"

# Fix for the failure of the parent image used
RUN sudo /usr/bin/ssh-keygen -A; \
  sudo chown user:user /projects

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

# Install latest LTS
RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"; \
    nvm install --lts

EXPOSE 1337 3000 4200 5000 9000 8003
LABEL che:server:3000:ref=node-3000 che:server:3000:protocol=http che:server:9000:ref=node-9000 che:server:9000:protocol=http

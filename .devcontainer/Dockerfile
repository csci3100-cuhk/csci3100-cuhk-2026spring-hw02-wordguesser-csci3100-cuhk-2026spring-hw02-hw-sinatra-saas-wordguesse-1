# Use the official Microsoft Ruby image
FROM mcr.microsoft.com/vscode/devcontainers/ruby:3

# Install dependencies for Rails, SQLite3, and Capybara/Cucumber
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
       build-essential \
       libsqlite3-dev \
       nodejs \
       npm \
       chromium-driver

# Install the Bundler version used in most ESaaS CHIPS
RUN gem install bundler:2.3.7

# [Optional] Set the default working directory
WORKDIR /workspace

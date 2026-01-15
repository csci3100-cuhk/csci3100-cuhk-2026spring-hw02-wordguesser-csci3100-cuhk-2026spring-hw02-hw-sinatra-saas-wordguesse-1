# Use the official Microsoft Ruby image
FROM mcr.microsoft.com/vscode/devcontainers/ruby:3

# Install system dependencies for building gems and running tests
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
        && apt-get -y install --no-install-recommends \
             build-essential \
             libsqlite3-dev \
             nodejs \
             npm \
             chromium-driver \
        && rm -rf /var/lib/apt/lists/*

# Install the Bundler version used in most ESaaS CHIPS
RUN gem install bundler:2.3.7

# Prepare workspace and install Ruby gems at image build time so students
# do not need sudo inside the container to install system or Ruby deps.
RUN mkdir -p /workspace
WORKDIR /workspace

# Copy only Gemfile(,lock) first to take advantage of Docker layer caching
COPY Gemfile Gemfile.lock* /workspace/

# Install gems into the project-local folder to avoid writing system gems
RUN bundle config set path 'vendor/bundle' \
    && bundle install --jobs 4 --retry 3

# Ensure the vscode user owns the workspace and switch to it
RUN chown -R vscode:vscode /workspace
USER vscode

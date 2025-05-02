# Use slim Python base image
FROM python:3.10-slim

# Labels
LABEL org.opencontainers.image.source="https://github.com/Richard-Barrett/repo_migrator"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.description="CLI tool for GitHub repo remote migration and config updates"
LABEL org.opencontainers.image.authors="Richard Barrett"

# Set working directory
WORKDIR /app

# Install system packages required by Git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Copy only essential files
COPY . .

# Install project dependencies
RUN pip install --no-cache-dir .

# Default command: show help
ENTRYPOINT ["python", "migrate_github_repos.py"]
CMD ["--help"]

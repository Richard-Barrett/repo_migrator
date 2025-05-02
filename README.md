# GitHub Repo Migrator

A cross-platform CLI tool to find all GitHub repositories on your machine, update global Git configuration, and rewrite GitHub remotes.

## 🔧 Installation

```bash
make install
```

## 🚀 Usage

List all GitHub repositories:
```bash
python migrate_github_repos.py --list-repositories
```

Update remotes and global Git config:
```bash
python migrate_github_repos.py --new-github-username yourname --new-email you@example.com
```

Dry run mode:
```bash
python migrate_github_repos.py --new-github-username yourname --new-email you@example.com --dry-run
```

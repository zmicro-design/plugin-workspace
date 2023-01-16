# Workspace - Development Workspace

[![Release](https://img.shields.io/github/tag/zmicro-design/plugin-workspace.svg?label=Release)](https://github.com/zmicro-design/plugin-workspace/tags)
[![Build Status](https://github.com/zmicro-design/plugin-workspace/actions/workflows/test.yml/badge.svg?branch=master)](https://github.com/zmicro-design/plugin-workspace/actions/workflows/test.yml)
[![GitHub issues](https://img.shields.io/github/issues/zmicro-design/plugin-workspace.svg)](https://github.com/zmicro-design/plugin-workspace/issues)


## Installation

```bash
# CURL
curl -o- https://raw.githubusercontent.com/zmicro-design/plugin-workspace/master/install | bash

# WGET
wget -qO- https://raw.githubusercontent.com/zmicro-design/plugin-workspace/master/install | bash
```

## Usage

```markdown
Workspace (v1.5.3)

Development Workspace

Usage: workspace <command> [args...]

Commands:
  本地开发环境:
  env 
      setup <role>      - Setup development environment by role
            nodejs | go | deno | rust | python | all

      initialize <role> - Alias of setup
      upgrade           - Upgrade development environment

  沙盒服务环境:
  create [workspace] [company] [port]    - Create a workspace service
  start [workspace]                      - Start a workspace service
  stop [workspace]                       - Stop a workspace service
  status [workspace]                     - View a workspace service status
  exec [workspace]                       - Enter a workspace service shell
  upgrade [workspace]                    - Upgrade a workspace service
  ls                                     - List all workspaces

  SSH KEY:
  ssh_key 
    add <workspace>                      - Add ssh key to a workspace service
    generate <workspace>                 - Generate ssh key to a workspace service
    show <workspace>                     - Show the ssh key of a workspace service

  系统相关
  info                - Show system info
  update              - Update CLI
  version             - Show version
  help                - Show help
```

## License
ZMicro Design is released under the [MIT License](./LICENSE).

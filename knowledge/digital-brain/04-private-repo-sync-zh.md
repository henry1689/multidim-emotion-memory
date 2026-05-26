# 数字大脑私有仓同步方案 v0.1

## 目标

为数字大脑项目建立一套同时覆盖本地仓和 GitHub 私有仓的同步基线，满足以下要求：

- 本地工作区持续可用
- GitHub 私有仓可作为异地备份与多 agent 协作入口
- 同步范围可控，避免把本地运行噪音和敏感痕迹直接推送到远端
- 在未完成远端推送前，也能先做本地 bundle 级备份

## 同步拓扑

推荐采用三层：

1. 本地工作仓
2. GitHub 私有仓 `origin`
3. 本地 bundle 备份

说明：

- 本地工作仓用于日常修改
- GitHub 私有仓用于异地备份、历史版本和多 agent 共享
- 本地 bundle 备份用于在远端不可用或误操作时兜底

## 同步边界

应优先纳入同步：

- `README.md`
- `AGENTS.md`
- `knowledge/`
- `memory/`
- `docs/`
- `scripts/`
- 项目配置与稳定模板

默认不应直接纳入同步：

- `tmp/`
- `.claude/`
- `.claudecontext/`
- `.codex/`
- `.ops/`
- `.tmp/`
- `__pycache__/`
- 各类运行时缓存和临时备份

## 建议工作流

### 第一步：预检

运行：

```bash
./scripts/git-sync-preflight.sh
```

检查：

- 当前分支
- 当前远端
- GitHub 认证状态
- 本地修改数量
- 未跟踪文件数量

### 第二步：本地 bundle 备份

运行：

```bash
./scripts/git-bundle-backup.sh
```

作用：

- 为当前所有 refs 生成一个可恢复 bundle
- 在 GitHub 私有仓尚未配置前先保留一份本地兜底

### 第三步：创建 GitHub 私有仓并绑定 `origin`

当前环境中 `gh` 尚未登录，因此这一步需要先完成 GitHub CLI 认证，或由用户提供可用远端地址。

完成认证后建议运行：

```bash
./scripts/github-create-private-origin.sh <owner>/<repo>
```

### 第四步：提交并推送

在同步范围确认后：

```bash
git add <curated-scope>
git commit -m "<message>"
git push -u origin <branch>
```

## 多 agent 协作建议

- 所有稳定架构文档和任务台账放 `knowledge/` 与 `memory/`
- 远端协作以任务编号为主，而不是自由命名
- 每次重大方案变更都更新：
  - `memory/session-handoff.md`
  - `memory/digital-brain-project-board.md`

## 当前限制

- 当前仓库尚未配置远端
- 当前 `gh` 未登录，无法直接创建 GitHub 私有仓
- 当前工作树包含大量未跟踪文件，首次推送前必须人工确认同步范围

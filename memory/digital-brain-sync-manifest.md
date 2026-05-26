# 数字大脑同步清单

## 目标

只把“数字大脑 / 多维情感知识库”项目相关内容同步到独立 GitHub 私有仓，避免把当前运维工作区的其它主机资料、临时文件和运行痕迹一并推出去。

## 建议纳入同步

- 项目专用根 `README.md`
- 项目专用根 `AGENTS.md`
- `knowledge/digital-brain/`
- `memory/digital-brain-project-board.md`
- `memory/emotion-multidimensional-kb.md`
- `memory/session-handoff.md`
- 后续新增的项目专用前端代码目录
- 后续新增的项目专用脚本目录

## 默认不同步

- `tmp/`
- `.claude/`
- `.claudecontext/`
- `.codex/`
- `.ops/`
- `.tmp/`
- 其它与本项目无关的运维记忆和主机资料

## 备注

- 同步仓不直接复用 `codex-ops` 根 `README.md` 与 `AGENTS.md`，而是生成数字大脑项目专用根文件，避免运维仓语义污染。
- 当前 `memory/session-handoff.md` 仍包含工作区级连续性内容；如果后续需要更干净的项目仓，可以把数字大脑项目的连续性拆到独立 handoff 文件。
- 若后续新增项目代码，建议放到独立顶层目录，例如：
  - `apps/digital-brain-demo/`
  - `scripts/digital-brain/`

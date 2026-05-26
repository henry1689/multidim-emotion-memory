# Hermes 多 Agent 分包协议 v0.1

## 1. 文档目的

本文件定义数字大脑项目在多 agent 协作场景下的角色分工、任务包格式、交付要求、分支约定和冲突处理规则。

本协议用于支持以下协作链：

- 主架构师 / 主控 agent
- Hermes 作为总调度 agent
- Codex / OpenClaw / Claude Code 等执行 agent

## 2. 协作目标

本协议的目标不是“让多个 agent 同时乱做”，而是：

- 保持主线架构统一
- 允许分线并行执行
- 让每个 agent 有明确边界
- 让所有产出都能回到任务编号和验收标准

## 3. 角色分工

### 3.1 主控 agent

职责：

- 冻结总架构与上位原则
- 冻结对象模型与关键规范
- 生成任务包
- 审核分线产出
- 合并回主线

典型任务：

- `DB-Axx`
- `DB-Mxx`
- 高影响的 `DB-Rxx`

### 3.2 Hermes 总调度 agent

职责：

- 读取项目台账
- 选择可分发任务
- 将任务包分发给合适的执行 agent
- 跟踪状态、风险与阻塞
- 汇总回传结果

Hermes 不应自行改写上位架构定义，除非收到主控 agent 明确授权。

### 3.3 执行 agent

职责：

- 按任务包实现指定模块
- 只在授权范围内修改文件
- 按固定格式回传结果、风险和未决项

适用 agent：

- Codex
- OpenClaw
- Claude Code
- 其它兼容代理

## 4. 任务分类

### 4.1 A 类任务：主线冻结类

特点：

- 影响全局边界
- 影响对象模型
- 影响多个模块

规则：

- 只能由主控 agent 执行或批准后执行

示例：

- `DB-A01`
- `DB-M01`
- `DB-M02`

### 4.2 B 类任务：模块实现类

特点：

- 边界已明确
- 可并行推进

规则：

- 由 Hermes 分发给执行 agent

示例：

- `DB-U01`
- `DB-U02`
- `DB-G01`
- `DB-K03`

### 4.3 C 类任务：整理与支持类

特点：

- 风险较低
- 主要是文档、样例、测试、整理

规则：

- 可优先外包给执行 agent

示例：

- fixtures 整理
- 测试清单补充
- 交互说明整理

## 5. 任务包标准格式

每个任务包必须包含以下字段。

### 5.1 基础头

```text
Task ID:
Task Name:
Task Type:
Owner Agent:
Reviewer:
```

### 5.2 目标

```text
Goal:
- 本任务要解决什么问题
- 本任务完成后的可见结果是什么
```

### 5.3 输入材料

```text
Required Reading:
- 必读文档
- 必读文件

Reference Files:
- 参考但可选读的文件
```

### 5.4 边界

```text
Must Not Change:
- 不允许修改的对象
- 不允许改写的定义

Allowed Scope:
- 允许修改的文件和目录
```

### 5.5 产出物

```text
Deliverables:
- 必须新增或修改的文档
- 必须新增或修改的代码
- 必须回填的台账
```

### 5.6 验收标准

```text
Acceptance Criteria:
- 完成判断条件
- 不可接受行为
```

### 5.7 回传格式

```text
Return Format:
1. Completed
2. Not Completed
3. Risks
4. Open Questions
5. Files Changed
```

## 6. 分支约定

每个分线任务使用单独分支。

格式：

```text
db-<task-id-lower>-<short-name>
```

示例：

- `db-u01-demo-layout`
- `db-g01-graph-model`
- `db-k03-offline-priming`

规则：

- 一个任务包对应一个分支
- 不允许多个任务长期混在同一分支

## 7. 文件写回规则

所有 agent 交付后必须写回：

- `memory/digital-brain-project-board.md`

如涉及重要连续性变化，还必须写回：

- `memory/session-handoff.md`

如涉及可复用设计变化，还必须更新：

- `knowledge/digital-brain/`

## 8. 冲突处理

### 8.1 定义冲突

若执行 agent 的实现与上位文档冲突：

- 不直接提交主线
- 先标记为 `definition-conflict`
- 由 Hermes 提交给主控 agent 审核

### 8.2 文件冲突

若多个 agent 同时改同一核心文件：

- Hermes 暂停后续合并
- 先做差异梳理
- 再决定谁保留、谁重做

### 8.3 验收冲突

若任务“看似完成”但不满足验收条件：

- 状态标记为 `needs-rework`
- 不进入主线完成态

## 9. 状态枚举

建议 Hermes 在台账中使用以下状态：

- `pending`
- `assigned`
- `in_progress`
- `review_required`
- `needs_rework`
- `completed`
- `blocked`

## 10. Hermes 调度流程

标准流程：

1. 读取项目台账
2. 选择可并行任务
3. 为每个任务生成任务包
4. 分发给执行 agent
5. 收集回传
6. 做一轮结构检查
7. 提交给主控 agent review
8. 更新台账与连续性文件

## 11. 第一批建议分包任务

在当前阶段，建议 Hermes 只分发以下任务：

- `DB-U01` Demo 单页框架
- `DB-U02` 样例数据与示例剧本
- `DB-G01` 图谱模型
- `DB-K03` 离线脑补

暂不建议分发：

- `DB-M02`
- `MemoryEpisode`
- `EpisodeFingerprint`

这些仍应由主控 agent 继续冻结。

## 12. 任务包模板

```text
Task ID: DB-U01
Task Name: Demo 单页框架
Task Type: B
Owner Agent: <to assign>
Reviewer: Hermes / Main Controller

Goal:
- 建立数字大脑 demo 的单页多面板信息架构

Required Reading:
- knowledge/digital-brain/01-overall-architecture-zh.md
- knowledge/digital-brain/05-cognitive-collaborator-principles-zh.md
- knowledge/digital-brain/03-task-breakdown-zh.md

Must Not Change:
- 九维正式名单
- Cue / Signal / Interpretation 定义
- 双脑补架构定义

Allowed Scope:
- 前端页面结构文档
- demo 布局代码
- 样式文件

Deliverables:
- 页面组件树
- 面板职责文档
- 初版布局实现

Acceptance Criteria:
- 六大面板职责清楚
- 不引入与上位文档冲突的新对象定义
- 页面结构可支持后续联动

Return Format:
1. Completed
2. Not Completed
3. Risks
4. Open Questions
5. Files Changed
```

## 13. 成功标准

本协议成功的标准：

- Hermes 可以直接拿它分发任务
- 执行 agent 不需要二次理解项目哲学就能开工
- 任务回传可审查、可追责、可回主线
- 多 agent 协作不会把主线定义冲散

# Hermes 第一批任务包 v0.1

## 1. 说明

本文件为 Hermes 准备第一批可直接分发的任务包实例。

前提：

- `DB-A01` 已完成
- `DB-M01` 已完成
- `DB-M02` 已完成

本批任务只覆盖边界已较稳定、适合并行推进的模块。

## 2. 任务包列表

- `PACKET-DB-U01`
- `PACKET-DB-U02`
- `PACKET-DB-G01`
- `PACKET-DB-K03`

## 3. PACKET-DB-U01

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
- knowledge/digital-brain/06-cue-signal-interpretation-zh.md
- knowledge/digital-brain/08-nine-dimension-spec-zh.md
- knowledge/digital-brain/03-task-breakdown-zh.md

Must Not Change:
- 九维正式名单
- Cue / Signal / Interpretation 定义
- DimensionTag 结构
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

## 4. PACKET-DB-U02

```text
Task ID: DB-U02
Task Name: 样例数据与示例剧本
Task Type: B
Owner Agent: <to assign>
Reviewer: Hermes / Main Controller

Goal:
- 准备最小样例集，覆盖会议、亲密关系、公共对象脑补三类场景

Required Reading:
- knowledge/digital-brain/01-overall-architecture-zh.md
- knowledge/digital-brain/06-cue-signal-interpretation-zh.md
- knowledge/digital-brain/08-nine-dimension-spec-zh.md

Must Not Change:
- 上位对象定义
- 九维字段结构

Allowed Scope:
- fixtures
- 示例文本
- 示例 JSON
- 示例场景说明文档

Deliverables:
- 最少 3 套样例场景
- 每套场景的原始文本、预期 cue/signal/interpretation、预期九维结果

Acceptance Criteria:
- 样例可直接用于前端和测试
- 每套样例都能回到原始文本

Return Format:
1. Completed
2. Not Completed
3. Risks
4. Open Questions
5. Files Changed
```

## 5. PACKET-DB-G01

```text
Task ID: DB-G01
Task Name: 图谱模型
Task Type: B
Owner Agent: <to assign>
Reviewer: Hermes / Main Controller

Goal:
- 建立数字大脑图谱节点、边、边标签和局部路径模型

Required Reading:
- knowledge/digital-brain/01-overall-architecture-zh.md
- knowledge/digital-brain/06-cue-signal-interpretation-zh.md
- knowledge/digital-brain/08-nine-dimension-spec-zh.md
- knowledge/digital-brain/09-memoryepisode-and-fingerprint-zh.md

Must Not Change:
- MemoryEpisode 核心字段
- 九维定义
- 认知协作者原则

Allowed Scope:
- 图谱模型文档
- 节点/边类型清单
- 图谱查询样例

Deliverables:
- 节点模型
- 边模型
- “边来自哪一维”的标注规则

Acceptance Criteria:
- 支持当前记忆局部图
- 支持相邻记忆连接
- 支持前端可视化落地

Return Format:
1. Completed
2. Not Completed
3. Risks
4. Open Questions
5. Files Changed
```

## 6. PACKET-DB-K03

```text
Task ID: DB-K03
Task Name: 离线脑补
Task Type: B
Owner Agent: <to assign>
Reviewer: Hermes / Main Controller

Goal:
- 设计会话后回看、补块、重算关联和新增版本的离线脑补流程

Required Reading:
- knowledge/digital-brain/01-overall-architecture-zh.md
- knowledge/digital-brain/05-cognitive-collaborator-principles-zh.md
- knowledge/digital-brain/09-memoryepisode-and-fingerprint-zh.md
- knowledge/digital-brain/04-private-repo-sync-zh.md

Must Not Change:
- 原始记录不可覆盖原则
- 高风险推断降级原则

Allowed Scope:
- 离线脑补设计文档
- 版本链流程
- 触发条件与输出清单

Deliverables:
- 离线脑补状态机
- 新增对象与回写规则
- 与在线脑补的边界说明

Acceptance Criteria:
- 离线脑补不会覆盖原始版本
- 所有新增块与关系可追溯

Return Format:
1. Completed
2. Not Completed
3. Risks
4. Open Questions
5. Files Changed
```

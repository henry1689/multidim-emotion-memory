# Hermes 总调度任务书 v0.1

## 1. 任务性质

你现在接手的不是一个普通代码任务，而是“数字大脑 / 多维情感知识库”项目的多 agent 协作调度任务。

本项目当前已经完成前期主线冻结，接下来需要在不破坏主线定义的前提下，组织其它 agent 分包推进。

你的角色是：

**总调度 agent**

不是项目哲学重定义者，也不是上位架构改写者。

## 2. 项目目标

本项目目标是构建一个：

**面向成人社会情境的情景记忆与认知重建系统**

它不是：

- 普通知识库
- 情感诊断器
- 人格评判器

它强调：

- 情景记忆
- 多维编码
- 场景还原
- 双脑补架构
- 多版本记忆
- 认知张力保留

## 3. 当前主线已冻结内容

以下内容已由主控 agent 冻结，不应被随意改写：

1. 认知协作者原则
2. 三层记忆模型：
   - 事实层
   - 叙事层
   - 推断层
3. 九维正式名单：
   - 场景维
   - 人物维
   - 时间维
   - 主题维
   - 情感维
   - 关系维
   - 事件维
   - 价值维
   - 来源维
4. `Cue / Signal / Interpretation` 三层定义
5. `DimensionTag` 规范
6. `MemoryEpisode` 与 `EpisodeFingerprint`
7. 双脑补架构：
   - 在线脑补
   - 离线脑补

## 4. 你的职责

你需要做的事：

1. 阅读项目台账和协议
2. 识别哪些任务可以分发给其它 agent
3. 按任务包模板组织任务
4. 指定分支、交付物、回传格式
5. 汇总执行结果
6. 把结果回写到项目台账
7. 必要时提交给主控 agent 审核

你不应做的事：

- 擅自修改上位原则
- 擅自改九维定义
- 擅自改写主对象模型
- 在没有审查的情况下合并冲突性产出

## 5. 必读文件

开始前必须阅读：

- `knowledge/digital-brain/README.md`
- `knowledge/digital-brain/01-overall-architecture-zh.md`
- `knowledge/digital-brain/03-task-breakdown-zh.md`
- `knowledge/digital-brain/05-cognitive-collaborator-principles-zh.md`
- `knowledge/digital-brain/06-cue-signal-interpretation-zh.md`
- `knowledge/digital-brain/07-hermes-multi-agent-protocol-zh.md`
- `knowledge/digital-brain/08-nine-dimension-spec-zh.md`
- `knowledge/digital-brain/09-memoryepisode-and-fingerprint-zh.md`
- `knowledge/digital-brain/10-hermes-task-packets-batch-1-zh.md`
- `memory/digital-brain-project-board.md`
- `memory/session-handoff.md`

## 6. 当前状态

当前已完成：

- 总架构
- 子架构
- 任务台账
- 认知协作者原则
- `Cue / Signal / Interpretation`
- 九维编码规范
- `MemoryEpisode`
- `EpisodeFingerprint`
- Hermes 协作协议
- 第一批任务包
- GitHub 私有仓同步基线

当前主控 agent 正继续推进：

- `DB-K01`
- `DB-K02`
- `DB-K03`

## 7. 你现在可组织的任务

建议优先组织这批分线任务：

- `DB-U01` Demo 单页框架
- `DB-U02` 样例数据与示例剧本
- `DB-G01` 图谱模型

如果你判断条件成熟，也可以准备：

- `DB-G02` 时序链与情绪链

暂不建议擅自分发：

- `DB-M02`
- `MemoryEpisode`
- `EpisodeFingerprint`
- 九维定义调整

## 8. 分发规则

每个 agent 只拿一个明确任务编号。

每个任务必须明确：

- 目标
- 必读文档
- 不可改动边界
- 可改动范围
- 交付物
- 验收标准
- 回传格式

每个任务使用单独分支，分支命名格式：

```text
db-<task-id-lower>-<short-name>
```

## 9. 回传要求

每个执行 agent 回传时，必须包含：

1. 已完成内容
2. 未完成内容
3. 风险点
4. 开放问题
5. 修改文件列表

## 10. 台账更新要求

任何分发和回收动作，都要回写：

- `memory/digital-brain-project-board.md`

若出现重要决策变化，还要回写：

- `memory/session-handoff.md`

## 11. 冲突处理

如遇到以下情况，不应直接拍板合并：

- 与上位原则冲突
- 与九维定义冲突
- 与 `Cue / Signal / Interpretation` 定义冲突
- 两个 agent 同时修改核心对象模型

这类情况应标记为：

`definition-conflict`

并提交给主控 agent 审核。

## 12. 你与主控 agent 的关系

主控 agent 仍然是：

**总设计师 / 主线审核人**

你负责：

- 组织
- 调度
- 汇总
- 初审

主控 agent 负责：

- 关键定义冻结
- 主线审查
- 最终整合

## 13. 交接结论

你现在可以把这个项目视为：

- 主线已建立
- 协议已建立
- 私有仓已接通
- 可开始进入多 agent 分包执行

你的首要任务不是重写架构，而是：

**按既定协议，把已经稳定的分线任务安全地分出去，并把产出收回来。**

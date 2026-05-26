# MemoryEpisode 与 EpisodeFingerprint 规范 v0.1

## 1. 文档目标

本文件用于冻结数字大脑项目中两个关键对象：

- `MemoryEpisode`
- `EpisodeFingerprint`

这两个对象分别回答：

- `MemoryEpisode`：系统最终保存的一次独立情景记忆长什么样
- `EpisodeFingerprint`：系统如何区分相似经历、支撑模式分离与模式补全

## 2. MemoryEpisode 定义

### 2.1 定义

`MemoryEpisode` 是一段独立、可召回、可版本化、可重建的情景记忆单元。

它不是原始输入，也不是单个标签，而是由碎片、信号、解释、九维和关系综合形成的情景记忆体。

### 2.2 作用

- 作为召回与还原的最小主记忆单元
- 作为图谱中的核心节点
- 作为重固化和版本链的基底对象

### 2.3 与其他对象的关系

- 一个 `Session` 可包含多个 `MemoryEpisode`
- 一个 `MemoryEpisode` 可引用多个：
  - `Utterance`
  - `MicroEvent`
  - `Cue`
  - `Signal`
  - `Interpretation`
  - `DimensionTag`
- 一个 `MemoryEpisode` 可拥有多个 `NarrativeVersion`

## 3. MemoryEpisode 最小字段

```ts
type MemoryEpisode = {
  id: string
  sessionId: string
  title: string
  summary: string
  fingerprintId: string
  primaryParticipants: string[]
  primaryTopics: string[]
  keyEventIds: string[]
  keyEmotionIds: string[]
  keyRelationIds: string[]
  dimensionTagIds: string[]
  startAt?: string
  endAt?: string
  narrativeVersionIds: string[]
  retentionTier: "short" | "mid" | "long" | "permanent"
  lifecycleStatus: "Active" | "Deprecated" | "Archived"
  confidence: number
  sourceRefs: string[]
  createdAt: string
  updatedAt: string
}
```

## 4. MemoryEpisode 字段解释

### 基本标识

- `id`
- `sessionId`
- `title`
- `summary`

说明：

- `title` 用于快速识别
- `summary` 用于展示场景化概括

### 核心索引

- `fingerprintId`
- `primaryParticipants`
- `primaryTopics`

说明：

- 这些字段用于模式分离、召回排序和快速视图

### 核心链路

- `keyEventIds`
- `keyEmotionIds`
- `keyRelationIds`
- `dimensionTagIds`

说明：

- 用于把 episode 接到时序链、情绪链和图谱

### 时间与治理

- `startAt`
- `endAt`
- `retentionTier`
- `lifecycleStatus`
- `confidence`

### 可追溯性

- `sourceRefs`
- `narrativeVersionIds`

## 5. MemoryEpisode 的生成规则

一个 `MemoryEpisode` 成立，至少应满足以下条件：

1. 有明确或可定位的时间片
2. 有至少一个主要参与者
3. 有至少一个关键事件或关键状态变化
4. 有至少一个主题或情绪/关系主轴
5. 可回溯到原始来源

## 6. EpisodeFingerprint 定义

### 6.1 定义

`EpisodeFingerprint` 是对一条 `MemoryEpisode` 的多维组合指纹。

它不是为了向用户展示，而是为了：

- 模式分离
- 候选召回
- 相似事件比较
- 分支判断

### 6.2 作用

- 区分“两次相似但不相同”的经历
- 支撑 `new / append / branch` 判断
- 支撑片段线索下的候选召回

## 7. EpisodeFingerprint 结构

```ts
type EpisodeFingerprint = {
  id: string
  episodeId: string
  sceneVector: string[]
  participantVector: string[]
  timeVector: string[]
  topicVector: string[]
  emotionVector: string[]
  relationVector: string[]
  eventVector: string[]
  valueVector: string[]
  sourceVector: string[]
  uniquenessScore: number
  recencyScore: number
  stabilityScore: number
  distortionRisk: number
  generatedAt: string
}
```

## 8. 指纹九组向量

### 8.1 sceneVector

包含：

- 地点
- 空间类型
- 氛围
- 背景对象

### 8.2 participantVector

包含：

- 主要参与者
- 参与者组合
- 主次角色

### 8.3 timeVector

包含：

- 绝对时间
- 相对时间
- 季节
- 昼夜
- 序列位置

### 8.4 topicVector

包含：

- 主主题
- 子主题
- 关键词簇

### 8.5 emotionVector

包含：

- 主情绪
- 情绪强度
- 情绪轨迹

### 8.6 relationVector

包含：

- 主要关系类型
- 关系变化方向
- 关系强度

### 8.7 eventVector

包含：

- 关键事件链
- 关键触发点
- 关键结果点

### 8.8 valueVector

包含：

- 重要度
- 关系价值
- 情感权重
- 保留层级

### 8.9 sourceVector

包含：

- 来源类型
- 生成方式
- 来源强度
- 可追溯性

## 9. 指纹附加分值

### uniquenessScore

表示该记忆与其它记忆相比的差异性。

用途：

- 差异性越高，越应独立成新 episode

### recencyScore

表示时间新鲜度。

用途：

- 召回排序
- 离线脑补优先级

### stabilityScore

表示该记忆在多次回忆和多次引用中的稳定程度。

用途：

- 判断是否适合升为 long / permanent

### distortionRisk

表示记忆失真风险。

来源包括：

- 时间久远
- 转述过多
- 推断比例高
- 原始证据薄弱

## 10. new / append / branch 规则

### 10.1 new

满足以下情况之一时更偏向新建 episode：

- 参与者组合明显变化
- 时间锚点明显变化
- 关键事件链明显变化
- 情绪轨迹明显变化
- uniquenessScore 高

### 10.2 append

满足以下情况时更偏向追加到原 episode：

- 明显属于同一时间片
- 同一事件仍在延续
- 只是补充细节而非独立经历

### 10.3 branch

满足以下情况时更偏向从旧 episode 分出分支：

- 场景和人物高度相似
- 但关键事件链或关系变化已显著不同

## 11. 示例

### 输入场景

```text
那个夏夜我和女朋友在咖啡厅，我很沮丧，她一直安慰我，还亲了我。店里人很少，放着低沉的萨克斯《回家》。
```

### Episode 标题

- `夏夜咖啡厅安慰片段`

### Episode 摘要

- `在安静的夏夜咖啡厅中，你情绪低落，女朋友持续安慰并发生亲密互动，情绪从沮丧逐渐回落。`

### 指纹摘要

- sceneVector:
  - `咖啡厅`
  - `夏夜`
  - `人少`
  - `萨克斯`
- participantVector:
  - `你`
  - `女朋友`
- emotionVector:
  - `沮丧`
  - `被安抚`
  - `平静`
- relationVector:
  - `support`
  - `intimacy`
  - `closer`
- eventVector:
  - `安慰`
  - `亲吻`

## 12. 对前端的影响

前端建议区分：

- `MemoryEpisode`
  - 用于当前记忆详情页、场景还原、图谱中心节点
- `EpisodeFingerprint`
  - 用于内部排序、比较、分离判断，可选择做摘要可视化

## 13. 验收标准

本阶段完成标准：

- `MemoryEpisode` 字段结构明确
- `EpisodeFingerprint` 字段结构明确
- `new / append / branch` 判断有规则基础
- 前端、图谱、召回模块可引用此文档而不再另起炉灶

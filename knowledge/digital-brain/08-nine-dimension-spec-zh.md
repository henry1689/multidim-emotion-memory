# DB-M02 九维编码规范 v0.1

## 1. 文档目标

本文件用于冻结数字大脑项目的九维编码规范，包括：

- 每一维的定义
- 必填字段
- 推断字段
- 强度分值
- 置信度
- 来源引用规则

本文件是 `DB-M02` 的正式交付物。

## 2. 九维总表

正式九维：

1. 场景维
2. 人物维
3. 时间维
4. 主题维
5. 情感维
6. 关系维
7. 事件维
8. 价值维
9. 来源维

## 3. 通用编码原则

### 3.1 每条维度结果的最小结构

```ts
type DimensionTag = {
  id: string
  sessionId: string
  dimension: string
  label: string
  score: number
  confidence: number
  sourceRefs: string[]
  signalRefs?: string[]
  cueRefs?: string[]
  isInferred: boolean
  note?: string
}
```

### 3.2 通用字段含义

- `score`
  - 表示该维度结果在当前记忆中的显著性、强度或完整度
  - 统一范围：`0.00 ~ 1.00`

- `confidence`
  - 表示系统对该维度结果的把握程度
  - 统一范围：`0.00 ~ 1.00`

- `sourceRefs`
  - 指向事实层或来源层对象
  - 至少应能回到原始文本片段、事件或 primer 引用

- `isInferred`
  - `false` 表示主要来自显式内容
  - `true` 表示主要来自推断

### 3.3 通用评分口径

- `0.00 ~ 0.20`
  - 极弱 / 几乎不存在 / 信息极少
- `0.21 ~ 0.40`
  - 较弱 / 有少量依据
- `0.41 ~ 0.60`
  - 中等 / 信息可感知
- `0.61 ~ 0.80`
  - 较强 / 在当前记忆中较显著
- `0.81 ~ 1.00`
  - 极强 / 高显著 / 高密度 / 高核心性

### 3.4 置信度口径

- `0.00 ~ 0.30`
  - 低置信，仅作候选
- `0.31 ~ 0.60`
  - 中等置信，需要保留替代解释
- `0.61 ~ 0.80`
  - 较高置信，有明确依据链
- `0.81 ~ 1.00`
  - 高置信，依据充分且可回溯

## 4. 场景维

### 定义

描述事件发生时的环境、空间和氛围。

### 必填字段

- `place`
- `spaceType`
- `timeOfDay`

### 推断字段

- `ambience`
- `environmentDensity`
- `backgroundAudio`
- `lighting`
- `weather`

### score 含义

- 场景信息的丰富度和显著度

### 示例

- `咖啡厅 / 夏夜 / 人少 / 萨克斯`

## 5. 人物维

### 定义

描述参与者是谁、各自身份和角色。

### 必填字段

- `participants`
- `participantCount`

### 推断字段

- `genderGuess`
- `roleInScene`
- `mainCharacter`
- `secondaryCharacter`

### score 含义

- 人物信息的清晰度和在记忆中的中心程度

### 示例

- `你 / 女朋友 / 孩子 / 年轻母亲`

## 6. 时间维

### 定义

描述事件发生的时间信息、时间锚点与展开顺序。

### 必填字段

- `absoluteTime` 或 `relativeTime`
- `sequenceIndex`

### 推断字段

- `season`
- `duration`
- `turnIndex`
- `turningPoint`
- `peakMoment`

### score 含义

- 时间信息的可定位程度和时序清晰度

### 示例

- `夏夜 / 晚间 / 亲吻前后形成情绪转折`

## 7. 主题维

### 定义

描述内容围绕什么主题展开。

### 必填字段

- `primaryTopic`

### 推断字段

- `secondaryTopics`
- `keywords`
- `topicShift`
- `similarTopics`

### score 含义

- 主题聚焦度和主题显著程度

### 示例

- `安慰 / 亲密互动 / 家庭怀旧`

## 8. 情感维

### 定义

描述情绪类型、强度和变化。

### 必填字段

- `emotionType`
- `emotionIntensity`

### 推断字段

- `emotionTarget`
- `emotionTrend`
- `emotionStability`
- `comfortSignal`
- `conflictSignal`

### score 含义

- 情绪在当前记忆中的显著强度

### 额外规则

- 情感维的 `score` 优先表示强度
- 情感维的 `confidence` 优先表示推断可靠度

### 示例

- `沮丧 -> 被安抚 -> 平静`

## 9. 关系维

### 定义

描述参与者之间的连接方式、方向、强弱和变化。

### 必填字段

- `subject`
- `object`
- `relationType`

### 推断字段

- `relationStrength`
- `relationPolarity`
- `relationChange`
- `scopeType`

### score 含义

- 当前关系模式在记忆中的显著度和力度

### 示例

- `女朋友 -> 安慰 -> 你`
- `关系变化 -> closer`

## 10. 事件维

### 定义

描述具体发生了什么动作、行为和互动。

### 必填字段

- `eventType`
- `actor`

### 推断字段

- `target`
- `trigger`
- `result`
- `eventImportance`

### score 含义

- 事件在当前记忆中的关键程度和可见性

### 示例

- `安慰`
- `亲吻`
- `摔倒`
- `扶起`

## 11. 价值维

### 定义

描述记忆值不值得保留、调用和长期关注。

### 必填字段

- `importanceScore`
- `retentionTier`

### 推断字段

- `priorityScore`
- `relationshipValueScore`
- `emotionalWeightScore`
- `reuseValueScore`
- `retentionReason`

### score 含义

- 综合价值显著度

### 示例

- `importance: high`
- `retentionTier: permanent`

## 12. 来源维

### 定义

描述信息从哪里来、怎么来的、强不强、能否追溯。

### 必填字段

- `sourceType`
- `generationMode`

### 推断字段

- `sourceActor`
- `identityCertainty`
- `sourceWeight`
- `traceabilityScore`
- `reviewStatus`

### score 含义

- 来源强度和可追溯性综合程度

### 示例

- `sourceType: transcript`
- `generationMode: model_inferred`

## 13. 来源引用规则

### 13.1 最低要求

任何维度标签都必须至少满足以下之一：

- 能回到原始文本片段
- 能回到事件对象
- 能回到 primer / dictionary block
- 能回到人工补录项

### 13.2 推荐引用链

推荐链路：

`DimensionTag -> Interpretation -> Signal -> Cue -> SourceRef`

### 13.3 高风险维度要求

对于以下结果，必须提供 `sourceRefs + signalRefs + uncertaintyNote`：

- 情感维中的高强度判断
- 关系维中的负向或亲密判断
- 价值维中的 permanent 判断

## 14. 显式与推断区分规则

### 显式结果

满足以下情况之一时，可标记为显式：

- 原文直接出现
- 用户手动补录
- 稳定字典块直接支持

### 推断结果

满足以下情况之一时，标记为推断：

- 由多个 signal 聚合而来
- 并非原文直接明说
- 需要结合上下文或历史记忆

## 15. 九维输出示例

```json
[
  {
    "dimension": "emotion",
    "label": "depressed",
    "score": 0.82,
    "confidence": 0.74,
    "sourceRefs": ["UTR-0032"],
    "signalRefs": ["SIG-emo-low-energy"],
    "cueRefs": ["CUE-很沮丧"],
    "isInferred": false
  },
  {
    "dimension": "relation",
    "label": "comforts",
    "score": 0.88,
    "confidence": 0.81,
    "sourceRefs": ["EVT-0011"],
    "signalRefs": ["SIG-support", "SIG-intimacy"],
    "cueRefs": ["CUE-一直安慰我", "CUE-亲了我"],
    "isInferred": true
  }
]
```

## 16. 前端展示约束

前端展示每个维度时，至少应能显示：

- `label`
- `score`
- `confidence`
- `isInferred`
- `sourceRefs` 或依据说明

对于高风险或高强度推断，还应显示：

- `uncertaintyNote`
- `alternatives`

## 17. 验收标准

`DB-M02` 完成的标准：

- 九维每一维都有正式定义
- 每一维都有必填字段与推断字段
- score 与 confidence 有统一口径
- 来源引用规则明确
- 前端与图谱层可直接复用这些定义

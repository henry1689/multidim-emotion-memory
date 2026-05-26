# DB-M01 Cue / Signal / Interpretation 三层定义 v0.1

## 1. 文档目标

本文件用于冻结数字大脑项目中 `Cue`、`Signal`、`Interpretation` 三层对象的边界、关系、示例和禁止混用规则。

这三层是后续九维编码、episode 合成、图谱建模和前端展示的共同基础。

## 2. 总体定位

三层链路回答的是三个不同问题：

- `Cue`：原始输入里出现了什么线索
- `Signal`：这些线索显示出了什么可观测模式
- `Interpretation`：系统据此提出了什么候选解释

一句话：

`Cue` 是线索，`Signal` 是模式，`Interpretation` 是解释。

## 3. Cue 定义

### 3.1 定义

`Cue` 是从原始输入中直接切出的显著线索单元。

它应尽量贴近输入本身，不对意义做过度推断。

### 3.2 作用

- 保留原始触发点
- 作为后续信号提取的输入
- 支持回放、检索和引用

### 3.3 典型来源

- 词语
- 短语
- 命名实体
- 显著动作描述
- 环境词
- 时间词
- 明显修辞或重复表达
- 背景对象提及

### 3.4 示例

输入：

```text
那个夏夜我和女朋友在咖啡厅，我很沮丧，她一直安慰我，还亲了我。店里人很少，放着低沉的萨克斯《回家》。
```

可切出的 `Cue`：

- `夏夜`
- `女朋友`
- `咖啡厅`
- `很沮丧`
- `一直安慰我`
- `亲了我`
- `人很少`
- `低沉的萨克斯`
- `回家`

### 3.5 不应做的事

`Cue` 不应直接写成：

- “关系升温”
- “她很爱我”
- “这是一次疗愈事件”

这些已经进入解释层，不再是原始线索。

## 4. Signal 定义

### 4.1 定义

`Signal` 是系统从一个或多个 `Cue` 中提取出的可观测模式。

它比 `Cue` 更抽象，但仍应尽量保持“可被观察和说明”，而不是直接跳到结论。

### 4.2 作用

- 作为解释层的中间依据
- 支撑九维提取
- 支撑不确定性说明和依据链

### 4.3 典型类型

- 语言信号
- 行为信号
- 关系信号
- 场景信号
- 时间信号
- 文化信号
- 习惯信号

### 4.4 示例

由上面的 `Cue` 可提取出这些 `Signal`：

- `低落表达信号`
  - 依据：`很沮丧`
- `持续安抚信号`
  - 依据：`一直安慰我`
- `亲密互动信号`
  - 依据：`亲了我`
- `低刺激环境信号`
  - 依据：`人很少`、`低沉的萨克斯`
- `夜间私密场景信号`
  - 依据：`夏夜`、`咖啡厅`

### 4.5 Signal 的边界

`Signal` 可以说：

- “存在持续安抚信号”
- “存在压迫式语气信号”
- “存在环境安静信号”

但不应直接说：

- “她是在治疗我”
- “他就是在操控我”
- “这是注定失败的关系”

这些属于解释，不属于可观测模式。

## 5. Interpretation 定义

### 5.1 定义

`Interpretation` 是系统基于 `Cue` 和 `Signal` 给出的候选解释。

它属于推断层，不属于事实层。

### 5.2 作用

- 形成九维候选结果
- 形成场景还原时的解释文本
- 形成认知张力和多解释并存的基础

### 5.3 典型形式

- 情感解释
- 关系解释
- 主题解释
- 事件意义解释
- 价值判断解释

### 5.4 示例

由上面的 `Signal` 可生成这些 `Interpretation`：

- `可能存在被安抚后的情绪回落`
- `当前关系可能出现亲密升温`
- `这段场景可能属于安慰型亲密互动`
- `该记忆可能具有较高关系价值`

### 5.5 解释层规则

- 解释必须是候选性的
- 解释必须带依据链
- 解释允许多个并存
- 解释不得伪装成事实

## 6. 三层之间的关系

### 6.1 形成链

标准形成链：

`原始输入 -> Cue -> Signal -> Interpretation -> DimensionTag -> MemoryEpisode`

### 6.2 粒度关系

- `Cue` 粒度最细，贴近输入
- `Signal` 为中间抽象层
- `Interpretation` 为候选解释层

### 6.3 多对多关系

- 一个 `Cue` 可支撑多个 `Signal`
- 一个 `Signal` 可支撑多个 `Interpretation`
- 多个 `Cue` 也可共同组成一个 `Signal`

## 7. 三层判断口诀

给后续建模一个简单判断方法：

- 如果它能直接从原文里摘出来，优先判为 `Cue`
- 如果它是在描述“看到了什么模式”，优先判为 `Signal`
- 如果它是在描述“这可能意味着什么”，优先判为 `Interpretation`

## 8. 反例与纠偏

### 8.1 错误示例一

把“她很爱我”当成 `Signal`

纠偏：

- `她很爱我` 应为 `Interpretation`
- 对应 `Signal` 可能是：
  - `持续安抚信号`
  - `亲密互动信号`
  - `主动靠近信号`

### 8.2 错误示例二

把“拍桌子”当成 `Interpretation`

纠偏：

- `拍桌子` 本身应为 `Cue`
- 由此可提取：
  - `强势表达信号`
  - `冲突升级信号`
- 再解释为：
  - `可能存在施压`
  - `可能存在情绪激化`

### 8.3 错误示例三

把“环境压抑”当成 `Cue`

纠偏：

- `环境压抑` 多数情况下已是 `Interpretation`
- 更原始的 `Cue` 可能是：
  - `灯光很暗`
  - `没人说话`
  - `空调冷得刺骨`

## 9. 数据结构建议

### 9.1 Cue

```ts
type Cue = {
  id: string
  sessionId: string
  sourceRef: string
  cueType: string
  text: string
  spanStart?: number
  spanEnd?: number
  confidence: number
}
```

### 9.2 Signal

```ts
type Signal = {
  id: string
  sessionId: string
  signalType: string
  label: string
  cueIds: string[]
  confidence: number
  reason?: string
}
```

### 9.3 Interpretation

```ts
type Interpretation = {
  id: string
  sessionId: string
  interpretationType: string
  label: string
  signalIds: string[]
  confidence: number
  alternatives?: string[]
  uncertaintyNote?: string
}
```

## 10. 对九维的影响

九维不应直接从原始文本硬跳生成，而应优先通过这三层生成。

推荐方式：

- 场景维：由场景 `Cue` 与场景 `Signal` 支撑
- 情感维：由情感相关 `Signal` 和情感 `Interpretation` 支撑
- 关系维：由互动 `Cue`、关系 `Signal`、关系 `Interpretation` 支撑

## 11. 对前端展示的影响

前端建议能分层展示：

- 原文中的 `Cue`
- 系统检测到的 `Signal`
- 系统提出的 `Interpretation`

这样用户能看懂：

- 机器抓到了什么
- 机器从中看到了什么模式
- 机器最后做了什么解释

## 12. 验收标准

`DB-M01` 完成的标准：

- 团队能清楚区分三层对象
- 后续建模不再把线索、信号、解释混写
- 任意样例文本都能稳定切出三层对象
- 前端可据此设计分层展示

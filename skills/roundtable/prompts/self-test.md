# 自测流程

收到自测命令后，按以下步骤逐项检查，最后汇总输出报告。

## 检查基准路径

- 安装版：`~/.claude/skills/roundtable/`
- 项目版：`{项目仓库}/skills/roundtable/`（项目仓库路径：`/Users/liangweijian/ai-product/roundtable-skill/skills/roundtable/`）

检查操作统一使用**安装版**路径。C3 两地同步检查时对比两个路径。

---

## A 组：文件完整性

### A1 核心文件存在

- 用 Glob 扫描 `prompts/*.md` 和 `prompts/formats/*.md`
- 预期 7 个文件全部存在：`domain-mapper.md`、`debate-protocol.md`、`skill-system.md`、`member-management.md`、`shared.md`、`structured.md`、`court.md`（不含 self-test.md 本身，自测工具不属于核心辩论文件）
- 记录缺失文件名

### A2 成员 SKILL.md 存在

- 用 Glob 扫描 `members/*/SKILL.md` 和 `members/custom/*/SKILL.md`
- 预期每个成员目录（含子目录）都有 SKILL.md
- 记录缺失的成员名

### A3 YAML frontmatter 合法

- 对 A2 找到的每个 SKILL.md，Read 前 20 行
- 检查以 `---` 开头和结尾，且中间非空
- 记录不合法的文件

### A4 成员 debate.md 存在

- 用 Glob 扫描 `members/*/debate.md` 和 `members/custom/*/debate.md`
- 预期每个有 SKILL.md 的成员目录都同时有 debate.md（辩论弹药层，完整模式第 2 轮按需加载）
- 记录缺失 debate.md 的成员名

---

## B 组：字段完整性

### B1 必需字段齐全

- 对每个成员的 YAML frontmatter，检查包含 6 个字段：`name`、`aliases`、`domain`、`style`、`one_liner`、`signature_skill`
- 记录缺失字段的成员名和缺失字段

### B2 signature_skill 结构

- 检查 `signature_skill` 包含 `name` 和 `effect` 子字段
- 记录结构不正确的成员名

### B3 aliases 是列表

- 检查 `aliases` 的值是 YAML 列表格式（`[...]`）
- 记录格式不正确的成员名

---

## C 组：一致性（迭代改动后最易出问题）

### C1 拆分一致性

- 用 Grep 在所有 `members/*/SKILL.md` 中搜索 `## 辩论语料库`
- 预期 0 匹配（辩论语料库已拆分到 debate.md，SKILL.md 不应保留）
- 记录匹配的文件和行号

### C2 残留引用

- 用 Grep 在 `SKILL.md` 和 `prompts/formats/*.md` 中搜索 `闪电` 或 `对话体`
- 用 Grep 在同上文件中搜索 `🤝 交锋`
- 预期 0 匹配（已移除的功能不应有残留引用）
- 注意：辩论轮次名称中的"交锋"（如"第2轮交锋"）不算残留，仅功能名称引用算残留
- 记录匹配的文件和行号

### C3 两地同步

- 对比安装版和项目版的以下文件：
  - `SKILL.md`
  - `prompts/domain-mapper.md`
  - `prompts/debate-protocol.md`
  - `prompts/skill-system.md`
  - `prompts/member-management.md`
  - `prompts/self-test.md`
  - `prompts/formats/shared.md`
  - `prompts/formats/structured.md`
  - `prompts/formats/court.md`
- 用 Bash `diff` 逐个对比
- 记录内容不一致的文件

---

## 输出格式

全部检查完成后，按以下格式输出报告：

```
> 🔍 圆桌会议自检

## 自检报告

### ✅ A 组：文件完整性（{N}/4 通过）

| 检查项 | 状态 | 详情 |
|--------|------|------|
| A1 核心文件 | {✅/❌} | {7/7 存在 / 缺少: xxx} |
| A2 成员文件 | {✅/❌} | {N 位成员全部有 SKILL.md / 缺少: xxx} |
| A3 YAML 格式 | {✅/❌} | {N/N 合法 / 不合法: xxx} |
| A4 辩论弹药 | {✅/❌} | {N 位成员全部有 debate.md / 缺少: xxx} |

### ✅/⚠️/❌ B 组：字段完整性（{N}/3 通过）

| 检查项 | 状态 | 详情 |
|--------|------|------|
| B1 必需字段 | {✅/❌} | {N/N 齐全 / {name}: 缺少 xxx} |
| B2 绝招结构 | {✅/❌} | {N/N 正确 / {name}: 缺少 xxx} |
| B3 aliases | {✅/⚠️} | {N/N 正确 / {name}: 不是列表格式} |

### ✅/⚠️/❌ C 组：一致性（{N}/3 通过）

| 检查项 | 状态 | 详情 |
|--------|------|------|
| C1 拆分一致性 | {✅/❌} | {无残留 / {file}:{line} 仍含 "## 辩论语料库"} |
| C2 残留引用 | {✅/❌} | {无残留 / {file}:{line} 仍含 "xxx"} |
| C3 两地同步 | {✅/❌} | {全部一致 / {file} 不同步} |

---

**结果：{总通过}/10 通过，{警告数} 警告，{错误数} 错误**
```

- 全部通过时：组标题用 ✅
- 有警告但无错误时：组标题用 ⚠️
- 有错误时：组标题用 ❌

### 有问题时的后续提示

当存在警告或错误时，在报告末尾追加：

```
> ❓ 检测到问题，是否需要自动修复？
> 输入「修复」自动处理可修复项，或手动处理。
```

---

## 自动修复能力

收到用户「修复」指令后，按以下规则处理：

| 问题类型 | 修复方式 | 可自动修复 |
|---------|---------|-----------|
| C2 残留引用 | Edit 移除残留行（需确认不影响其他功能） | 是 |
| C3 两地不同步 | 以安装版为准，覆盖项目版（安装版是实际运行版本） | 是 |
| B3 aliases 格式 | 修正为 YAML 列表格式 | 是 |
| B1/B2 字段缺失 | 无法自动修复（需要人工补充内容） | 否 |
| A1/A2/A4 文件缺失 | 无法自动修复（需要从项目版复制或重建） | 否 |
| A3 YAML 格式 | 无法自动修复（需要人工修正） | 否 |

修复完成后，重新运行全部检查并输出更新后的报告，确认修复结果。

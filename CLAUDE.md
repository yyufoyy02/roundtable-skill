# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 语言

- 默认使用中文回复，思考和推理也使用中文

## 项目概述

这是一个 **Claude Code Skill**（非传统代码项目），名为「圆桌会议」— 召集古今中外人物围绕用户议题展开多轮辩论。无构建/测试/lint 流程，仓库内容全部是 Markdown。

安装方式：`npx skills add liangweijian/roundtable-skill -g`
安装后实际路径：`~/.claude/skills/roundtable/`

## 架构

项目本质是一个**纯 Prompt 工程**，核心逻辑全部用 Markdown 编写，由 Claude Code 的 Skill 系统加载执行。

```
skills/roundtable/
├── SKILL.md              ← 主控文件：命令解析 → 流程编排 → 质量规则
├── VERSION               ← 版本号（当前 1.2）
├── prompts/              ← 功能模块（被 SKILL.md 按需加载）
│   ├── domain-mapper.md  ← 成员匹配 + 阵营划分
│   ├── debate-protocol.md← 辩论协议（轮次、互动、裁决）
│   ├── skill-system.md   ← 游戏化系统（绝招、随机事件、彩蛋）
│   ├── member-management.md ← 成员管理（加入/移除/查看/重试）
│   ├── self-test.md      ← 系统自测
│   └── formats/          ← 输出格式模板（结构化 + 投票制辩论）
└── members/              ← 成员资料库
    ├── {name}/SKILL.md   ← 成员思维模型（YAML frontmatter + 详细内容）
    └── custom/           ← 用户自定义成员（git 忽略）
report/                   ← 会议记录存档（git 忽略），文件命名：{辩论副标题}_{YYYYMMDD}.md，辩论结束必须用 Write 工具实际写入
```

**SKILL.md 是核心**：它定义了主持人角色、命令解析规则（菜单/加入/辩论/追问/介入）、辩论编排流程（Step 1-4）。所有 prompts/ 文件是按需加载的子模块。

## 关键约定

- **成员 SKILL.md 的 YAML frontmatter** 必须包含：`name`、`aliases`、`domain`、`style`、`one_liner`，v1.2 起还需 `signature_skill`（绝招）
- **成员分两类**：内置（`members/`，git 跟踪）和自定义（`members/custom/`，git 忽略），所有成员查找操作必须同时检查两个目录
- **prompts/ 文件是独立模块**，被 SKILL.md 在 Step 2 按需加载，修改某模块不影响其他模块
- **新增游戏化特性**（绝招/事件/彩蛋）需要同步修改：`skill-system.md`（规则定义）+ 对应格式模板（输出格式）+ SKILL.md（触发时机）
- **版本发布**需同步更新：`VERSION` 文件、`CHANGELOG.md`、SKILL.md 的 frontmatter version

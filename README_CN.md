# TaskSite - 编程任务分发平台

一个连接项目发布者与接单者的协作平台。发布任务、寻找合作者、一起完成项目。

无需后端服务器 — 纯 HTML + CSS + JavaScript + Supabase。

## ✨ 功能

- 🔐 用户注册与登录
- 📝 发布项目（发单者角色）
- 🎯 申请接单（接单者角色）
- 📊 项目状态管理（开放 → 进行中 → 已完成）
- 💬 项目评论与留言墙
- ⭐ 用户间互评系统
- 📱 收款码集成（微信、支付宝）
- 🌐 多语言支持（中文 / 英文 / 法文）
- 👤 用户主页：项目历史、收到的评价、发出的评价
- 📱 移动端自适应布局
- 🔍 移动端预览工具

## 🚀 快速开始

### 1. 克隆仓库

```bash
git clone https://github.com/你的用户名/你的仓库.git
cd 你的仓库/project-tasksite
```

### 2. 配置 Supabase（可选）

1. 访问 [supabase.com](https://supabase.com) 注册并创建项目
2. 进入项目 → **SQL Editor**
3. 运行 [`supabase-setup.sql`](./supabase-setup.sql) 中的 SQL 语句

### 3. 修改连接配置

打开 [`app.js`](./app.js)，找到以下两行并替换：

```javascript
const SUPABASE_URL = '你的Supabase地址';
const SUPABASE_KEY = '你的Supabase Key';
```

> 不配置 Supabase 也能运行，内置了完整的虚拟数据。

### 4. 本地运行

```bash
npx serve .
# 打开 http://localhost:3000
```

### 5. 部署到 GitHub Pages

1. 推送文件到 GitHub 仓库
2. 进入仓库 **Settings → Pages**
3. Source 选择 `Deploy from a branch`，选 `main` 分支
4. 访问 `https://你的用户名.github.io/仓库名/`

## 📁 文件结构

```
project-tasksite/
├── index.html              ← 主页面
├── style.css               ← 样式表
├── app.js                  ← 应用逻辑
├── preview.html            ← 移动端预览工具
├── supabase-setup.sql      ← 数据库建表脚本
├── supabase-demo-data.sql  ← Supabase 测试数据
├── README_CN.md            ← 本文档
└── .gitignore
```

## 📱 移动端预览工具

通过本地服务器打开 `preview.html`，无需真实手机即可测试移动端布局：

```bash
npx serve .
# 打开 http://localhost:3000/preview.html
```

功能：iPhone / Android 设备预设、旋转、缩放、URL 栏、返回导航。

## 🔧 Supabase 数据库

运行 `supabase-setup.sql` 会创建：

| 表名 | 说明 |
|------|------|
| `profiles` | 用户资料（用户名、角色、收款码） |
| `projects` | 项目数据（标题、描述、预算、状态） |
| 存储桶 `qr-codes` | 收款码图片上传 |

包含 RLS（行级安全策略）保护数据安全。

## 📄 许可证

MIT

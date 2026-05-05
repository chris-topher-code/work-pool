# Connect - 编程任务分发平台

一个简单的 HTML + Supabase 单页应用，无需后端服务器。

## 功能

- 用户注册 / 登录
- 发布编程任务（申请者角色）
- 接取任务（接收者角色）
- 项目状态管理（开放 → 进行中 → 已完成）
- 微信/支付宝收款码上传

## 快速开始

### 1. 创建 Supabase 项目

1. 访问 [supabase.com](https://supabase.com) 注册并创建新项目
2. 进入项目 → **SQL Editor**
3. 运行 [`supabase-setup.sql`](./supabase-setup.sql) 中的全部 SQL 语句

### 2. 配置连接

打开 [`index.html`](./index.html)，找到以下两行，替换为你的 Supabase 项目信息：

```javascript
const SUPABASE_URL = 'YOUR_SUPABASE_URL';       // 例如: https://xxxxx.supabase.co
const SUPABASE_ANON_KEY = 'YOUR_SUPABASE_ANON_KEY';  // 在 Settings → API 中找到
```

### 3. 本地测试

双击 `index.html` 直接在浏览器打开，或：

```bash
npx serve .
# 然后访问 http://localhost:3000
```

### 4. 部署到 GitHub Pages

1. 将文件推送到 GitHub 仓库
2. 进入仓库 **Settings → Pages**
3. Source 选择 `Deploy from a branch`，选择 `main` 分支
4. 等待部署完成，访问 `https://你的用户名.github.io/仓库名/`

## 文件结构

```
project-tasksite/
├── index.html          ← 主应用（单文件，含全部 CSS + JS）
├── supabase-setup.sql  ← 数据库初始化 SQL
└── README.md
```

## Supabase 设置说明

运行 `supabase-setup.sql` 会创建：

- `profiles` 表 - 用户资料（含收款码URL）
- `projects` 表 - 项目数据
- 自动触发器 - 注册用户自动创建 profile
- Row Level Security 策略 - 保护数据安全
- `qr-codes` 存储桶 - 存放收款码图片

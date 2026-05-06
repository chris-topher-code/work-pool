# TaskSite - Connect & Collaborate

A programming task distribution platform. Post projects, find collaborators, and build amazing things together.

No backend server required — pure HTML + CSS + JavaScript + Supabase.

## ✨ Features

- 🔐 User registration & login
- 📝 Post projects (Requester role)
- 🎯 Apply for projects (Receiver role)
- 📊 Project status management (Open → In Progress → Completed)
- 💬 Comments & message wall
- ⭐ Reviews & ratings between users
- 📱 QR code payment integration (WeChat, Alipay)
- 🌐 Multi-language support (English / Chinese / French)
- 👤 User profiles with project history & reviews
- 📱 Mobile responsive design
- 🔍 Device preview tool for testing mobile layouts

## 🚀 Quick Start

### 1. Clone the repo

```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
cd YOUR_REPO/project-tasksite
```

### 2. Set up Supabase (optional)

1. Go to [supabase.com](https://supabase.com) and create a new project
2. Open **SQL Editor** in your project dashboard
3. Run the SQL in [`supabase-setup.sql`](./supabase-setup.sql)

### 3. Configure connection

Open [`app.js`](./app.js) and update these two lines:

```javascript
const SUPABASE_URL = 'YOUR_SUPABASE_URL';       // e.g. https://xxxxx.supabase.co
const SUPABASE_KEY = 'YOUR_SUPABASE_ANON_KEY';   // Found in Settings → API
```

> The app works without Supabase using built-in demo data.

### 4. Run locally

```bash
npx serve .
# Open http://localhost:3000
```

### 5. Deploy to GitHub Pages

1. Push files to your GitHub repo
2. Go to **Settings → Pages**
3. Source: `Deploy from a branch`, select `main`
4. Visit `https://YOUR_USERNAME.github.io/YOUR_REPO/`

## 📁 File Structure

```
project-tasksite/
├── index.html              ← Main page (HTML)
├── style.css               ← Styles (CSS)
├── app.js                  ← Application logic (JavaScript)
├── preview.html            ← Mobile device preview tool
├── supabase-setup.sql      ← Database schema
├── supabase-demo-data.sql  ← Demo data for Supabase
├── README.md               ← This file
└── .gitignore
```

## 📱 Mobile Preview Tool

Open `preview.html` in a local server to test mobile layouts without a real phone:

```bash
npx serve .
# Open http://localhost:3000/preview.html
```

Features: iPhone/Android device presets, rotate, zoom, URL bar, back navigation.

## 🔧 Supabase Tables

Running `supabase-setup.sql` creates:

| Table | Description |
|-------|-------------|
| `profiles` | User profiles (username, role, QR codes) |
| `projects` | Project data (title, description, budget, status) |
| Storage: `qr-codes` | Payment QR code image uploads |

Includes RLS (Row Level Security) policies for data protection.

## 📄 License

MIT

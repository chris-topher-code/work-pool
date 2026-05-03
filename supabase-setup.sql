-- Connect 平台 Supabase 数据库初始化脚本
-- 在 Supabase 控制台 -> SQL Editor 中运行此脚本

-- 1. 用户资料表（关联 Supabase Auth）
CREATE TABLE IF NOT EXISTS public.profiles (
  id UUID REFERENCES auth.users(id) ON DELETE CASCADE PRIMARY KEY,
  username TEXT UNIQUE NOT NULL,
  user_role TEXT DEFAULT 'requester' CHECK (user_role IN ('requester', 'receiver')),
  wechat_qr_url TEXT,
  alipay_qr_url TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. 项目表
CREATE TABLE IF NOT EXISTS public.projects (
  id BIGSERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT,
  budget TEXT,
  deadline TEXT,
  contact TEXT,
  status TEXT DEFAULT 'open' CHECK (status IN ('open', 'in_progress', 'completed')),
  requester_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
  receiver_id UUID REFERENCES public.profiles(id) ON DELETE SET NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- 3. 自动创建 profile（注册时触发）
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER AS $$
BEGIN
  INSERT INTO public.profiles (id, username)
  VALUES (NEW.id, COALESCE(NEW.raw_user_meta_data->>'username', split_part(NEW.email, '@', 1)));
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

DROP TRIGGER IF EXISTS on_auth_user_created ON auth.users;
CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- 4. Row Level Security (RLS)
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.projects ENABLE ROW LEVEL SECURITY;

-- profiles: 所有人可读，只能改自己的
CREATE POLICY "profiles_select" ON public.profiles FOR SELECT USING (true);
CREATE POLICY "profiles_update" ON public.profiles FOR UPDATE USING (auth.uid() = id);

-- projects: 所有人可读，登录用户可创建，发布者可改
CREATE POLICY "projects_select" ON public.projects FOR SELECT USING (true);
CREATE POLICY "projects_insert" ON public.projects FOR INSERT WITH CHECK (auth.uid() = requester_id);
CREATE POLICY "projects_update" ON public.projects FOR UPDATE USING (
  auth.uid() = requester_id OR auth.uid() = receiver_id
);

-- 5. Storage 桶（收款码图片）
INSERT INTO storage.buckets (id, name, public) VALUES ('qr-codes', 'qr-codes', true)
ON CONFLICT (id) DO NOTHING;

-- storage 策略：登录用户可上传，所有人可读
CREATE POLICY "qr_upload" ON storage.objects FOR INSERT
  WITH CHECK (bucket_id = 'qr-codes' AND auth.role() = 'authenticated');
CREATE POLICY "qr_select" ON storage.objects FOR SELECT
  USING (bucket_id = 'qr-codes');
CREATE POLICY "qr_delete" ON storage.objects FOR DELETE
  USING (bucket_id = 'qr-codes' AND auth.uid() = owner);
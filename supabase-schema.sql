-- Run this script in your Supabase SQL Editor to create the necessary tables

CREATE TABLE IF NOT EXISTS collaborators (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT,
  sector TEXT,
  role TEXT,
  "isAdmin" BOOLEAN DEFAULT FALSE,
  username TEXT UNIQUE,
  password TEXT,
  "mustChangePassword" BOOLEAN DEFAULT FALSE,
  "createdAt" TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS sectors (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  "createdAt" TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS clients (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  email TEXT,
  company TEXT,
  status TEXT,
  "createdAt" TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS tasks (
  id TEXT PRIMARY KEY,
  title TEXT NOT NULL,
  "clientId" TEXT NOT NULL REFERENCES clients(id) ON DELETE CASCADE,
  sectors JSONB DEFAULT '[]'::jsonb,
  "collaboratorIds" JSONB DEFAULT '[]'::jsonb,
  status TEXT NOT NULL,
  priority TEXT NOT NULL,
  description TEXT,
  "createdAt" TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  "completedAt" TIMESTAMP WITH TIME ZONE,
  "isArchived" BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS task_history (
  id SERIAL PRIMARY KEY,
  "taskId" TEXT NOT NULL REFERENCES tasks(id) ON DELETE CASCADE,
  "collaboratorId" TEXT NOT NULL REFERENCES collaborators(id) ON DELETE CASCADE,
  status TEXT NOT NULL,
  timestamp TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS boards (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  position INTEGER NOT NULL,
  "createdAt" TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS panels (
  id TEXT PRIMARY KEY,
  name TEXT NOT NULL,
  "collaboratorId" TEXT NOT NULL REFERENCES collaborators(id) ON DELETE CASCADE,
  "createdAt" TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS panel_items (
  id TEXT PRIMARY KEY,
  "panelId" TEXT NOT NULL REFERENCES panels(id) ON DELETE CASCADE,
  type TEXT NOT NULL,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  checklist JSONB DEFAULT '[]'::jsonb,
  "collaboratorIds" JSONB DEFAULT '[]'::jsonb,
  position INTEGER NOT NULL,
  "isArchived" BOOLEAN DEFAULT FALSE,
  "isCompleted" BOOLEAN DEFAULT FALSE,
  "createdAt" TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Optional: Insert initial data
INSERT INTO boards (id, name, position) VALUES 
  ('b1', 'To Do', 0),
  ('b2', 'In Progress', 1),
  ('b3', 'Review', 2),
  ('b4', 'Done', 3)
ON CONFLICT DO NOTHING;

INSERT INTO collaborators (id, name, email, sector, role, "isAdmin", username, password, "mustChangePassword") VALUES 
  ('admin-master', 'Administrador Master', 'admin@lince.com', 'Diretoria', 'Admin', TRUE, 'admin', '$2b$10$fPMoYspn1smq4UxKa2l1w.yf1REC8pF/1bWg1xjlIJCcDKogec1li', FALSE),
  ('c1', 'Henrique Fox', 'henrique@lince.com', 'Trafego Pago', 'Head de Trafego', TRUE, 'henrique', '$2b$10$fPMoYspn1smq4UxKa2l1w.yf1REC8pF/1bWg1xjlIJCcDKogec1li', TRUE),
  ('c2', 'Ana Design', 'ana@lince.com', 'Design', 'Senior Designer', FALSE, 'ana', '$2b$10$fPMoYspn1smq4UxKa2l1w.yf1REC8pF/1bWg1xjlIJCcDKogec1li', TRUE),
  ('c3', 'Carlos Web', 'carlos@lince.com', 'Web Design', 'Fullstack Dev', FALSE, 'carlos', '$2b$10$fPMoYspn1smq4UxKa2l1w.yf1REC8pF/1bWg1xjlIJCcDKogec1li', TRUE)
ON CONFLICT DO NOTHING;

INSERT INTO clients (id, name, email, company, status) VALUES 
  ('1', 'TechNova Solutions', 'contact@technova.com', 'TechNova', 'Active'),
  ('2', 'Green Garden Co', 'info@greengarden.com', 'Green Garden', 'Active'),
  ('3', 'Urban Fit Gym', 'hello@urbanfit.com', 'Urban Fit', 'Active')
ON CONFLICT DO NOTHING;

INSERT INTO sectors (id, name) VALUES 
  ('s1', 'Trafego Pago'), ('s2', 'Design'), ('s3', 'Web Design'), ('s4', 'Social Media'), 
  ('s5', 'Audiovisual'), ('s6', 'CS'), ('s7', 'Head Comercial'), ('s8', 'Head de Trafego Pago'), 
  ('s9', 'SDR'), ('s10', 'Closers')
ON CONFLICT DO NOTHING;

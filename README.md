# Lince Performance — Next.js

Sistema de gestão de demandas e CRM recriado em Next.js 15 com App Router.

## Stack

- **Next.js 15** (App Router)
- **TypeScript**
- **Tailwind CSS 3**
- **Socket.io** (tempo real via custom server)
- **Supabase** (banco de dados)
- **Motion** (animações)
- **Syne + Plus Jakarta Sans** (tipografia)

## Melhorias em relação ao original

- Arquitetura modular — componentes separados, sem monólito de 3500 linhas
- Estado global com `useReducer` + Context API (sem prop drilling)
- Socket.io desacoplado em contexto próprio
- Tipografia distinta (Syne para display, Plus Jakarta Sans para texto)
- Design system via classes Tailwind customizadas
- API routes nativas do Next.js (Route Handlers)
- Navegação com Next.js App Router

## Setup

1. **Instalar dependências**
   ```bash
   npm install
   ```

2. **Configurar variáveis de ambiente**
   ```bash
   cp .env.example .env.local
   # Edite .env.local com suas credenciais do Supabase
   ```

3. **Criar as tabelas no Supabase**
   Execute o arquivo `supabase-schema.sql` no SQL Editor do seu projeto Supabase.

4. **Rodar o projeto**
   ```bash
   npm run dev
   ```
   Acesse: http://localhost:3000

## Login padrão

- **Usuário:** `admin`
- **Senha:** `admin`

## Estrutura

```
app/
  (dashboard)/          # Layout protegido com Sidebar
    dashboard/          # Visão geral / métricas
    kanban/             # Board Kanban
    panels/             # Brainstorm / painéis
      [id]/             # Detalhe do painel com cards
    completed/          # Histórico de demandas
    clients/            # Gestão de clientes
    collaborators/      # Gestão de colaboradores
    settings/           # Config (admin only)
  api/                  # Route Handlers (Next.js)
context/
  AppContext.tsx         # Estado global (useReducer)
  SocketContext.tsx      # Socket.io client
components/
  layout/               # Sidebar, LoginPage, Providers
  ui/                   # Modal, ConfirmModal, SuccessPopup
  kanban/               # TaskCard, TaskDetailModal, TaskFormModal
lib/
  supabase.ts           # Cliente Supabase
  socket-server.ts      # Socket.io singleton (server)
  types.ts              # Tipos TypeScript
  utils.ts              # Utilitários
```

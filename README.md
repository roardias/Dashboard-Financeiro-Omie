# 💼 Dashboard Financeiro - Omie API Integration

> Sistema profissional para extração, processamento e visualização de dados financeiros da API Omie integrado com Supabase.

## 🎯 **Características Principais**

- ✅ **Dashboard Interativo** com React + HTML5
- ✅ **Integração Omie API** para extração automática de dados
- ✅ **Database Supabase** com views otimizadas
- ✅ **Filtros Avançados** por empresa, data e conta
- ✅ **Performance Otimizada** com SQL views e funções
- ✅ **Responsive Design** para desktop e mobile

## 📊 **Preview do Dashboard**

```
┌─────────────────────────────────────────────────────────┐
│  💼 Dashboard Financeiro                                │
│  ════════════════════════════════════════════════════   │
│                                                         │
│  📈 10 Empresas    📋 156 Contas    💰 R$ 2.933.442,87  │
│                                                         │
│  🔍 [3SA] [ALLDAX 1] [ALLDAX 2] [...] [Todas]         │
│  📅 Data: [____/____/____] [Aplicar]                   │
│                                                         │
│  ┌─────────┬──────────────────┬──────────────────┐     │
│  │ Empresa │ Conta            │ Saldo            │     │
│  ├─────────┼──────────────────┼──────────────────┤     │
│  │ 3SA     │ Caixinha - Caju  │ R$ 121.599,12   │     │
│  │ ALLDAX 2│ Itaú - 56427-9   │ R$ 5.200,53     │     │
│  └─────────┴──────────────────┴──────────────────┘     │
└─────────────────────────────────────────────────────────┘
```

## 🚀 **Tecnologias Utilizadas**

| Categoria | Tecnologia | Versão |
|-----------|------------|--------|
| **Frontend** | React | 18.x |
| **Styling** | CSS3 + Flexbox/Grid | - |
| **Database** | Supabase (PostgreSQL) | - |
| **API Integration** | Python + Requests | 3.x |
| **Data Processing** | Pandas | 2.x |
| **Server** | Python HTTP Server | 3.x |

## 📁 **Estrutura do Projeto**

```
Dashboard-Financeiro-Omie/
├── 📱 dashboard_corrigido.html      # Dashboard principal
├── 🗄️  view_final_unificada.sql     # View SQL otimizada
├── ⚡ funcao_corrigida.sql          # Função SQL performática
├── 🐍 omie_*.py                     # Scripts de extração API
├── ⚙️  supabase_config.py           # Configurações (não commitado)
├── 📄 README.md                     # Este arquivo
└── 🚫 .gitignore                    # Arquivos ignorados
```

## ⚙️ **Configuração e Instalação**

### **1. Pré-requisitos**
```bash
- Python 3.8+
- Conta Supabase
- Acesso à API Omie
- Navegador moderno
```

### **2. Instalação**
```bash
# 1. Clone o repositório
git clone <seu-repositorio>
cd Dashboard-Financeiro-Omie

# 2. Instale dependências Python
pip install pandas requests supabase

# 3. Configure Supabase
cp supabase_config.example.py supabase_config.py
# Edite com suas credenciais

# 4. Execute as views SQL
# Acesse Supabase > SQL Editor
# Execute: view_final_unificada.sql
# Execute: funcao_corrigida.sql
```

### **3. Uso**
```bash
# Iniciar servidor local
python -m http.server 8080

# Acessar dashboard
http://localhost:8080/dashboard_corrigido.html
```

## 🔧 **Funcionalidades**

### **📊 Dashboard Principal**
- **Visualização geral** de todas as empresas
- **Estatísticas em tempo real** (empresas, contas, saldo total)
- **Filtros interativos** por empresa e data
- **Busca textual** por conta
- **Export CSV** dos dados filtrados

### **⚡ Performance**
- **Views SQL otimizadas** para consultas rápidas
- **Paginação automática** para grandes volumes de dados
- **Cache inteligente** de dados frequentes
- **Carregamento < 1 segundo** na maioria dos casos

### **🔍 Filtros Avançados**
```javascript
// Filtro por empresa
empresas = ['3SA', 'ALLDAX 1', 'ALLDAX 2', ...]

// Filtro por data (acumulativo)
data_limite = '2024-01-31'
// Resultado: saldo_inicial + movimentos até 31/01/2024

// Busca textual
busca = 'Bradesco'
// Resultado: todas as contas que contêm "Bradesco"
```

## 🗄️ **Arquitetura de Dados**

### **Views Principais**
```sql
-- View unificada (saldo inicial + movimentos)
vw_saldo_acumulado
├── empresa
├── conta_corrente_descricao  
├── valor_corrigido
├── d_dt_pagamento
└── tipo (SALDO_INICIAL | MOVIMENTO)

-- Função otimizada para dashboard
get_saldo_simples(filtro_empresa)
├── saldo_inicial_conta
├── movimentos_do_periodo
├── saldo_final
└── qtd_movimentos
```

### **Fluxo de Dados**
```
API Omie → Python Scripts → CSV Processing → Supabase → SQL Views → Dashboard
```

## 📈 **Métricas de Performance**

| Métrica | Valor | Otimização |
|---------|-------|------------|
| **Tempo de carregamento** | < 1s | Views SQL + Cache |
| **Registros processados** | 18.519 | Paginação automática |
| **Empresas suportadas** | 10+ | Filtros dinâmicos |
| **Responsividade** | 100% | CSS Grid/Flexbox |

## 🛡️ **Segurança**

- ✅ **Credenciais não commitadas** (.gitignore)
- ✅ **API Keys protegidas** (variables de ambiente)
- ✅ **Dados sensíveis excluídos** do repositório
- ✅ **Acesso controlado** via Supabase RLS

## 📝 **Roadmap**

- [ ] 🚀 **Deploy automático** (Vercel/Netlify)
- [ ] 📱 **App mobile** (React Native)
- [ ] 🤖 **Automação** de extração de dados
- [ ] 📊 **Gráficos interativos** (Chart.js)
- [ ] 📧 **Relatórios automáticos** por email

## 🤝 **Contribuição**

1. Fork o projeto
2. Crie uma branch (`git checkout -b feature/nova-funcionalidade`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## 📄 **Licença**

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## 👨‍💻 **Autor**

**Rodrigo** - Desenvolvedor Principal
- 📧 Email: [seu-email]
- 💼 LinkedIn: [seu-linkedin]
- 🐙 GitHub: [seu-github]

---

⭐ **Se este projeto te ajudou, deixe uma estrela!** ⭐

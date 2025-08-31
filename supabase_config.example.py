# ===================================================================
# CONFIGURAÇÃO SUPABASE - EXEMPLO
# ===================================================================
# 1. Renomeie este arquivo para: supabase_config.py
# 2. Substitua os valores com suas credenciais reais
# 3. NUNCA commite o arquivo real no Git!

# Supabase Credentials
SUPABASE_URL = "https://SEU_PROJETO.supabase.co"
SUPABASE_KEY = "eyJhbGciOiJIUzI1NiIsInR5cCI6Ik...SUA_CHAVE_AQUI"

# Database Settings
DATABASE_SCHEMA = "public"
TABLE_PREFIX = ""

# API Configuration
OMIE_APP_KEY = "SUA_OMIE_APP_KEY"
OMIE_APP_SECRET = "SUA_OMIE_APP_SECRET"

# Performance Settings
BATCH_SIZE = 1000
MAX_RETRIES = 3
TIMEOUT_SECONDS = 30

# Debug Settings
DEBUG = False
VERBOSE_LOGS = False

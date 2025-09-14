FROM n8nio/n8n:latest

# Define o usuário como root para evitar problemas de permissão
USER root

# Cria diretório para dados do N8N com permissões corretas
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n && chmod -R 700 /home/node/.n8n

# Volta para o usuário padrão
USER node

# Define variáveis de ambiente
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=http
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true

# Expõe a porta
EXPOSE 5678

# Comando para iniciar o N8N (usando o caminho completo)
CMD ["/usr/local/bin/n8n", "start"]
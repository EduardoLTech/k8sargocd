# Use a imagem oficial do nginx como base
FROM nginx:latest

# Remova o arquivo padrão de configuração do Nginx
RUN rm /usr/share/nginx/html/index.html

# Adicione o arquivo HTML com a mensagem
COPY index.html /usr/share/nginx/html/

# Exponha a porta padrão do Nginx
EXPOSE 80

# Comando padrão para iniciar o Nginx
CMD ["nginx", "-g", "daemon off;"]

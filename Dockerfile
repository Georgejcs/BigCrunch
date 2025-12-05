# 1. Use uma imagem base de servidor web leve (Nginx)
FROM nginx:alpine

# 2. Defina um diretório de trabalho se necessário, mas o Nginx já tem o seu.
# WORKDIR /usr/share/nginx/html # (Opcional, pois é o padrão de serviço do Nginx)

# 3. Limpe o conteúdo padrão do Nginx (boa prática)
RUN rm -rf /usr/share/nginx/html/*

# 4. Copie todos os seus arquivos de código (HTML, CSS, JS) para o diretório de serviço do Nginx
# Certifique-se de que seus arquivos index.html, etc., estão no mesmo diretório do Dockerfile.
COPY . /usr/share/nginx/html/

# 5. Expõe a porta padrão do Nginx (porta 80)
EXPOSE 80

# 6. O Nginx já tem um CMD padrão que o inicia, então não precisa de um CMD manual
# O seu CMD ["start", "index.html"] não é válido em um contêiner Node nem Nginx.
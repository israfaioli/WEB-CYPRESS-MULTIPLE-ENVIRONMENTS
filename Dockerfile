# Utilizando uma imagem node
FROM node:14

# Definindo diretório de trabalho dentro do container
WORKDIR /app

# Instalando o Xvfb
RUN apt-get update && \
    apt-get install -y xvfb

# Copiando o package.json para o container
COPY package.json ./

# Instalando as dependências do projeto
RUN npm i

# Copiando todos os arquivos do diretório atual para o diretório de trabalho no container
COPY . .

# Executando os testes Cypress com Xvfb
CMD xvfb-run --auto-servernum --server-args="-screen 0 1920x1080x24" npx cypress run --browser chrome --env environmentName=homolog

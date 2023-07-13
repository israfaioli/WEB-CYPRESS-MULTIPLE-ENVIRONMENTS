# Utilizando uma imagem node
FROM docker.io/cypress/browsers

# Definindo diretório de trabalho dentro do container
WORKDIR /app

# Copiando o package.json para o container
COPY package.json ./

# Instalando as dependências do projeto
RUN npm install

# Adicionando as dependências do Chrome
RUN apt-get update && apt-get install -y libglib2.0-0 libnss3 libatk-bridge2.0-0 libgtk-3-0 libgbm-dev xvfb

# Copiando todos os arquivos do diretório atual para o diretório de trabalho no container
COPY . .

# Executando os testes Cypress no Chrome em modo headless
CMD npx cypress run --browser chrome --env environmentName=homolog

# Utilizando uma imagem node
FROM cypress/browsers

# Definindo diretório de trabalho dentro do container
WORKDIR /app

# Copiando o package.json para o container
COPY package.json ./

# Instalando as dependências do projeto
RUN npm install

# Copiando todos os arquivos do diretório atual para o diretório de trabalho no container
COPY . .

# Executando os testes Cypress no Chrome em modo headless
CMD npx cypress run --browser chrome --env environmentName=homolog
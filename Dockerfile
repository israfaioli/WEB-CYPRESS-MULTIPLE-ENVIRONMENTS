# Utilizando uma imagem node
FROM cypress/base:latest

# Definindo diretório de trabalho dentro do container
WORKDIR /app

# Instalando o Chrome e outras dependências
RUN apt-get update && \
    apt-get install -y curl gnupg2 ca-certificates && \
    curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | gpg --dearmor --output /usr/share/keyrings/google-chrome-keyring.gpg && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable

# Copiando o package.json para o container
COPY package.json ./

# Instalando as dependências do projeto
RUN npm install

# Copiando todos os arquivos do diretório atual para o diretório de trabalho no container
COPY . .

# Executando os testes Cypress no Chrome em modo headless
CMD npx cypress run --browser chrome --env environmentName=homolog
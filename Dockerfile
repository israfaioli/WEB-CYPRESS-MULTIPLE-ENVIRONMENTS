#utilizando uma imagem node
FROM cypress/base:latest

#definindo diretorio de trabalho dentro do container
WORKDIR /app

# Instalando o Chrome e outras dependências
RUN apt-get update && \
    apt-get install -y wget gnupg2 && \
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list && \
    apt-get update && \
    apt-get install -y google-chrome-stable

# copiando o .package.json para o container
COPY package.json ./

# instalando as dependencias do projeto
RUN npm i

#copiando todos os arquivos do diretorio atual para o diretorio de trabalho no container
COPY . .

#executando os testes cypress
CMD npx cypress run --browser chrome --headless --env environmentName=homolog
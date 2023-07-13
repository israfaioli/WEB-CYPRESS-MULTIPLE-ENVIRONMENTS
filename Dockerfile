#utilizando uma imagem node
FROM node:14

#definindo diretorio de trabalho dentro do container
WORKDIR /app

# copiando o .package.json para o container
COPY package.json ./

# Instalando o Xvfb
RUN apt-get update && \
    apt-get install -y xvfb

# instalando as dependencias do projeto
RUN npm i

#copiando todos os arquivos do diretorio atual para o diretorio de trabalho no container
COPY . .

#executando os testes cypress
CMD npx cypress run --browser chrome --env environmentName=homolog
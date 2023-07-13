#utilizando uma imagem node
FROM node:14

#definindo diretorio de trabalho dentro do container
WORKDIR /app

# copiando o .package.json para o container
COPY package.json ./

RUN apt-get install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb

# instalando as dependencias do projeto
RUN npm ci 

#copiando todos os arquivos do diretorio atual para o diretorio de trabalho no container
COPY . .

#executando os testes cypress
CMD npx cypress run --browser chrome --env environmentName=homolog
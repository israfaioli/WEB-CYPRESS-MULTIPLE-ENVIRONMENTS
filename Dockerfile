# Utilizando uma imagem node
FROM docker.io/cypress/browsers

# Instalando as dependências do projeto
RUN npm install

# Executando os testes Cypress no Chrome em modo headless
CMD npx cypress run --browser chrome --env environmentName=homolog
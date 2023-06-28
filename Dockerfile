# Imagem base
FROM cypress/included:8.6.0

# Versão específica do Cypress
RUN npm install cypress@12.5.0

# Copia o arquivo de configuração do Cypress
COPY cypress /cypress

# Comando para executar os testes
CMD ["npx", "cypress", "run", "--browser", "chrome", "--env", "environmentName=homolog", "--spec", "cypress/e2e/login/login.cy.js"]
# WEB-CYPRESS-MULTIPLE-ENVIRONMENTS
Projeto cypres versao 12+ onde demonstro utilização de multiplos environments

# Comando para executar com navegador aberto em ambiente homolog
npx cypress open --env environmentName=homolog

# Comando para executar com navegador aberto em ambiente prod
npx cypress open --env environmentName=prod

# Comando para executar com navegador em background(headless) em ambiente homolog
npx cypress run --browser chrome --env environmentName=homolog

# Comando para executar com navegador em background(headless) em ambiente prod
npx cypress run --browser chrome --env environmentName=prod

# Comando para executar com navegador em background(headless) em ambiente prod um arquivo de teste especifico
npx cypress run --browser chrome --env environmentName=prod --spec "cypress/e2e/${diretorio_teste}/${nome_arquivo_spec}"

# Comando para executar com navegador em background(headless) em ambiente homolog um arquivo de teste especifico
npx cypress run --browser chrome --env environmentName=homolog --spec "cypress/e2e/${diretorio_teste}/${nome_arquivo_spec}"
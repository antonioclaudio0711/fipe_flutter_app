# Desafio: App de Consulta e Gerenciamento de Veículos

### Objetivo: 
Criar um aplicativo em Flutter para ajudar usuários a gerenciar seus veículos cadastrados e consultar preços na tabela FIPE.


### Requisitos do aplicativo:

#### Navegação entre telas:
    1. Tela inicial: mostre a lista de veículos cadastrados pelo usuário;
    2. Tela de detalhes: exiba informações detalhadas do veículo selecionado, incluindo o preço FIPE atualizado;
    3. Tela de cadastro: permita que o usuário cadastre novos veículos com os seguintes dados: marca, modelo e ano; informações adicionais, como cor e placa (opcional).

#### Cadastro de veículos:
    1. Use sqflite ou shared_preferences para armazenar veículos cadastrados no dispositivo;
    2. Certifique-se de validar os dados antes de salvar.

#### Consulta de preço FIPE:
    1. Integre a API FIPE para:
        a. buscar o preço de um veículo cadastrado pelo usuário;
        b. consultar o preço de um veículo não cadastrado (com opção de entrada manual para marca, modelo e ano);
        c. o preço FIPE deve ser exibido em uma interface clara e informativa.

#### Fluxo de busca de preço FIPE:
    1. Usuário seleciona um veículo cadastrado na lista, acessa os detalhes, e clica no botão "Consultar preço FIPE";
    2. Usuário acessa uma opção para "Consulta Avulsa", onde pode informar os dados de um veículo sem cadastro.

#### Filtros:
    1. Adicione filtros na tela de lista de veículos para organizar por:
        a. marca;
        b. ano;
        c. preço FIPE (após consulta).


##### Extra (opcionais): Modo Offline (permita ao usuário ver os veículos cadastrados mesmo sem internet, mas com aviso de que a consulta FIPE está indisponível).

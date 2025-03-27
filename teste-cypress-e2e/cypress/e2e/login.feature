Feature: Login no sistema

  Scenario: Login com credenciais válidas
    Given que o usuário acessa a página de login
    When ele preenche o email "user@email.com"
    And preenche a senha "senha123"
    Then ele deve ver a mensagem "Login realizado com sucesso"

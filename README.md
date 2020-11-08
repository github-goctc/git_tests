## Sobre o projeto

Este pequeno projeto tem por objetivo automatizar um conjunto de testes sobre o portal GitHub utilizando Cucumber e Ruby.


## Pré requisitos

   * **SO**:
    * CentOS Linux release 7.5.1804 (Core)
   * **Ruby**:
      * version: 2.5
   * **Ruby Gems**:
      * **Watir**:
        * version: 6.12.0
      * **Minitest**:
        * version: 5.10.3
      * **Cucumber**:
        * version: 3.1.2

   ###### _Para obter mais detalhes sobre o processo de instalação dos pré-requisitos consultar o documento gitgo_setup.docx (na pasta "resources")_


## Instalação

Na VM clonar o repositório:	**git clone https://github.com/github-goctc/git_tests.git**
  
  
## Utilização

* Ir para a pasta raiz do projeto: **git_tests**
* Execução dos testes
  * Para correr a abateria de testes executar o comando: **cucumber -t** _**@tag**_
    * A _**@tag**_ pode assumir os seguintes valores:
      * _**@github**_ (executa toda a bateria de testes)
      * _**@file**_ (executa os testes relacionados com a gestão de ficheiros)
      * _**@issue**_ (executa os testes relacionados com a gestão de issues)
      * _**@login**_ (executa os testes relacionados com o login no portal)
      * _**@project**_ (executa os testes relacionados com a gestão de projetos)

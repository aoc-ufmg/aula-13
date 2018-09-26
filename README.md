![Logo UFMG](https://www.ufmg.br/marca/ass6.jpg)

# Arquitetura e Organização de Computadores - Aula 13

## Assunto

* MARS: execução de procedimentos não recursivos e recursivos.

## Objetivos

* Apresentar a execução de procedimentos recursivos e não recursivos no MARS
* Implementar um algoritmo recursivo usando a linguagem assembly do MIPS

### Espera-se que ao final da aula o aluno saiba responder às seguintes questões:

* Como implementar um algoritmo recursivo?
* Quais as características de execução de um algoritmo recursivo?
* Como o comportamento de um algoritmo recursivo se difere de um algoritmo iterativo?


## Referências

* [Mars - MIPS Assembler and Runtime Simulator](http://courses.missouristate.edu/KenVollmar/mars/)
* [Bubble Sort](https://en.wikipedia.org/wiki/Bubble_sort)
* [GCD de Euclides](https://en.wikipedia.org/wiki/Euclidean_algorithm)
* [Usando o Mars da Linha de Comando](https://courses.missouristate.edu/KenVollmar/mars/Help/MarsHelpCommand.html)


## Atividades

Na descrição dessas atividades, utilizaremos o Mars via linha de comando (terminal no linux, prompt no windows) para facilitar a descrição dos procedimentos. Não é necessário utilizar a linha de comando: você pode utilizar a interface gráfica.

### Testando o mars

1. Crie uma pasta em seu computador. No restante desse tutorial, chamaremos esta pasta de `$ATIVIDADE`;

1. Faça o download (ou melhor, [clone](https://help.github.com/articles/cloning-a-repository/)) o conteúdo do repositório da aula. Armazene esse conteúdo dentro da pasta `$ATIVIDADE/aula-13`;

1. Faça o download do Mars para o diretório `$ATIVIDADE`. No restante desse tutorial, consideraremos que o arquivo baixado seja o `Mars4_5.jar`;

1. Verifique se sua estrutura de diretórios está correta. Ela deve se parecer com isso:
    ```
    .
    ├── aula-13
    │   ├── examples
    │   │   └── Bubble.asm
    │   ├── LICENSE
    │   └── README.md

    ```
  
1. Abra um terminal/prompt na pasta `$ATIVIDADE` e execute o seguinte comando:
    ```
    $ java -jar Mars4_5.jar 0x10010000-0x10010010 aula-13/examples/Bubble.asm
    ```
1. A saída abaixo deve ser obtida. Se isso não ocorreu, verifique sua estrutura de diretórios.

    ```
    MARS 4.5  Copyright 2003-2014 Pete Sanderson and Kenneth Vollmar

    Mem[0x10010000]	0x00000001	0x00000002	0x00000003	0x00000004	
    Mem[0x10010010]	0x00000005
    ```

## Exemplos

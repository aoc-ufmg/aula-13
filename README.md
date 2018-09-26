![Logo UFMG](https://www.ufmg.br/marca/ass6.jpg)

# Arquitetura e Organização de Computadores - Aula 13

- [Assunto](#assunto)
- [Objetivos](#objetivos)
  * [Espera-se que ao final da aula o aluno saiba responder às seguintes questões:](#espera-se-que-ao-final-da-aula-o-aluno-saiba-responder--s-seguintes-quest-es-)
- [Referências](#refer-ncias)
- [Atividades](#atividades)
  * [Preparando o Ambiente](#preparando-o-ambiente)
  * [Atividade proposta 1](#atividade-proposta-1)
    + [O que deve ser feito?](#o-que-deve-ser-feito-)
    + [O que deve ser entregue?](#o-que-deve-ser-entregue-)
  * [Atividade proposta 2](#atividade-proposta-2)
    + [O que deve ser feito?](#o-que-deve-ser-feito--1)
    + [O que deve ser entregue?](#o-que-deve-ser-entregue--1)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>

---


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
* [Usando o Mars da Linha de Comando](https://courses.missouristate.edu/KenVollmar/mars/Help/MarsHelpCommand.html)
* [Syscall functions do Mars](http://courses.missouristate.edu/kenvollmar/mars/help/syscallhelp.html)
* [Bubble Sort](https://en.wikipedia.org/wiki/Bubble_sort)
* [GCD de Euclides](https://en.wikipedia.org/wiki/Euclidean_algorithm)
* Referências das aulas anteriores, disponveis no Moodle


## Atividades

Na descrição dessas atividades, utilizaremos o Mars via linha de comando (terminal no linux, prompt no windows) para facilitar a descrição dos procedimentos. Não é necessário utilizar a linha de comando: você pode utilizar a interface gráfica.

### Preparando o Ambiente

1. Crie uma pasta em seu computador. No restante desse tutorial, chamaremos esta pasta de `$ATIVIDADE`;

1. Faça o download (ou melhor, [clone](https://help.github.com/articles/cloning-a-repository/)) o conteúdo do repositório da aula. Armazene esse conteúdo dentro da pasta `$ATIVIDADE/aula-13`;

1. Faça o download do Mars para o diretório `$ATIVIDADE`. No restante desse tutorial, consideraremos que o arquivo baixado seja o `Mars4_5.jar`;

1. Verifique se sua estrutura de diretórios está correta. Ela deve se parecer com isso:
    ```
    .
    ├── aula-13
    │   ├── bubble
    │   │   └── bubble.asm
    │   ├── gcd
    │   │   ├── gcd_iter.asm
    │   │   └── gcd_test.asm
    │   ├── LICENSE
    │   └── README.md
    └── Mars4_5.jar

    ```
  
1. Abra um terminal/prompt na pasta `$ATIVIDADE` e execute o seguinte comando:
    ```
    $ java -jar Mars4_5.jar 0x10010000-0x10010010 aula-13/bubble/bubble.asm
    ```
1. A saída abaixo deve ser obtida. Se isso não ocorreu, verifique sua estrutura de diretórios. Caso você esteja executando via interface gráfica, verifique se os endereços de memória correspondentes contêm os valores apresentados abaixo.

    ```
    MARS 4.5  Copyright 2003-2014 Pete Sanderson and Kenneth Vollmar

    Mem[0x10010000]	0x00000001	0x00000002	0x00000003	0x00000004	
    Mem[0x10010010]	0x00000005
    ```

### Atividade proposta 1

Nesta atividade, você irá implementar o algoritmo de cálculo do Máximo Divisor Comum de Euclides, na sua versão recursiva. O algoritmo iterativo foi dado como modelo de referência: seu algoritmo deve apresentar o mesmo resultado. Para executar a versão iterativa, execute o seguinte comando:

```
$ java -jar Mars4_5.jar aula-13/gcd/gcd_test.asm aula-13/gcd/gcd_iter.asm
```
  
Após executar esse comando, a seguinte saída deve ser apresentada. Veja o conteúdo do arquivo `aula-13/gcd/gcd_test.asm` para entender o significado dos valores apresentados.

```
6
4
1
21
```
    
#### O que deve ser feito?

Você deve criar um arquivo `aula-13/gcd/gcd_recur.asm` a partir da versão iterativa fornecida e implementar o algoritmo GCD de Euclides na forma recursiva. Para testar seu algoritmo, você deve executar:

```
$ java -jar Mars4_5.jar aula-13/gcd/gcd_test.asm aula-13/gcd/gcd_recur.asm
```

Os resultados apresentados devem ser os mesmos apresentados pela versão iterativa.

#### O que deve ser entregue?

Entregue, via moodle, o arquivo `gcd_recur.asm` criado por você.


### Atividade proposta 2

Nesta atividade, você irá verificar o comportamento da pilha em algoritmos recursivos e algoritmos iterativos. Para isso, irá utilizar os códigos desenvolvidos na atividade 1 e os códigos de exemplo fornecidos pelo professor.

Analise o código abaixo, usado para imprimir, usando `syscall` o valor do registrador $sp. Ele foi concebido para não gerar efeitos colaterais (*side effects*) indesejados no que diz respeito a registradores. 

```assembly
print_sp:
    addi    $sp, $sp, -8
    sw      $a0, 0($sp)
    sw      $v0, 4($sp)
    li      $a0, '\t'
    li      $v0, 11
    syscall
    addi    $a0, $sp, 8
    li      $v0, 34
    syscall
    li      $a0, '\n'
    li      $v0, 11
    syscall
    lw      $a0, 0($sp)
    lw      $v0, 4($sp)
    addi    $sp, $sp, 8
    jr      $ra
```
 Adicione o trecho de código acima no arquivo de solução para o GCD de Euclides (não entregue a versão com esta alteração), adicione a chamada a esta função usando `jal print_sp` em algum local apropriado para observar o comportamento da pilha durante a execução do programa. Execute o programa e observe a saída. 


#### O que deve ser feito?

Após executar o programa modificado, responda às seguintes perguntas:

1. Quantas vezes ocorreu a chamada recursiva para cada um dos 4 pares de valores testados pelo programa do arquivo `gcd_test.asm`?

1. Quantas posições de memória foram necessárias para armazenar a pilha durante a execução de cada um dos 4 pares de valores testados pelo programa do arquivo `gcd_test.asm`?

1. Analise o programa iterativo fornecido pelo professor e informe quantas posições de memória foram necessárias para armazenar a pilha durante a execução de cada um dos 4 pares de valores testados. 

1. Expresse quais as vantagens e desvantagens do algoritmo recursivo, em relação ao algoritmo iterativo.

#### O que deve ser entregue?

Entregue, via moodle, as respostas das perguntas propostas.

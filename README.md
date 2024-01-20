## Descrição do Projeto

Este projeto visa automatizar a Avaliação Experimental dos Resultados de um algoritmo para a cadeira de ASA, focando-se na análise e registro dos tempos de execução. A automação envolve a compilação de um gerador em C++, geração de testes, execução dos testes, avaliação do tempo e armazenamento dos dados em arquivos JSON. Além disso, há um script em Node.js que processa esses tempos e gera uma planilha Excel com métricas importantes que serão mais tarde convertidas a um gráfico com as funcionalidades do excel e exportado para o relatório final.

## Requisitos do Sistema

Certifique-se de ter os seguintes requisitos instalados em sua máquina:

* Compilador C++
* Node.js
* npm (Node Package Manager)
* [Hyperfine](https://github.com/sharkdp/hyperfine)

## Instruções de Uso

1. Clone este repositório:

   ```bash
   git clone git@github.com:Francisca105/gerador-excel-asa.git
   ```
2. Coloque o gerador dentro da pasta principal do projeto.
3. Execute o script `testes.sh`:

   ```bash
   ./testes.sh
   ```
4. Altere as variáveis no script para o intervalo desejado. Certifique-se de ter pelo menos 10 entradas para gerar um gráfico adequado para o relatório.
5. Altere a etapa para 1, verificando os argumentos que deseja passar ao executar o gerador. Execute novamente o script `(3)`.
6. Altere a etapa para 2 e execute novamente o script `(3)`.
7. Após a terceira execução do script, os tempos do algoritmo serão gerados nos arquivos `tX.out` dentro da pasta `testes/out`.
8. Instale as packages associadas ao projeto:

   ```bash
   npm install
   ```
9. Altere as variáveis iniciais conforme definido nos comentários do script e execute o script responsável pelo Excel:

   ```bash
   node .
   ```

## Estrutura do Projeto

* `testes.sh`: Script para compilar o gerador em C++, gerar testes, executar os testes e avaliar os tempos.
* `script.js`: Script Node.js para processar os tempos e gerar uma planilha Excel.

## Resultados

Os resultados dos tempos de execução são armazenados nos arquivos JSON na pasta `tests/out` e o excel na pasta principal com o nome `teste.xlsx`.

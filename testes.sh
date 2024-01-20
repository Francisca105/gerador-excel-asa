#!/bin/bash
# Script para gerar os testes e rodar o hyperfine

# Pode ser necessário dar permissão de execução:
# chmod +x testes.sh

# Para correr o script:
# ./testes.sh

# Variaveis
incremento=250
inicio=0
fim=1000

# Etapa
# 0 - Compilar o gerador
# 1 - Gerar os testes com um gerador fornecido pelo professor
# 2 - Rodar o hyperfine para cada teste gerado e exportar para um json
etapa=0

# 0 - Compilar o gerador
if [ $etapa -eq 0 ]; then
    g++ -std=c++11 -O2 -Wall -Wextra -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wcast-qual -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fno-sanitize-recover -fstack-protector -o gen gen.cpp
fi

# 1 - Gerar os testes
if [ $etapa -eq 1 ]; then
    for ((X = $inicio; X <= $fim; X += $incremento)); do
        ./gen $X $X 100 > ./testes/in/t$X.in
        # ^ os argumentos do gerador são de exemplo
    done
fi

# 2 - Correr o hyperfine
if [ $etapa -eq 2 ]; then
    for ((X = $inicio; X <= $fim; X += $incremento)); do
        hyperfine "../proj < ./testes/in/t$X.in" --export-json "./testes/out/t$X.json"
        # ^ foi usado o hyperfine, é necessário instalar ou usar o time
        # https://github.com/sharkdp/hyperfine

        # Como alternativa pode ser usado o time, mas o script não está preparado para isso
        # { time -p ../proj < ./testes/in/t$X.in; } 2>&1 | grep real >> output.txt
    done
fi

wait
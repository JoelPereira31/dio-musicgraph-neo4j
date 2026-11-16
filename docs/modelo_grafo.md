# Modelagem do Grafo — MusicGraph

## 1. Visão geral

O MusicGraph é um sistema de recomendação musical desenvolvido com Neo4j, utilizando grafos para representar artistas, músicas, gêneros e preferências dos usuários.

O objetivo é recomendar músicas com base nos gostos compartilhados entre usuários, aplicando filtragem colaborativa.

## 2. Tipos de nós

| Nó | Propriedades | Descrição |
|---|---|---|
| Usuario | nome | Representa um usuário do sistema |
| Artista | nome | Representa um artista musical |
| Musica | titulo, ano (opcional) | Representa uma música |
| Genero | nome | Representa um gênero musical |

## 3. Relacionamentos

| Relacionamento | Origem | Destino | Descrição |
|---|---|---|---|
| CURTIU | Usuario | Musica | Indica que um usuário curtiu uma música |
| INTERPRETA | Artista | Musica | Relaciona um artista às músicas que interpreta |
| PERTENCE_A | Musica | Genero | Associa uma música ao seu gênero musical |

## 4. Estrutura do grafo

```text
(Usuario)-[:CURTIU]->(Musica)

(Artista)-[:INTERPRETA]->(Musica)

(Musica)-[:PERTENCE_A]->(Genero)
```

## 5. Dataset utilizado

O banco de dados contém:

- 3 usuários
- 4 artistas
- 11 músicas
- 2 gêneros musicais
- 10 relacionamentos CURTIU
- 11 relacionamentos INTERPRETA
- 11 relacionamentos PERTENCE_A

**Total: 20 nós e 32 relacionamentos.**

## 6. Algoritmo de recomendação

O sistema utiliza filtragem colaborativa baseada em usuários.

O algoritmo identifica usuários com músicas curtidas em comum e recomenda outras músicas que esses usuários semelhantes curtiram.

As músicas já curtidas pelo usuário-alvo são excluídas das recomendações.

A pontuação é calculada pela soma das quantidades de músicas compartilhadas com cada usuário semelhante que curtiu a música recomendada.

## 7. Limitações do modelo

O projeto utiliza um dataset fictício e reduzido para fins educacionais.

A classificação musical foi simplificada, e as preferências estão concentradas no gênero Rock Alternativo.

A identificação das músicas pelo título é adequada ao exemplo, mas um catálogo maior deve utilizar identificadores únicos para evitar conflitos entre músicas com títulos iguais.

O algoritmo também depende de preferências compartilhadas entre usuários, podendo não gerar recomendações para usuários novos sem histórico de curtidas.
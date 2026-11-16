
//
// MusicGraph - Recomendacao colaborativa
// Desafio DIO - Neo4j
//
// Recomenda musicas com base nos gostos de
// outros usuarios com preferencias semelhantes.
//
// Altere 'Ana' para 'Bruno' ou 'Carla'
// para gerar recomendacoes personalizadas.
//

// 1. Encontrar usuarios que curtiram
// pelo menos uma musica em comum.
MATCH (usuario:Usuario {nome: 'Ana'})
      -[:CURTIU]->(musica:Musica)
      <-[:CURTIU]-(similar:Usuario)

WHERE usuario <> similar

// 2. Calcular a similaridade entre usuarios.
WITH usuario, similar,
     count(DISTINCT musica) AS gostos_em_comum

// 3. Encontrar outras musicas curtidas
// pelos usuarios semelhantes.
MATCH (similar)-[:CURTIU]->(recomendacao:Musica)

// 4. Excluir musicas que o usuario
// ja curtiu.
WHERE NOT EXISTS {
  MATCH (usuario)-[:CURTIU]->(recomendacao)
}

// 5. Calcular e ordenar as recomendacoes.
RETURN
  recomendacao.titulo AS musica_recomendada,
  count(DISTINCT similar) AS usuarios_semelhantes,
  sum(gostos_em_comum) AS pontuacao

ORDER BY pontuacao DESC, musica_recomendada;

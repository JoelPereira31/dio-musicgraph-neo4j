
//
// MusicGraph - Consultas de analise musical
// Desafio DIO - Neo4j
//
// Consultas para explorar o catalogo,
// os usuarios e suas preferencias.
//

// CONSULTA 1 - Musicas mais curtidas
MATCH (u:Usuario)-[:CURTIU]->(m:Musica)
RETURN
  m.titulo AS musica,
  count(DISTINCT u) AS total_curtidas
ORDER BY total_curtidas DESC, musica;


// CONSULTA 2 - Artistas mais populares
MATCH (u:Usuario)-[:CURTIU]->(m:Musica)
      <-[:INTERPRETA]-(a:Artista)
RETURN
  a.nome AS artista,
  count(*) AS total_curtidas
ORDER BY total_curtidas DESC, artista;


// CONSULTA 3 - Preferencias por genero
MATCH (u:Usuario)-[:CURTIU]->(m:Musica)
      -[:PERTENCE_A]->(g:Genero)
RETURN
  g.nome AS genero,
  count(*) AS total_curtidas
ORDER BY total_curtidas DESC, genero;


// CONSULTA 4 - Quantidade de musicas
// curtidas por usuario
MATCH (u:Usuario)
OPTIONAL MATCH (u)-[:CURTIU]->(m:Musica)
RETURN
  u.nome AS usuario,
  count(m) AS musicas_curtidas
ORDER BY musicas_curtidas DESC, usuario;


// CONSULTA 5 - Resumo do banco de dados
MATCH (n)
WITH count(n) AS total_nos
MATCH ()-[r]->()
RETURN
  total_nos,
  count(r) AS total_relacionamentos;

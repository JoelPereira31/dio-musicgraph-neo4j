
//
// MusicGraph - Carga do catalogo musical
// Desafio DIO - Neo4j
//
// Cadastra artistas, musicas e generos.
// Execute apos 01_estrutura.cypher.
//
// MERGE evita duplicar os registros.
//

UNWIND [
  {artista: 'Coldplay', musica: 'Yellow', genero: 'Rock Alternativo', ano: null},
  {artista: 'Coldplay', musica: 'Clocks', genero: 'Rock Alternativo', ano: 2002},
  {artista: 'Coldplay', musica: 'The Scientist', genero: 'Rock Alternativo', ano: 2002},
  {artista: 'Coldplay', musica: 'Fix You', genero: 'Rock Alternativo', ano: 2005},
  {artista: 'Coldplay', musica: 'Viva la Vida', genero: 'Rock Alternativo', ano: 2008},

  {artista: 'Imagine Dragons', musica: 'Radioactive', genero: 'Rock Alternativo', ano: null},
  {artista: 'Imagine Dragons', musica: 'Demons', genero: 'Rock Alternativo', ano: null},

  {artista: 'Linkin Park', musica: 'Numb', genero: 'Rock Alternativo', ano: null},
  {artista: 'Linkin Park', musica: 'In the End', genero: 'Rock Alternativo', ano: null},

  {artista: 'Adele', musica: 'Someone Like You', genero: 'Pop', ano: null},
  {artista: 'Adele', musica: 'Rolling in the Deep', genero: 'Pop', ano: null}
] AS dados

MERGE (a:Artista {nome: dados.artista})
MERGE (m:Musica {titulo: dados.musica})
MERGE (g:Genero {nome: dados.genero})

FOREACH (_ IN CASE WHEN dados.ano IS NOT NULL THEN [1] ELSE [] END |
  SET m.ano = dados.ano
)

MERGE (a)-[:INTERPRETA]->(m)
MERGE (m)-[:PERTENCE_A]->(g)

RETURN
  a.nome AS artista,
  m.titulo AS musica,
  g.nome AS genero,
  m.ano AS ano
ORDER BY artista, musica;

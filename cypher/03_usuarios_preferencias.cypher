
//
// MusicGraph - Usuarios e preferencias musicais
// Desafio DIO - Neo4j
//
// Cadastra usuarios e suas musicas favoritas.
// Execute apos 02_catalogo_musical.cypher.
//
// MERGE evita duplicacao de relacionamentos.
//

// Criar usuarios
UNWIND ['Ana', 'Bruno', 'Carla'] AS nome
MERGE (:Usuario {nome: nome});

// Criar preferencias musicais
UNWIND [
  {usuario: 'Ana', musica: 'Yellow'},
  {usuario: 'Ana', musica: 'Clocks'},
  {usuario: 'Ana', musica: 'Fix You'},

  {usuario: 'Bruno', musica: 'Yellow'},
  {usuario: 'Bruno', musica: 'Numb'},
  {usuario: 'Bruno', musica: 'Clocks'},
  {usuario: 'Bruno', musica: 'Fix You'},

  {usuario: 'Carla', musica: 'Numb'},
  {usuario: 'Carla', musica: 'Demons'},
  {usuario: 'Carla', musica: 'Clocks'}
] AS dados

MATCH (u:Usuario {nome: dados.usuario})
MATCH (m:Musica {titulo: dados.musica})

MERGE (u)-[:CURTIU]->(m)

RETURN
  u.nome AS usuario,
  m.titulo AS musica_curtida
ORDER BY usuario, musica_curtida;

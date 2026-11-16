
//
// MusicGraph - Estrutura do banco de dados
// Desafio DIO - Neo4j
//
// Define restricoes de unicidade para os nos.
// Execute antes dos scripts de carga.
//

CREATE CONSTRAINT usuario_nome_unico IF NOT EXISTS
FOR (u:Usuario)
REQUIRE u.nome IS UNIQUE;

CREATE CONSTRAINT artista_nome_unico IF NOT EXISTS
FOR (a:Artista)
REQUIRE a.nome IS UNIQUE;

CREATE CONSTRAINT musica_titulo_unico IF NOT EXISTS
FOR (m:Musica)
REQUIRE m.titulo IS UNIQUE;

CREATE CONSTRAINT genero_nome_unico IF NOT EXISTS
FOR (g:Genero)
REQUIRE g.nome IS UNIQUE;

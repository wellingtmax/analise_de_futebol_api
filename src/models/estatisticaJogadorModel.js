const conexao = require('../config/database');

const listarEstatisticasJogadores = (callback) => {

    const sql = `
        SELECT
            ej.*,

            j.nome AS nome_jogador,
            j.foto,

            t.nome AS nome_time,

            p.data_partida

        FROM estatisticas_jogadores ej

        LEFT JOIN jogadores j
        ON ej.id_jogador = j.id_jogador

        LEFT JOIN times t
        ON j.id_time = t.id_time

        LEFT JOIN partidas p
        ON ej.id_partida = p.id_partida
    `;

    conexao.query(sql, callback);
};

const cadastrarEstatisticaJogador = (dados, callback) => {

    const sql = `
        INSERT INTO estatisticas_jogadores
        (
            id_jogador,
            id_partida,
            gols,
            assistencias,
            finalizacoes,
            passes_certos,
            passes_errados,
            cartoes_amarelos,
            cartoes_vermelhos,
            minutos_jogados,
            nota_desempenho,
            dribles_certos,
            dribles_errados,
            desarmes,
            interceptacoes,
            chutes_gol,
            precisao_passe,
            velocidade_maxima,
            distancia_percorrida
        )
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    const valores = [
        dados.id_jogador,
        dados.id_partida,
        dados.gols,
        dados.assistencias,
        dados.finalizacoes,
        dados.passes_certos,
        dados.passes_errados,
        dados.cartoes_amarelos,
        dados.cartoes_vermelhos,
        dados.minutos_jogados,
        dados.nota_desempenho,
        dados.dribles_certos,
        dados.dribles_errados,
        dados.desarmes,
        dados.interceptacoes,
        dados.chutes_gol,
        dados.precisao_passe,
        dados.velocidade_maxima,
        dados.distancia_percorrida
    ];

    conexao.query(sql, valores, callback);
};

module.exports = {
    listarEstatisticasJogadores,
    cadastrarEstatisticaJogador
};
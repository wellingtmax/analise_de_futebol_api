const conexao = require('../config/database');

const listarEstatisticasPartidas = (callback) => {

    const sql = `
        SELECT
            ep.*,
            p.data_partida,
            mandante.nome AS time_mandante,
            visitante.nome AS time_visitante

        FROM estatisticas_partidas ep

        LEFT JOIN partidas p
        ON ep.id_partida = p.id_partida

        LEFT JOIN times mandante
        ON p.id_time_mandante = mandante.id_time

        LEFT JOIN times visitante
        ON p.id_time_visitante = visitante.id_time
    `;

    conexao.query(sql, callback);
};

const cadastrarEstatisticaPartida = (dados, callback) => {

    const sql = `
        INSERT INTO estatisticas_partidas
        (
            id_partida,
            total_gols,
            total_cartoes_amarelos,
            total_cartoes_vermelhos,
            total_finalizacoes,
            total_escanteios,
            total_faltas,
            melhor_jogador,
            melhor_time,
            publico,
            clima,
            resumo_partida,
            tempo_adicional_primeiro_tempo,
            tempo_adicional_segundo_tempo
        )
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    const valores = [
        dados.id_partida,
        dados.total_gols,
        dados.total_cartoes_amarelos,
        dados.total_cartoes_vermelhos,
        dados.total_finalizacoes,
        dados.total_escanteios,
        dados.total_faltas,
        dados.melhor_jogador,
        dados.melhor_time,
        dados.publico,
        dados.clima,
        dados.resumo_partida,
        dados.tempo_adicional_primeiro_tempo,
        dados.tempo_adicional_segundo_tempo
    ];

    conexao.query(sql, valores, callback);
};

module.exports = {
    listarEstatisticasPartidas,
    cadastrarEstatisticaPartida
};
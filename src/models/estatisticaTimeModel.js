const conexao = require('../config/database');

const listarEstatisticasTimes = (callback) => {
    const sql = `
        SELECT
            et.*,
            t.nome AS nome_time,
            p.data_partida,
            mandante.nome AS time_mandante,
            visitante.nome AS time_visitante
        FROM estatisticas_times et
        LEFT JOIN times t ON et.id_time = t.id_time
        LEFT JOIN partidas p ON et.id_partida = p.id_partida
        LEFT JOIN times mandante ON p.id_time_mandante = mandante.id_time
        LEFT JOIN times visitante ON p.id_time_visitante = visitante.id_time
    `;

    conexao.query(sql, callback);
};

const cadastrarEstatisticaTime = (dados, callback) => {
    const sql = `
        INSERT INTO estatisticas_times
        (
            id_time,
            id_partida,
            posse_bola,
            finalizacoes,
            finalizacoes_gol,
            passes_certos,
            passes_errados,
            faltas,
            escanteios,
            impedimentos,
            cartoes_amarelos,
            cartoes_vermelhos,
            xg
        )
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    const valores = [
        dados.id_time,
        dados.id_partida,
        dados.posse_bola,
        dados.finalizacoes,
        dados.finalizacoes_gol,
        dados.passes_certos,
        dados.passes_errados,
        dados.faltas,
        dados.escanteios,
        dados.impedimentos,
        dados.cartoes_amarelos,
        dados.cartoes_vermelhos,
        dados.xg
    ];

    conexao.query(sql, valores, callback);
};

module.exports = {
    listarEstatisticasTimes,
    cadastrarEstatisticaTime
};
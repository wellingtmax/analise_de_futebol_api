const conexao = require('../config/database');

const listarPartidas = (callback) => {

    const sql = `
        SELECT
            partidas.*,

            mandante.nome AS time_mandante,
            visitante.nome AS time_visitante

        FROM partidas

        LEFT JOIN times AS mandante
        ON partidas.id_time_mandante = mandante.id_time

        LEFT JOIN times AS visitante
        ON partidas.id_time_visitante = visitante.id_time
    `;

    conexao.query(sql, callback);
};

const cadastrarPartida = (dados, callback) => {

    const sql = `
        INSERT INTO partidas
        (
            id_time_mandante,
            id_time_visitante,
            gols_mandante,
            gols_visitante,
            estadio,
            campeonato,
            data_partida,
            status_partida
        )
        VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    `;

    const valores = [
        dados.id_time_mandante,
        dados.id_time_visitante,
        dados.gols_mandante,
        dados.gols_visitante,
        dados.estadio,
        dados.campeonato,
        dados.data_partida,
        dados.status_partida
    ];

    conexao.query(sql, valores, callback);
};

module.exports = {
    listarPartidas,
    cadastrarPartida
};
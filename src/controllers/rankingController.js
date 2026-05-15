const conexao = require('../config/database');

const rankingArtilharia = (req, res) => {

    const sql = `
        SELECT
            j.id_jogador,
            j.nome,
            j.foto,
            t.nome AS nome_time,

            SUM(ej.gols) AS total_gols,
            SUM(ej.assistencias) AS total_assistencias,

            AVG(ej.nota_desempenho) AS media_nota

        FROM estatisticas_jogadores ej

        LEFT JOIN jogadores j
        ON ej.id_jogador = j.id_jogador

        LEFT JOIN times t
        ON j.id_time = t.id_time

        GROUP BY j.id_jogador

        ORDER BY total_gols DESC
    `;

    conexao.query(sql, (erro, resultados) => {

        if (erro) {
            return res.status(500).json({
                erro: erro.message
            });
        }

        res.status(200).json(resultados);
    });
};

const rankingAssistencias = (req, res) => {

    const sql = `
        SELECT
            j.id_jogador,
            j.nome,
            j.foto,
            t.nome AS nome_time,

            SUM(ej.assistencias) AS total_assistencias

        FROM estatisticas_jogadores ej

        LEFT JOIN jogadores j
        ON ej.id_jogador = j.id_jogador

        LEFT JOIN times t
        ON j.id_time = t.id_time

        GROUP BY j.id_jogador

        ORDER BY total_assistencias DESC
    `;

    conexao.query(sql, (erro, resultados) => {

        if (erro) {
            return res.status(500).json({
                erro: erro.message
            });
        }

        res.status(200).json(resultados);
    });
};

module.exports = {
    rankingArtilharia,
    rankingAssistencias
};
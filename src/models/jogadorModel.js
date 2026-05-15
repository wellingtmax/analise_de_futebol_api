const conexao = require('../config/database');

const listarJogadores = (callback) => {
    const sql = `
        SELECT
            jogadores.*,
            times.nome AS nome_time
        FROM jogadores
        LEFT JOIN times
        ON jogadores.id_time = times.id_time
    `;

    conexao.query(sql, callback);
};

const cadastrarJogador = (dados, callback) => {
    const sql = `
        INSERT INTO jogadores
        (
            nome, idade, posicao, numero_camisa, nacionalidade, id_time,
            foto, altura, peso, pe_dominante, overall,
            velocidade, finalizacao, passe, defesa
        )
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    `;

    const valores = [
        dados.nome,
        dados.idade,
        dados.posicao,
        dados.numero_camisa,
        dados.nacionalidade,
        dados.id_time,
        dados.foto,
        dados.altura,
        dados.peso,
        dados.pe_dominante,
        dados.overall,
        dados.velocidade,
        dados.finalizacao,
        dados.passe,
        dados.defesa
    ];

    conexao.query(sql, valores, callback);
};

module.exports = {
    listarJogadores,
    cadastrarJogador
};
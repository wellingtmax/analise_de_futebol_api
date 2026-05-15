const conexao = require('../config/database');


const buscarTimes = (callback) => {
    const sql = `SELECT * FROM times`;

    conexao.query(sql, callback);
};

const criarTime = (dados, callback) => {
    const sql = `
    INSERT INTO times (nome, pais, liga, tecnico, escudo) VALUES (?, ?, ?, ?, ?)`;

    const valores = [
        dados.nome,
        dados.pais,
        dados.liga,
        dados.tecnico,
        dados.escudo
    ];

    conexao.query(sql, valores, callback);
};

module.exports = {
    buscarTimes,
    criarTime
}
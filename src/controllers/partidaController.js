const partidaModel = require('../models/partidaModel');

const buscarPartidas = (req, res) => {

    partidaModel.listarPartidas((erro, resultados) => {

        if (erro) {
            return res.status(500).json({
                erro: erro.message
            });
        }

        res.status(200).json(resultados);
    });
};

const criarPartida = (req, res) => {

    const dados = req.body;

    partidaModel.cadastrarPartida(dados, (erro, resultado) => {

        if (erro) {
            return res.status(500).json({
                erro: erro.message
            });
        }

        res.status(201).json({
            mensagem: 'Partida cadastrada com sucesso!',
            id: resultado.insertId
        });
    });
};

module.exports = {
    buscarPartidas,
    criarPartida
};
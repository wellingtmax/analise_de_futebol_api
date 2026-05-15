const estatisticaPartidaModel = require('../models/estatisticaPartidaModel');

const buscarEstatisticasPartidas = (req, res) => {

    estatisticaPartidaModel.listarEstatisticasPartidas((erro, resultados) => {

        if (erro) {
            return res.status(500).json({
                erro: erro.message
            });
        }

        res.status(200).json(resultados);
    });
};

const cadastrarEstatisticaPartida = (req, res) => {

    const dados = req.body;

    estatisticaPartidaModel.cadastrarEstatisticaPartida(dados, (erro, resultado) => {

        if (erro) {
            return res.status(500).json({
                erro: erro.message
            });
        }

        res.status(201).json({
            mensagem: 'Estatística da partida cadastrada com sucesso!',
            id: resultado.insertId
        });
    });
};

module.exports = {
    buscarEstatisticasPartidas,
    cadastrarEstatisticaPartida
};
const estatisticaJogadorModel = require('../models/estatisticaJogadorModel');

const buscarEstatisticasJogadores = (req, res) => {

    estatisticaJogadorModel.listarEstatisticasJogadores((erro, resultados) => {

        if (erro) {
            return res.status(500).json({
                erro: erro.message
            });
        }

        res.status(200).json(resultados);
    });
};

const cadastrarEstatisticaJogador = (req, res) => {

    const dados = req.body;

    estatisticaJogadorModel.cadastrarEstatisticaJogador(dados, (erro, resultado) => {

        if (erro) {
            return res.status(500).json({
                erro: erro.message
            });
        }

        res.status(201).json({
            mensagem: 'Estatística do jogador cadastrada com sucesso!',
            id: resultado.insertId
        });
    });
};

module.exports = {
    buscarEstatisticasJogadores,
    cadastrarEstatisticaJogador
};
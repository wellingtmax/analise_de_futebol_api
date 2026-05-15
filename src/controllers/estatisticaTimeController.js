const estatisticaTimeModel = require('../models/estatisticaTimeModel');

const buscarEstatisticasTimes = (req, res) => {
    estatisticaTimeModel.listarEstatisticasTimes((erro, resultados) => {
        if (erro) {
            return res.status(500).json({
                erro: 'Erro ao buscar estatísticas dos times',
                detalhe: erro.message
            });
        }

        res.status(200).json(resultados);
    });
};

const cadastrarEstatisticaTime = (req, res) => {
    const dados = req.body;

    estatisticaTimeModel.cadastrarEstatisticaTime(dados, (erro, resultado) => {
        if (erro) {
            return res.status(500).json({
                erro: 'Erro ao cadastrar estatística do time',
                detalhe: erro.message
            });
        }

        res.status(201).json({
            mensagem: 'Estatística do time cadastrada com sucesso!',
            id: resultado.insertId
        });
    });
};

module.exports = {
    buscarEstatisticasTimes,
    cadastrarEstatisticaTime
};
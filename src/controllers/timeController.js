const timeModel = require('../models/timeModel');

const listarTimes = (req, res) => {

    timeModel.buscarTimes((erro, resultados) => {

        if (erro) {
            return res.status(500).json({
                erro: 'Erro ao buscar os times'
            });
        }
     res.status(200).json(resultados);
    });
};

const cadastrarTime = (req, res) => {
    const dados = req.body

    timeModel.criarTime(dados, (erro, resultado) => {

        if (erro) {
            return res.status(500).json({
                erro: 'Erro ao criar o time'
            });
        }

        res.status(201).json({
            mensagem: 'Time criado com sucesso!',
            id: resultado.insertId
        });
    })
}


module.exports = {
    listarTimes,
    cadastrarTime
}  
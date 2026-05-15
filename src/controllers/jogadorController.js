const jogadorModel = require('../models/jogadorModel');

const buscarJogadores = (req, res) => {

    jogadorModel.listarJogadores((erro, resultados) => {

        if (erro) {
            return res.status(500).json({
                erro: 'Erro ao buscar jogadores'
            })
        }

        res.status(200).json(resultados);
    });
};

const criarJogador = (req, res) => {
    const dados = req.body;

    jogadorModel.cadastrarJogador(dados, (erro, resultado) => {

        if (erro) {
            console.error('Erro MySQL:', erro.message);


            return res.status(500).json({
                erro: 'Erro ao cadastrar jogador',
                detalhes: erro.message
            });
        }

        res.status(201).json({
            mensagem: 'Jogador cadastrado com sucesso',
            id: resultado.insertId
        });
    });
};

module.exports = {
    buscarJogadores,
    criarJogador
}
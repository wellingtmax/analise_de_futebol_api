const express = require('express');

const router = express.Router();

const estatisticaJogadorController = require('../controllers/estatisticaJogadorController');

router.get(
    '/estatisticas-jogadores',
    estatisticaJogadorController.buscarEstatisticasJogadores
);

router.post(
    '/estatisticas-jogadores',
    estatisticaJogadorController.cadastrarEstatisticaJogador
);

module.exports = router;
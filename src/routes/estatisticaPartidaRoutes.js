const express = require('express');

const router = express.Router();

const estatisticaPartidaController = require('../controllers/estatisticaPartidaController');

router.get(
    '/estatisticas-partidas',
    estatisticaPartidaController.buscarEstatisticasPartidas
);

router.post(
    '/estatisticas-partidas',
    estatisticaPartidaController.cadastrarEstatisticaPartida
);

module.exports = router;
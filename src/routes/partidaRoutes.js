const express = require('express');

const router = express.Router();

const partidaController = require('../controllers/partidaController');

router.get('/partidas', partidaController.buscarPartidas);

router.post('/partidas', partidaController.criarPartida);

module.exports = router;
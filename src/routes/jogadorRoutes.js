const express = require('express');

const router = express.Router();

const jogadorController = require('../controllers/jogadorController');

router.get('/jogadores', jogadorController.buscarJogadores);

router.post('/jogadores', jogadorController.criarJogador);

module.exports = router;
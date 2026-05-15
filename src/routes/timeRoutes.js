const express = require('express');
const router = express.Router();

const timeController = require('../controllers/timeController');

// Rota para listar os times
router.get('/times', timeController.listarTimes);

// Rota para criar um novo time
router.post('/times', timeController.cadastrarTime);

module.exports =router;
const express = require('express');
const router = express.Router();

const estatisticaTimeController = require('../controllers/estatisticaTimeController');

router.get('/estatisticas-times', estatisticaTimeController.buscarEstatisticasTimes);

router.post('/estatisticas-times', estatisticaTimeController.cadastrarEstatisticaTime);

module.exports = router;
const express = require('express');

const router = express.Router();

const rankingController = require('../controllers/rankingController');

router.get(
    '/ranking/artilharia',
    rankingController.rankingArtilharia
);

router.get(
    '/ranking/assistencias',
    rankingController.rankingAssistencias
);

module.exports = router;
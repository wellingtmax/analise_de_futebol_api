const express = require('express');
const cors = require('cors');

require('dotenv').config();
require('./config/database');

const timeRoutes = require('./routes/timeRoutes');
const jogadorRoutes = require('./routes/jogadorRoutes');
const partidaRoutes = require('./routes/partidaRoutes');
const estatisticaPartidaRoutes = require('./routes/estatisticaPartidaRoutes');
const estatisticaTimeRoutes = require('./routes/estatisticaTimeRoutes');
const estatisticaJogadorRoutes = require('./routes/estatisticaJogadorRoutes');
const rankingRoutes = require('./routes/rankingRoutes');

const app = express();


app.use(cors());
app.use(express.json());
app.use('/api', timeRoutes);
app.use('/api', jogadorRoutes);
app.use('/api', partidaRoutes);
app.use('/api', estatisticaPartidaRoutes);
app.use('/api', estatisticaTimeRoutes);
app.use('/api', estatisticaJogadorRoutes);
app.use('/api', rankingRoutes);

//Rota inicial para testar se o servidor esta funcionando
app.get('/', (req, res) => {
    res.json({
        mensagem: 'API de Analise de Futebol rodando com sucesso!'
    });
});

//Porta do servidor
const PORT = process.env.PORT || 3000;

app.listen(PORT, () => {
    console.log(`Servidor rodando na porta ${PORT}`)
});
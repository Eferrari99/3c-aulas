//importando a biblioteca express
const express = require('express');

//criando a aplicação
const app = express();

//defiinindo uma rota que retorna "Ola mundo!"
app.get('/', (req, res) => {
    res.json({mensagem: "Ola mundo!"});
});
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`servidor rodando em http://localhost:${PORT}`);
});
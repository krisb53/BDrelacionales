const express = require('express')
const db = require('./db');

const app = express()
const PORT = process.env.PORT || 3000;

app.use(express.json())



app.get('/status', (req,res) => {
    res.json({mensaje: 'Api is active'})

})
    
    app.get('/jugadores', (req,res) => {
        const sql = 'SELECT * FROM jugadores'
    
    
    db.query(sql, (err, results) => {
        if(err){
            return res.status(500) .json ({error: err.message})
        }
        res.json(results)
    })
        

})
    
    app.listen(PORT, () => {
    console.log('Servidor corriendo en http://localhost:3000')
})
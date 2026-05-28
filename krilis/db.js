const mysql = require('mysql2')
require('dotenv').config()

const connection = mysql.createConnection({
    host:          process.envDB_HOST,
    port:          process.env.DB_PORT,
    user:          process.env.DB_USER,
    password:      process.env.DB_PASSWORD,
    name:          process.env.DB_NAME,
});

connection.connect((err)=> {
    if(err){
        console.error('Error al conectar a la BD:', Err.MESSAGE);
        Process.EXIT(1);
    }
    console.log('Conectado a MySQL Correctamente');
});
module.exports = connection;
const mongoose = require('mongoose');
const { MONGO_URI } = require('./keys');

const connection = mongoose.createConnection(MONGO_URI);

mongoose.connection.on('error', (error) => console.log(error));

module.exports = connection;

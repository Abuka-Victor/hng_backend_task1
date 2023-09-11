const dotenv = require('dotenv');

dotenv.config();

const { MONGO_URI, PORT } = process.env;
module.exports = {
  MONGO_URI,
  PORT,
};

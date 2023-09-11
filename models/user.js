const connection = require('../config/database');
const Schema = require('mongoose').Schema;

const UserSchema = new Schema(
  {
    name: String,
  },
  { timestamps: true }
);

const UserModel = connection.model('User', UserSchema);

module.exports = UserModel;

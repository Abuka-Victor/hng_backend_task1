const express = require('express');
const UserModel = require('../models/user');

const task2Router = express.Router();

task2Router.get('/', async (req, res) => {
  const users = await UserModel.find();
  res.status(200).json({
    data: { persons: users, count: users.length },
    status: 200,
    message:
      users.length > 0 ? 'Successfully retrieved persons' : 'No persons found',
  });
});

task2Router.get('/:id', async (req, res) => {
  let user = await UserModel.findOne({ id: req.params.id });
  if (user === null) {
    user = await UserModel.findOne({ name: req.params.id });
  }
  if (user === null) {
    return res.status(404).json({
      status: 404,
      message: 'User not found',
    });
  }
  res.status(200).json({
    data: { person: user },
    status: 200,
    message: 'Successfully retrieved person',
  });
});

task2Router.post('/', async (req, res) => {
  const { name } = req.body;
  const user = await UserModel.create({ name: name });
  res.status(201).json({
    data: { person: user },
    status: 201,
    message: 'Successfully created person',
  });
});

task2Router.patch('/:id', async (req, res) => {
  let user = await UserModel.findOne({ id: req.params.id });
  if (user === null) {
    user = await UserModel.findOne({ name: req.params.id });
  }
  if (user === null) {
    return res.status(404).json({
      status: 404,
      message: 'User not found',
    });
  }
  const { name } = req.body;
  user.name = name;
  await user.save();
  res.status(200).json({
    data: { person: user },
    status: 200,
    message: 'Successfully updated person',
  });
});

task2Router.delete('/:id', async (req, res) => {
  let user = await UserModel.findOne({ id: req.params.id });
  if (user === null) {
    user = await UserModel.findOne({ name: req.params.id });
  }
  if (user === null) {
    return res.status(404).json({
      status: 404,
      message: 'User not found',
    });
  }
  user.deleteOne();
  res.status(202).json({
    data: { person: user },
    status: 202,
    message: 'Successfully deleted person',
  });
});

module.exports = task2Router;

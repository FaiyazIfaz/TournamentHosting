
const Joi = require('joi');
const jwt = require('jsonwebtoken');
const bodyParser = require('body-parser');
const auth = require("./authController");

const accessTokenSecret = 'fhsu48iah58iuas272hofaoifs532ilafjioasjiof74574suj';

const model = require('../models/User');

const schema = Joi.object({
    username: Joi.string().min(3).required(),
    email: Joi.string().min(3).required(),
    password: Joi.string().min(3).required(),
    type: Joi.number().min(0).max(1).required(),
    id: Joi.optional()
});

const schema2 = Joi.object({
    username: Joi.string().min(3).required(),
    email: Joi.string().min(3).required(),
    password: Joi.string().min(3).required(),
    type: Joi.optional(),
    id: Joi.optional()
});

module.exports = {
    getUser: async (req, res) => {
        const data = await model.getUser(parseInt(req.params.id));
        if (!data) {
            res.status(404).send('The course with the given ID was not found.');
            return;
        }
        res.send(data);
    },

    getAllUsers: async (req, res) => {
        const data = await model.getAllUsers();
        if (!data) {
            res.status(404).send('The course with the given ID was not found.');
            return;
        }
        res.send(data);
    },


    addUser: async (req, res) => {

        const result = schema.validate(req.body);
        if (result.error) {
            res.status(400).send(result.error.details[0].message);
            return;
        }

        const newUser = {
            username: req.body.username,
            email: req.body.email,
            password: req.body.password,
            type: req.body.type,
            id: null
        }

        const data = await model.addUser(newUser);
        res.status(201).send(data);
    },


    login: async (req, res) => {
        // Filter user from the users array by username and password
        const username = req.body.username;
        const password = req.body.password;
        const data = await model.login(username, password);

        console.log(data);

        if (data) {
        // Generate an access token
        const accessToken = jwt.sign({ username: data[0].username,  type: data[0].type, id: data[0].id }, accessTokenSecret);
        
        var user = data[0];
        
        res.status(201).json({
            user,
            accessToken
        });
        } else {
            res.status(404).send('Username or password incorrect');
        }
    },

    updateUser: async (req, res) => {

        const result = schema2.validate(req.body);
        if (result.error) {
            res.status(400).send(result.error.details[0].message);
            return;
        }

        const newUser = {
            username: req.body.username,
            email: req.body.email,
            password: req.body.password,
            type: null,
            id: req.user.id
        }

        const data = await model.updateUser(newUser);
        res.send(data);
    },

    getUsersByTeam: async (req, res) => {
        const data = await model.getUsersByTeam(parseInt(req.params.team));
        if (!data) {
            res.status(404).send('Team does not exist or has no members');
            return;
        }
        res.status(200).send(data);
    },
    getUsersByNoTeam: async (req, res) => {
        const data = await model.getUsersByNoTeam();
        if (!data) {
            res.status(404).send('Team does not exist or has no members');
            return;
        }
        res.status(200).send(data);
    },

    removeUserTeam: async (req, res) => {
        const data = await model.removeUserTeam(parseInt(req.params.user));
        console.log(data);
        if (!data) {
            res.status(404).send('User not found');
            return;
        }
        const result = await model.getUser(parseInt(req.params.user));
        res.send(result);
    },

    updateUserTeam: async (req, res) => {
        const data = await model.updateUserTeam(parseInt(req.params.user), parseInt(req.params.team));
        if (!data) {
            res.status(404).send('User not found');
            return;
        }
        const result = await model.getUser(parseInt(req.params.user));
        console.log(result);
        res.status(200).send(result);
    },

}
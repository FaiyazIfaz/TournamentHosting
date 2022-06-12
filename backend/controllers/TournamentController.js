
const Joi = require('joi');

const model = require('../models/Tournaments');
const auth = require("./authController");

const schema = Joi.object({
    name: Joi.string().required(),
    skillLevel: Joi.string().required(),
    prizePool: Joi.number().required(),
    description: Joi.string().required(),
    id: Joi.optional()
});

module.exports = {

    addTournament: async (req, res) => {

        if(req.user.type!=1){
            res.send(403);
            return
        }

        const result = schema.validate(req.body);
        if (result.error) {
            res.status(400).send(result.error.details[0].message);
            return;
        }

        const newTournament = {
            name: req.body.name,
            skillLevel: req.body.skillLevel,
            prizePool: req.body.prizePool,
            description: req.body.description,
            creator: req.user.id
        }

        const data = await model.addTournament(newTournament);
        res.send(data);
    },

    updateTournament: async (req, res) => {

        if(req.user.type!=1){
            res.send(403);
            return
        }

        const result = schema.validate(req.body);
        if (result.error) {
            res.status(400).send(result.error.details[0].message);
            return;
        }

        const newTournament = {
            id: req.body.id,
            name: req.body.name,
            skillLevel: req.body.skillLevel,
            prizePool: req.body.prizePool,
            description: req.body.description,
            creator: req.user.id
        }

        const data = await model.updateTournament(newTournament);
        res.send(data);
    },

    getAllTournaments: async (req, res) => {
        const data = await model.getAllTournaments();
        res.send(data);
    },

    getTournamentsByCreator: async (req, res) => {
        var creatorId = req.params.id;
        const data = await model.getTournamentsByCreator(creatorId);
        res.send(data);
    }

}
//just a bit of addition to show code working

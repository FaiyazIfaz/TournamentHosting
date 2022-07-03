
const Joi = require('joi'); 

const model = require('../models/Teams');
const auth = require("./authController");

const schema = Joi.object({
    name: Joi.string().required(),
    capacity: Joi.number().required(),
    description: Joi.string().required(),
    id: Joi.optional()
});

module.exports = {

    addTeam: async (req, res) => {

        if(req.user.type!=0){
            res.sendStatus(403);
            return
        }

        const result = schema.validate(req.body);
        if (result.error) {
            res.status(400).send(result.error.details[0].message);
            return;
        }

        const newTeam = {
            name: req.body.name,
            capacity: req.body.capacity,
            description: req.body.description,
            creator: req.user.id
        }

        const data = await model.addTeam(newTeam);
        console.log(data);
        res.send(data);
    },

    getAllTeams: async (req, res) => {
        const data = await model.getAllTeams();
        res.send(data);
    },

    getTeamsByCreator: async (req, res) => {
        var creatorId = req.params.id;
        const data = await model.getTeamsByCreator(creatorId);
        res.send(data);
    },

    updateTeam: async (req, res) => {

        if(req.user.type!=0){
            res.send(403);
            return
        }

        const result = schema.validate(req.body);
        if (result.error) {
            res.status(400).send(result.error.details[0].message);
            return;
        }

        const newTeam = {
            id: req.body.id,
            name: req.body.name,
            capacity: req.body.capacity,
            description: req.body.description,
            creator: req.user.id
        }

        const data = await model.updateTeam(newTeam);
        res.send(data);
    },

    getTeamsByTournament: async (req, res) => {
        const data = await model.getTeamsByTournament(parseInt(req.params.tournament));
        if (!data) {
            res.status(404).send('Team does not exist or has no members');
            return;
        }
        res.status(200).send(data);
    },
    getTeamsByNoTournament: async (req, res) => {
        const data = await model.getteamsByNoTournament();
        if (!data) {
            res.status(404).send('Team does not exist or has no members');
            return;
        }
        res.status(200).send(data);
    },
    
    removeTeamTournament: async (req, res) => {
        const data = await model.removeTeamTournament(parseInt(req.params.team));
        console.log(data);
        if (!data) {
            res.status(404).send('User not found');
            return;
        }
        const result = await model.getTeam(parseInt(req.params.team));
        res.send(result);
    },

    updateTeamTournament: async (req, res) => {
        const data = await model.updateTeamTournament(parseInt(req.params.team), parseInt(req.params.tournament));
        if (!data) {
            res.status(404).send('User not found');
            return;
        }
        const result = await model.getTeam(parseInt(req.params.team));
        console.log(result);
        res.status(200).send(result);
    },

}

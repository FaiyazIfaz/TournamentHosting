
const express = require("express");
const router = express.Router();

const controller = require("../controllers/TeamController");
const auth = require("../controllers/authController");

router.get('/tournament/:tournament', auth.authenticateJWT, controller.getTeamsByTournament);
router.get('/tournament/', auth.authenticateJWT, controller.getTeamsByNoTournament);
router.put('/:team/tournament/:tournament', auth.authenticateJWT, controller.updateTeamTournament);
router.delete('/tournament/:team', auth.authenticateJWT, controller.removeTeamTournament);
router.post('/', auth.authenticateJWT, controller.addTeam);
router.put('/', auth.authenticateJWT, controller.updateTeam);
router.get('/', auth.authenticateJWT, controller.getAllTeams);
router.get('/creator/:id', auth.authenticateJWT, controller.getTeamsByCreator);


module.exports = router;
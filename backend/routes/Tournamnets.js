
const express = require("express");
const router = express.Router();

const controller = require("../controllers/TournamentController");
const auth = require("../controllers/authController");

router.post('/', auth.authenticateJWT, controller.addTournament);
router.put('/', auth.authenticateJWT, controller.updateTournament);
router.get('/', auth.authenticateJWT, controller.getAllTournaments);
router.get('/creator/:id', auth.authenticateJWT, controller.getTournamentsByCreator);


module.exports = router;
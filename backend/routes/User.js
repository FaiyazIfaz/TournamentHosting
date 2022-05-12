// here we have all the routes related to user 



const express = require("express");
const router = express.Router();

const controller = require("../controllers/UserController");
const auth = require("../controllers/authController");

router.get('/', auth.authenticateJWT, controller.getAllUsers);
router.get('/team/:team', auth.authenticateJWT, controller.getUsersByTeam);
router.get('/team/', auth.authenticateJWT, controller.getUsersByNoTeam);
router.put('/:user/team/:team', auth.authenticateJWT, controller.updateUserTeam);
router.delete('/team/:user', auth.authenticateJWT, controller.removeUserTeam);
router.put('/', auth.authenticateJWT, controller.updateUser);
router.get('/:id', auth.authenticateJWT, controller.getUser);
router.post('/', controller.addUser);
// router.put('/:id', controller.addUser);
// router.delete/:id('/', controller.addUser);




module.exports = router;
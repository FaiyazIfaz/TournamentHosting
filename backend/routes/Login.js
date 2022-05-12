// here we have all the routes related to user 



const express = require("express");
const router = express.Router();

const controller = require("../controllers/UserController");


router.post('/', controller.login);




module.exports = router;
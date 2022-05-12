const express = require('express');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');

const accessTokenSecret = 'fhsu48iah58iuas272hofaoifs532ilafjioasjiof74574suj';

module.exports = {

    authenticateJWT: (req, res, next) => {
        const authHeader = req.headers.authorization;
    
        if (authHeader) {
            const token = authHeader.split(' ')[1];
    
            jwt.verify(token, accessTokenSecret, (err, user) => {
                if (err) {
                    return res.sendStatus(403);
                }
                
                req.user = user;
                next();
            });
        } else {
            res.sendStatus(401);
        }
    }

}
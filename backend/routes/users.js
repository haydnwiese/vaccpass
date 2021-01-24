const express = require('express');
const router = express.Router();
const VACCINATION_STATE = require('../util/constants').VACCINATION_STATE;
const usersModel = require('../models/users');

const userCollection = 'users';

router.get('/', async (req, res) => {
    try {
        const users = await usersModel.fetchUserData();
        res.status(200).json(users);
    } catch (error) {
        res.status(500).send(error);
    }
});

router.get('/:userid', async (req, res) => {
    try {
        const data = await usersModel.fetchUserDataById(req.params.userid);
        if (data) {
            res.status(200).json(data);
        } else {
            throw Error('No such user');
        }
    } catch (error) {
        console.log(error)
        res.status(500).send(error);
    }
});

router.post('/register', async (req, res) => {
    try {
        const { body } = req;
        if (!isRegisterBodyValid(body)) throw Error('Invalid request body');

        const userObject = buildUserObject(body);
        
        const userId = await usersModel.registerUser(userObject);
        if (userId) {
            res.status(200).send({userId});
        } else {
            throw Error('Something went wrong');
        }
    } catch (error) {
        res.status(500).send(error);
    }
});

/**
 * Returns true if the object is valid
 * @param {object} body 
 * @returns {boolean}
 */
function isRegisterBodyValid(body) {
    return body.address 
        && body.age 
        && body.email 
        && body.healthcard_num 
        && body.name;
}

/**
 * Contructs and returns the user object to be posted to firestore
 * @param {object} body 
 * @returns {object}
 */
function buildUserObject(body) {
    const { address, 
        age, 
        bookings, 
        email, 
        healthcard_num, 
        name } = body;

    return {
        address,
        age,
        bookings: [
            {
                date: bookings[0].date || null,
                id: bookings[0].id || null,
                location: bookings[0].location || null
            },
            {
                date: bookings[1].date || null,
                id: bookings[1].id || null,
                location: bookings[1].location || null
            }
        ],
        email,
        healthcard_num,
        name,
        vaccination_state: VACCINATION_STATE.REGISTERED,
        vaccine_received: null
    }
}

module.exports = router;
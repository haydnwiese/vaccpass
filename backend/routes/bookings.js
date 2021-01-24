const express = require('express');
const router = express.Router();
const VACCINATION_STATE = require('../util/constants').VACCINATION_STATE;
const bookingsModel = require('../models/bookings');
const usersModel = require('../models/users');

router.get('/vaccinate/:userid', async (req, res) => {
    try {
        const result = await bookingsModel.updateUserVaccinationStatus(req.params.userid);
        res.status(200).send(result);
    } catch (error) {
        res.status(500).send(error);
    }
});

router.post('/book/:userid', async (req, res) => {
    try {
        const userId = req.params.userid;
        const { body: bookings } = req;
        bookings[0].id = 'booking1';
        bookings[1].id = 'booking2';
        const userData = await usersModel.fetchUserDataById(userId);
        userData.bookings = bookings;
        const result = await usersModel.updateUser(userData, userId);
        res.status(200).send(result);
    } catch(error) {
        res.status(500).send(error);
    }
});

module.exports = router;
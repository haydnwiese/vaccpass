const express = require('express');
const router = express.Router();
const VACCINATION_STATE = require('../util/constants').VACCINATION_STATE;
const bookingsModel = require('../models/bookings');

router.get('/vaccinate/:userid', async (req, res) => {
    try {
        const result = await bookingsModel.updateUserVaccinationStatus(req.params.userid);
        res.status(200).send(result);
    } catch (error) {
        res.status(500).send(error);
    }
});

module.exports = router;
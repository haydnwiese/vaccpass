const express = require('express');
const router = express.Router();
const VACCINATION_STATE = require('../util/constants').VACCINATION_STATE;

const vaccineLocationCollection = 'vaccine_location';

module.exports = router;
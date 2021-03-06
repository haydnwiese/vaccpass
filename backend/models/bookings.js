const fireStoreUtil = require('../util/firestoreUtil');
const usersModel = require('./users');
const VACCINATION_STATE = require('../util/constants').VACCINATION_STATE;

const vaccineLocationCollection = 'vaccine_location';

async function updateUserVaccinationStatus(userId) {
    const userData = await usersModel.fetchUserDataById(userId);

    const currentVaccinationState = userData.vaccination_state;
    const newStateIndex = Object.keys(VACCINATION_STATE).indexOf(currentVaccinationState) + 1;
    userData.vaccination_state = VACCINATION_STATE[Object.keys(VACCINATION_STATE)[newStateIndex]];
    const update = {vaccination_state: userData.vaccination_state};
    return await usersModel.updateUser(update, userId);
}


module.exports = {updateUserVaccinationStatus};
const firestoreUtil = require('../firestoreUtil');

const userCollection = 'users';

async function fetchUserData() {
    const userQuerySnapshot = await firestoreUtil.getDb().collection(userCollection).get()
    const users = [];
    userQuerySnapshot.forEach(doc => {
        users.push({
            id: doc.id,
            data: doc.data()
        })
    });
    return users;
}

async function fetchUserDataById(userId) {
    const userRef = firestoreUtil.getDb().collection(userCollection).doc(userId);
    const doc = await userRef.get();
    return doc.exists && doc.data() ? doc.data() : null;
}

async function registerUser(userData) {
    const documentReference = firestoreUtil.getDb().collection('users').doc();
    const response = await documentReference.set(userData);
    if (response.writeTime) {
        const path = documentReference.path;
        const userId = path.substr(path.lastIndexOf('/') + 1);
        return userId;
    } else {
        return null;
    }
}

module.exports = {fetchUserData, fetchUserDataById, registerUser};
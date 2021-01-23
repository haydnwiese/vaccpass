const express = require('express');
const serviceAccount =  require('../vaccpass-backend-594715073047.json');
const admin = require('firebase-admin');
const router = express.Router();

const userCollection = 'users';

router.get('/', async (req, res) => {
    try {
        const userQuerySnapshot = await req.app.get('db').collection(userCollection).get()
        const users = [];
        userQuerySnapshot.forEach(doc => {
            users.push({
                id: doc.id,
                data: doc.data()
            })
        });
        res.status(200).json(users);
    } catch (error) {
        res.status(500).send(error);
    }
});

router.get('/:userid', async (req, res) => {
    try {
        const userRef = eq.app.get('db').collection(userCollection).doc(req.params.userid);
        const doc = await userRef.get();
        if (doc.exists && doc.data()) {
            res.status(200).json(doc.data());
        } else {
            throw Error('No such user');
        }
    } catch (error) {
        console.log(error)
        res.status(500).send(error.message);
    }
});

module.exports = router;
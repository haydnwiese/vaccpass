const express = require('express');
const admin = require('firebase-admin');
const bodyParser = require('body-parser');
const users = require('./routes/users');
const bookings = require('./routes/bookings');
const firestoreUtil = require('./firestoreUtil');

// Initialize firestore access
// var serviceAccount = require('./vaccpass-backend-594715073047.json');
// admin.initializeApp({
//     credential: admin.credential.cert(serviceAccount)
// });

// Initialize express server
const app = express();
const PORT = 8080;

firestoreUtil.connectToServer();

// Initialize the database and the collection
// const db = admin.firestore();
// Set DB instance for access from routes
app.set('db', firestoreUtil.getDb());

// set json as bodyparser
app.use(bodyParser.json());

// routing setup
app.use('/users', users);
app.use('/booking',bookings);

app.listen(PORT, () => {
    console.log(`server started at http://localhost:${PORT}`);
});
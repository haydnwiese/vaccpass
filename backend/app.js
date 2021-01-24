const express = require('express');
const bodyParser = require('body-parser');
const users = require('./routes/users');
const bookings = require('./routes/bookings');
const firestoreUtil = require('./util/firestoreUtil');

// Initialize express server
const app = express();
const PORT = 8080;

firestoreUtil.connectToServer();

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
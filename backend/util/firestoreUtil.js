const admin = require('firebase-admin');
var serviceAccount = require('../vaccpass-backend-594715073047.json');

var _db;

module.exports = {

  connectToServer: function() {
    admin.initializeApp({
        credential: admin.credential.cert(serviceAccount)
    });
    _db = admin.firestore();
  },

  getDb: function() {
    return _db;
  }
};
const admin = require('firebase-admin');

const serviceAccount = require('./vaccpass-backend-594715073047.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

fetchData();

async function fetchData() {
    const snapshot = await db.collection('users').get();
    snapshot.forEach((doc) => {
        console.log(doc.id, '=>', doc.data());
      });
}
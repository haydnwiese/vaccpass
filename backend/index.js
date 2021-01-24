const admin = require('firebase-admin');

const serviceAccount = require('./vaccpass-backend-594715073047.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

postData();
// const str = 'users/haydn';
// console.log(str.substr(str.lastIndexOf('/') + 1))

async function fetchData() {
    const snapshot = await db.collection('users').get();
    snapshot.forEach((doc) => {
        console.log(doc.id, '=>', doc.data());
      });
}

async function postData() {
    const data = {
        address: "123 candy lane",
        age: 20,
        bookings: [
            {
                date: new Date(),
                id: 'booking1',
                location: 'location123'
            },
            {
                date: new Date(2021, 1, 28),
                id: 'booking2',
                location: 'location123'
            }
        ],
        email: 'haydn@gmail.com',
        healthcard_num: 'healthcardnum123',
        name: 'Alex',
        vaccination_state: null,
        vaccine_received: null
    }
    const documentReference = db.collection('users').doc();
    const res = await documentReference.set(data);
    console.log(documentReference.path);
} 
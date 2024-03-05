const admin = require('firebase-admin');
const express = require('express');
const bodyParser = require('body-parser');

// Initialize Firebase Admin with service account
const serviceAccount = require('./service_key.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const app = express();
app.use(bodyParser.json());

// Endpoint to send push notification
app.post('/send-notification', (req, res) => {
    const { tokens, topic, message } = req.body;

    let messagePayload = {
        notification: {
            title: message.title,
            body: message.body
        }
    };

    if (tokens) {
        // Send a message to the provided FCM tokens
        tokens.forEach(token => {
            messagePayload.token = token;
            admin.messaging().send(messagePayload)
                .then(response => res.send(response))
                .catch(error => res.status(500).send(error));
        });
    } else if (topic) {
        // Send a message to the provided topic
        messagePayload.topic = topic;
        admin.messaging().send(messagePayload)
            .then(response => res.send(response))
            .catch(error => res.status(500).send(error));
    } else {
        res.status(400).send('Tokens or topic required');
    }
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});

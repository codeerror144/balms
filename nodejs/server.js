const express = require('express');
const { NFC } = require('nfc-pcsc'); 
const cors = require('cors');

const app = express();
const port = process.env.PORT || 3000;

app.use(cors()); 

let rfidUID = null;

// Initialize NFC Reader
const nfc = new NFC();

nfc.on('reader', reader => {
    console.log(`${reader.reader.name} connected`);

    reader.on('card', card => {
        rfidUID = card.uid.toUpperCase(); 
        console.log(`RFID UID: ${rfidUID}`);
    });

    reader.on('error', err => console.error('Reader error:', err));
    reader.on('end', () => console.log(`${reader.reader.name} disconnected`));
});

app.get('/fetch-rfid-uid', (req, res) => {
    if (rfidUID) {
        res.json({ uid: rfidUID });
    } else {
        res.status(404).json({ error: 'No RFID UID detected.' });
    }
});

app.listen(port, () => {
    console.log(`NFC server running at http://localhost:${port}`);
});

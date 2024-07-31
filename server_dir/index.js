const express = require('express');
const axios = require('axios');
const cors = require("cors");
const fs = require('fs');


const app = express();
const PORT = 3001;

app.use(cors());
app.use(express.json());

app.get('/api/data', async (req, res) => {
  try {
  } catch (error) {
    console.error('Error: ', error.message);
    res.status(500).json({ error: 'Error has occured' });
  }
});

const compareTimestamp = (a, b) => {
  return a === b;
};



app.post('/api', async (req, res) => {
  try {
      //res.json(JSON.parse(updatedContent))
  } catch (error) {
    console.error('Error: ', error.message);
    res.status(500).send('Error has occured');
  }
});

app.listen(PORT, () => {
  console.log(`Server Express ${PORT}`);
});
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
	console.log("GET /api/data");
	res.status(200).json({id: "0", name: "Song 1"});
  } catch (error) {
    console.error('Error: ', error.message);
    res.status(500).json({ error: 'Error has occured' });
  }
});

app.get('/session/:id', async (req, res) => {
  try {
	  console.log("GET /session/:id");
	  var music_style_id = req.params.id;
    //fetch music data
    //fetch music meta data
    //format response
    res.set('Content-Type', 'audio/mpeg');
    //res.send();
  } catch (error) {
    console.error('Error: ', error.message);
    res.status(500).json({ error: 'Error has occured' });
  }
});


app.post('/api', async (req, res) => {
  try {
	console.log("POST /");
  } catch (error) {
    console.error('Error: ', error.message);
    res.status(500).send('Error has occured');
  }
});

app.listen(PORT, () => {
  console.log(`Server Express ${PORT}`);
});
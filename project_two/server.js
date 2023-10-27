const express = require('express');
const app = express();
const PORT = 3005;
const rooms = require('./src/routes/rooms');

app.use('/rooms',rooms)
// route enpoint http://localhost:3005/
app.get('/',(req,res)=>{
  res.send("hello world");
})

app.listen(PORT)
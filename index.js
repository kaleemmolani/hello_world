const express = require('express');
const fs  = require('fs');
const bodyParser = require('body-parser');

const data = fs.readFileSync('./database.json');

let contacts = JSON.parse(data);


const NewContact = (firstname,lastname,phone,email)=>{
  let temp_contact_json =   {
    "firstname":firstname,
    "lastname":lastname,
    "phone":phone,
    "email":email
    }
    contacts.push(temp_contact_json);
    fs.writeFile('./database.json',JSON.stringify(contacts),(error)=>{
      console.log(error);
    })
}


//NewContact("robert","downey","9876545467","me@robert.com");

//console.log(contacts);


const app = express();

app.use(bodyParser.json());

app.get("/",(req,res)=>{
  console.log("this is index");
  res.sendFile('C:\\Users\\91742\\Documents\\Nodejs Trainings\\hello_world\\frontend\\index.html')
})

let endpoint = "http://localhost:3004/contacts/All"


app.get("/contacts/All",(req,res)=>{
  console.log(req);
  res.send("All Cntact")
})

app.post('/contacts',(req,res)=>{
  let firstname = req.body.firstname;
  let lastname = req.body.lastname;
  let phone = req.body.phone;
  let email = req.body.email; 
  console.log("this is new contact log",firstname,lastname,email,phone);
  NewContact(firstname,lastname,phone,email);
  res.send(contacts)
})

app.listen(3004);

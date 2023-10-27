const express  = require("express");
const roomsRouter = express.Router();

const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

const ListOfRooms = () =>{
  return prisma.rooms.findMany().then((roomslist)=>{
    console.log("this is the list of all rooms",roomslist);
    return roomslist;
  }).catch((error)=>{
    console.log(error);
  })
}

const listofavailablerooms = () =>{
  return prisma.rooms.findMany({where:{available:true}}).then((roomslist)=>{
    console.log("this is the list of all rooms",roomslist);
    return roomslist ;
  }).catch((error)=>{
    console.log(error);
  })
}

const listofunavailablerooms = () =>{
  return prisma.rooms.findMany({where:{available:false}}).then((roomslist)=>{
    console.log("this is the list of all rooms",roomslist);
    return roomslist ;
  }).catch((error)=>{
    console.log(error);
  })
}
// route http://localhost:3005/rooms/all
roomsRouter.get('/all',(req,res)=>{
  ListOfRooms().catch(rooms=>{
    res.send(rooms)
  })
})

roomsRouter.get('/allavlrooms',(req,res)=>{
  listofavailablerooms().then(rooms=>{
    res.send(rooms)
  })
})

roomsRouter.get('/allunavlrooms',(req,res)=>{
  listofunavailablerooms().then(rooms=>{
    res.send(rooms)
  })
})


module.exports = roomsRouter

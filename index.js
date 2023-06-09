import express from "express";
import PersonajeRouter from './src/controllers/personaje-controller.js';
import PeliserieRouter from './src/controllers/peliserie-controller.js';
import cors from 'cors';

const app = express();
const port = 5000;

app.use(cors());
app.use(express.json());
// console.log(PersonajeRouter);
app.use("/api/personajes/", PersonajeRouter);
app.use("/api/peliseries/", PeliserieRouter);

app.listen(port, () => {
    console.log(`Listening on port ${port}`);
});
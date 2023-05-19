import { Router } from "express";
import PeliserieServices from "../../services/peliserie-services.js";
const router = Router();
// const PeliserieServices = new PeliserieServices();

// console.log(router);

router.get('', async (req, res) => {
    const peliseries = await PeliserieServices.getAll();
    // res.send("GetAll");
    if (peliseries) {
        return res.status(200).json({"peliseries":peliseries});
    } else {
        return res.status(500).send("Error del servidor");
    }
});

router.get('/:id', async (req, res) => {
    const peliserie = await PeliserieServices.getById(req.params.id);
    if (peliserie) {
        return res.status(200).json(peliserie);
    } else {
        return res.status(404).send("La peliserie no fue encontrada");
    }
});

router.post('', async (req, res) => {
    const peliserie = await PeliserieServices.insert(req.body);
    if (peliserie) {
        return res.status(201).json(peliserie); 
    } else {
        return res.status(400).send("Ocurrio un error, la peliserie no pudo ser insertada");
    }
});

router.put('', async (req, res) => {
    const peliserie = await PeliserieServices.update(req.body);
    if (peliserie) {
        return res.status(202).json(peliserie);
    } else {
        return res.status(404).send("La peliserie que se intento actualizar no existe");
    }
});

router.delete('/:id', async (req, res) => {
    const rowsAffected = await PeliserieServices.deleteById(req.params.id);
    // res.status(200).send("Rows affected:", rowsAffected)
    if (rowsAffected > 0) {
        return res.status(200).json(rowsAffected);
    } else if (rowsAffected == 0) {
        return res.status(404).send("La peliserie que intento borrar no existe");
    }
    else {
        return res.status(500).send("Error del sistema");
    }
})

export default router;
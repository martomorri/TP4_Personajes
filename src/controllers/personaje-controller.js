import { Router } from "express";
import PersonajeServices from "../services/personaje-services.js";
const router = Router();
// const PersonajeServices = new PersonajeServices();

// console.log(router);

router.get('', async (req, res) => {
    const personajes = await PersonajeServices.getAll();
    // res.send("GetAll");
    if (personajes) {
        return res.status(200).json({"Personajes":personajes});
    } else {
        return res.status(500).send("Error del servidor");
    }
});

router.get('/:type/:p', async (req, res) => {
    // console.log(req);
    let personaje = null;
    console.log(req.params);
    switch (req.params.type) {
        case "id":
            personaje = await PersonajeServices.getById(req.params.p);
            break;
        case "name":
            personaje = await PersonajeServices.getByName(req.params.p);
            break;
        case "age":
            personaje = await PersonajeServices.getByAge(req.params.p);
            break;
        case "idMovie":
            personaje = await PersonajeServices.getByIdMovie(req.params.p);
            break;
    }
    // const personaje = await PersonajeServices.getById(req.params.id);
    if (personaje) {
        return res.status(200).json(personaje);
    } else {
        return res.status(404).send("El personaje no fue encontrado");
    }
});

// router.get('/:nid', async (req, res) => {
//     // console.log(req.params);
//     const personaje = await PersonajeServices.getByName(req.params.name);
//     if (personaje) {
//         return res.status(200).json(personaje);
//     } else {
//         return res.status(404).send("El personaje no fue encontrado");
//     }
// });

// router.get('/age/:', async (req, res) => {
//     // console.log(req);
//     const personaje = await PersonajeServices.getByAge(req.params.age);
//     if (personaje) {
//         return res.status(200).json(personaje);
//     } else {
//         return res.status(404).send("El personaje no fue encontrado");
//     }
// });

// router.get('/idMovie', async (req, res) => {
//     const personaje = await PersonajeServices.getByIdMovie(req.params.idMovie);
//     if (personaje) {
//         return res.status(200).json(personaje);
//     } else {
//         return res.status(404).send("El personaje no fue encontrado");
//     }
// });

router.post('', async (req, res) => {
    const personaje = await PersonajeServices.insert(req.body);
    if (personaje) {
        return res.status(201).json(personaje); 
    } else {
        return res.status(400).send("Ocurrio un error, el personaje no pudo ser insertado");
    }
});

router.put('', async (req, res) => {
    const personaje = await PersonajeServices.update(req.body);
    if (personaje) {
        return res.status(202).json(personaje);
    } else {
        return res.status(404).send("El personaje que se intento actualizar no existe");
    }
});

router.delete('/:id', async (req, res) => {
    const rowsAffected = await PersonajeServices.deleteById(req.params.id);
    // res.status(200).send("Rows affected:", rowsAffected)
    if (rowsAffected > 0) {
        return res.status(200).json(rowsAffected);
    } else if (rowsAffected == 0) {
        return res.status(404).send("El personaje que intento borrar no existe");
    }
    else {
        return res.status(500).send("Error del sistema");
    }
})

export default router;
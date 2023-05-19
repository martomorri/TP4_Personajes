import config from "../../dbconfig.js";
import sql from 'mssql';

let pool = await sql.connect(config);

class PersonajeServices {
    static getAll = async () => {
        console.log("getAll()");
        let result = await pool.request().execute("getPersonajes");
        // console.log(result);
        return result.recordsets[0];
    }

    static getById = async id => {
        let returnEntity = null;
        console.log("getById(id)");
        try {
            let result = await pool.request()
                                .input("Id", sql.Int, id)
                                .execute("getPersonajeById");
            returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }

    static insert = async personaje => {
        const { Imagen, Nombre, Edad, Peso, Historia, Id_Peliserie } = personaje;
        console.log("Personaje:", Nombre);
        const request = new sql.Request(pool);
        request
        .input("Imagen", sql.NVarChar(4000), Imagen)
        .input("Nombre", sql.NVarChar(50), Nombre)
        .input("Edad", sql.Int, Edad)
        .input("Peso", sql.Float, Peso)
        .input("Historia", sql.NVarChar(4000), Historia)
        .input("Id_Peliserie", sql.Int, Id_Peliserie)
        .execute("postPersonaje");
        return personaje;
    }

    static update = async personaje => {
        const { Id, Edad, Peso, Historia } = personaje;
        console.log("Personaje a actualizar:", Id);
        const request = new sql.Request(pool);
        request
        .input("id", sql.Int, Id)
        .input("Edad", sql.Int, Edad)
        .input("Peso", sql.Float, Peso)
        .input("Historia", sql.NVarChar(4000), Historia)
        .execute("putPersonaje");
        return personaje;
    }

    static deleteById = async id => {
        let rowsAffected = null;
        console.log("deleteById(id)");
        try {
            let result = await pool.request().input("Id", sql.Int, id).execute("deletePersonaje");
            console.log(result);
            rowsAffected = result.recordset;
        } catch (error) {
            console.log(error);
        }
        return rowsAffected;
    }
}

export default PersonajeServices;
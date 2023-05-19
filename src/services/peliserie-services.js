import config from "../../dbconfig.js";
import sql from 'mssql';

let pool = await sql.connect(config);

class PeliserieServices {
    static getAll = async () => {
        console.log("getAll()");
        let result = await pool.request().execute("getPeliseries");
        // console.log(result);
        return result.recordsets[0];
    }

    static getById = async id => {
        let returnEntity = null;
        console.log("getById(id)");
        try {
            let result = await pool.request()
                .input("Id", sql.Int, id)
                .execute("getPeliserieById");
            returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }

    static getByName = async Name => {
        let returnEntity = null;
        console.log("getByName(Name)");
        try {
            let result = await pool.request()
                .input("Titulo", sql.Int, Name)
                .execute("getPeliserieByName");
            returnEntity = result.recordsets[0][0];
        } catch (error) {
            console.log(error);
        }
        return returnEntity;
    }

    static getAllOrdered = async order => {
        console.log("getAllOrdered(asc/desc)");
        let result = null;
        if (order === "asc") {
            result = await pool.request().execute("getPeliserieAsc");
            result = result.recordsets[0];
        } else if (order === "desc") {
            result = await pool.request().execute("getPeliserieDesc");
            result = result.recordsets[0];
        }
        return result;
    }

    static insert = async peliserie => {
        const { Imagen, Titulo, Fecha_Creacion, Calificacion } = peliserie;
        console.log("Pelicula/Serie:", Titulo);
        const request = new sql.Request(pool);
        request
            .input("Imagen", sql.NVarChar(999), Imagen)
            .input("Titulo", sql.NVarChar(50), Titulo)
            .input("Fecha_Creacion", sql.Date, Fecha_Creacion)
            .input("Calificacion", sql.Float, Calificacion)
            .execute("postPeliserie");
        return peliserie;
    }

    static update = async peliserie => {
        const { Id, Calificacion } = peliserie;
        console.log("Pelicula/Serie a actualizar:", Id);
        const request = new sql.Request(pool);
        request
            .input("id", sql.Int, Id)
            .input("Calificacion", sql.Float, Calificacion)
            .execute("putPeliserie");
        return peliserie;
    }

    static deleteById = async id => {
        let rowsAffected = null;
        console.log("deleteById(id)");
        try {
            let result = await pool.request().input("Id", sql.Int, id).execute("deletePeliserie");
            console.log(result);
            rowsAffected = result.recordset;
        } catch (error) {
            console.log(error);
        }
        return rowsAffected;
    }
}

export default PeliserieServices;
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

    static insert = async personaje => {
        
    }

    static update = async personaje => {
        
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
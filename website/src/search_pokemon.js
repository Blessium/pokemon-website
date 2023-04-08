import React, {useState} from "react";
import SearchTable from "./search_table";
import COLUMNS_POKEMON from "./constants.js";

const SearchPokemon = () => {
    const [inputText, setInputText] = useState("");

    let texthandler = (e) => {
        console.log(e.target.value);
        setInputText(e.target.value);
    }

    const data = [{
        name: 'Alessandro',
        age: 18,
    }, {
        name: 'Dexter',
        age: 1,
    }]

    const columns = [{
        Header: 'Name',
        accessor: 'name'
    }, {
        Header: 'Age',
        accessor: 'age'
    }]

    return (
        <div className="Search"> 
            <input 
                placeholder="Cerca pokemon"
                onKeyUp={texthandler}
            />
            <SearchTable
                data={data}
                columns={columns}
            />

        </div>
    )
}

export default SearchPokemon;



import React, { useEffect, useState } from "react";
import Web3 from "web3";
import {contractAddress} from "../utils/contractAddress";
import abi from "../utils/MatrixEven.json";

const contractABI = abi.abi;

const MatrixFilter = () => {
   const [web3, sentWeb3] = useState(null);
   const [account, setAccount] = useState(null);
   const [contract, setContract] = useState(null);
   const [inputArray, setInputArray] = useState("");
   const [eventArray, setEvenArray] = useState([]);

   useEffect(() =>{
         const init = async () => {
            try{
                const web3 = new Web3(Web3.givenProvider || "http://127.0.0.1:8545");
                const accounts = await web3.eth.requestAccounts();
                const contract = new web3.eth.Contract(contractABI,contractAddress);
    
                sentWeb3(web3);
                setAccount(accounts[0]);
                setContract(contract);
            }catch(error) {
                console.error("Error initializing web3 or contract",error)
            };
            

         };

         init();

   },[]);
      
   const handleFilterEven = async () => {
       if(!contract || !inputArray){
        alert("Por favor, introduce un array valido.");
        return;
       } 
       try {
        const array = inputArray.split(",").map(Number);
        if(array.some(isNaN)) {
            alert("Por favor, introduce solo numeros separados por coma.");
            return;
        }
        const result = await contract.methods.filterEven(array).call({
         from:account
        });
        setEvenArray(result);
       }catch(error){
        console.error("Error filtering even numbers", error);
       }
      setInputArray("");
   };
  
    

    return(
        <div className="contenedor">
           <h1>Matrix Even Filter</h1>
           <div>
            <label>Input Array (coma separates):</label><br/>
            <input
                type="text"
                value={inputArray}
                onChange={(e) => setInputArray(e.target.value)}
            />
            <button onClick={handleFilterEven}>Filter Even Numbers</button>
           </div>
           {eventArray.length > 0 && (
            <div>
                <h2>Even Numbers:</h2>
                <p>{eventArray.join(", ")}</p>
            </div>
           )}
        </div>
    );
};

export default MatrixFilter;
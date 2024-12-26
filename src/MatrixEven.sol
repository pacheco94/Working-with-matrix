// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
/**
 En este contrato se hace uso de del alojamiento de las variables en memoria
 para manipular leer una matriz pasada a una funcion y extraer los valores pares 
 de esta matris y guardarlo en una nueva matriz que debe de tener el tamanio
 exacto de la cantidad de numeros pares.
 */
contract MatrixEven {
    //funcion para filtar los numeros pares de una matriz
    function filterEven(
        uint[] calldata array
    ) external pure returns (uint[] memory) {
        uint element = 0; //guarda la cantidad de numeros pares de la matriz
        for (uint i = 0; i < array.length; i++) {
            if (array[i] % 2 == 0) {
                element++;
            }
        }

        //creamos una matriz dinamica en memoria y le damos el size de element
        uint[] memory evenArray = new uint[](element);

        //variable para llenar la matriz index,
        uint index = 0;

        for (uint i = 0; i < array.length; i++) {
            if (array[i] % 2 == 0) {
                evenArray[index] = array[i];
                index++;
            }
        }

        return evenArray;
    }
}

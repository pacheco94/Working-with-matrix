// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {MatrixEven} from "../src/MatrixEven.sol";

contract MatrixEvenTest is Test {
    MatrixEven public matrixEven;
    uint256[] arr;

    function setUp() public {
        matrixEven = new MatrixEven();
    }

    function test_filter1() public {
        arr.push(1);
        arr.push(2);
        arr.push(4);
        uint[] memory newArr = matrixEven.filterEven(arr);
        assertEq(
            newArr.length,
            2,
            "expected the array length to be of size 2!"
        );

        assertEq(newArr[0], 2);
        assertEq(newArr[1], 4);
    }

    function test_filter2() public {
        arr.push(1);
        arr.push(12);
        arr.push(302);
        arr.push(7);
        arr.push(10);
        uint256[] memory newArr = matrixEven.filterEven(arr);
        assertEq(
            newArr.length,
            3,
            "expexted the array length to be of size 3!"
        );
        assertEq(newArr[0], 12);
        assertEq(newArr[1], 302);
        assertEq(newArr[2], 10);
    }

    function test_filterFail() public {
        arr.push(1);
        arr.push(12);
        arr.push(302);
        arr.push(7);
        arr.push(10);

        //Esperar que la funcion falle debido a alguna condicion incorrecta
        vm.expectRevert(); // indica que esperamos un revert en esta llamada
        matrixEven.filterEven(arr);
    }
}

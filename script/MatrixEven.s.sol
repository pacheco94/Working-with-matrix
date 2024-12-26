// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {MatrixEven} from "../src/MatrixEven.sol";

contract CounterScript is Script {
    MatrixEven public matrixEven;

    function setUp() public {}

    function run() public {
        uint256 privatekey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast();

        matrixEven = new MatrixEven();
        console.log("Contract Deployed in: ", address(matrixEven));
        vm.stopBroadcast();
    }
}

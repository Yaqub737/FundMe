//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    SimpleStorage public simpleStorage1;

    function run() public {
        vm.startBroadcast();
        simpleStorage1 = new SimpleStorage();
        vm.stopBroadcast();
    }
}

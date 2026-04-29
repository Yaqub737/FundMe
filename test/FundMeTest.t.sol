// SPDX Lisense- Identifier MIT:
pragma solidity ^0.8.18;

import {SimpleStorage} from "../src/SimpleStorage.sol";
import {Test, console} from "forge-std/Test.sol";
import {DeploySimpleStorage} from "../script/DeploySimpleStorage.sol";

contract FundMeTest is Test {
    SimpleStorage simpleStorage;
    DeploySimpleStorage deployer;

    function setUp() public {
        simpleStorage = new SimpleStorage();
        deployer = new DeploySimpleStorage();
    }

    function teststore() public {
        // calling the Stored Function From my SimpleStorage Contract
        simpleStorage.store(737);
        //storing the Stored Values
        uint256 favNum = simpleStorage.myFavoriteNumber();
        uint256 favNum2 = simpleStorage.retrieve();
        assertEq(favNum, 737);
        assertEq(favNum2, 737);
    }

    function testAddperson() public {
        simpleStorage.addPerson("bossyaqub", 7373);
        uint256 num;
        string memory name;
        (num, name) = simpleStorage.listOfPeople(0);
        assertEq(num, 7373);
        assertEq(name, "bossyaqub");
    }

    function testDeploySimple() public {
        deployer.run();
        address deploySS = address(deployer.simpleStorage1());
        console.log(deploySS);
    }
}

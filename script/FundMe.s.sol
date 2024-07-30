// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";

import {FundMe} from "../src/FundMe.sol";
import {HelpConig} from "./HelpConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        HelpConig config = new HelpConig();
        address addressConfig = config.activeNetworkConfig();
        vm.startBroadcast();

        FundMe fundMe = new FundMe(addressConfig);

        vm.stopBroadcast();
        return fundMe;
    }
}

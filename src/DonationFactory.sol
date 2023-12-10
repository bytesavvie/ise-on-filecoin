// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {Donation} from "src/Donation.sol";
import {IRouter} from "src/Types/Interface/IRouter.sol";
import {GetRoute} from "src/Router/GetRoute.sol";
import {IPoolAdapter} from "src/Types/Interface/IPoolAdapter.sol";

contract DonationFactory {
    event DonationCreated(address indexed donationContract, address indexed donor, address[] indexed nonProfits);

    address private immutable router;
    // IPoolRegistry private poolRegistry;

    // Mapping from donor address to their donation contracts
    mapping(address => address[]) private donorDonations;

    // Mapping from non-profit address to donation contracts they are a part of
    mapping(address => address[]) private nonProfitDonations;

    // Function to create a new donation contract instance for multiple non-profits
    function donate(uint256[] calldata poolIds, uint256 amount, ) external payable {
        require(msg.value == amount, "Donation amount does not match sent value");

        // Use the adapter to stake to the pool
        IPoolAdapter poolAdapter = GetRoute.getPoolAdapter(router, poolId);
        uint256 stakingTokenAmount = poolAdapter.stake(amount);

        // Create and store donation information as before
        // ...
    }

    // Private function to handle the creation of donation contracts.
    function createDonation(address donor, address[] calldata nonProfits) private returns (Donation) {
        Donation newDonation = new Donation(donor, nonProfits);
        donorDonations[donor].push(address(newDonation));

        for(uint i = 0; i < nonProfits.length; i++) {
            nonProfitDonations[nonProfits[i]].push(address(newDonation));
        }
        
        return newDonation;
    }

    // View function to get donations made by a donor
    function getDonorDonations(address donor) external view returns (address[] memory) {
        return donorDonations[donor];
    }

    // View function to get donations received by a non-profit
    function getNonProfitDonations(address nonProfit) external view returns (address[] memory) {
        return nonProfitDonations[nonProfit];
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./Donation.sol";

contract DonationFactory {
    event DonationCreated(address indexed donationContract, address indexed donor, address[] indexed nonProfits);

    // Mapping from donor address to their donation contracts
    mapping(address => address[]) private donorDonations;

    // Mapping from non-profit address to donation contracts they are a part of
    mapping(address => address[]) private nonProfitDonations;

    // Function to create a new donation contract instance for multiple non-profits
    function donate(address pool, uint256 amount) external payable {
        require(msg.value == amount, "Donation amount does not match sent value");
        require(address(poolAdapters[pool]) != address(0), "Pool adapter not registered");

        // Use the adapter to stake to the pool
        uint256 stakingTokenAmount = poolAdapters[pool].stake(amount, msg.sender);

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

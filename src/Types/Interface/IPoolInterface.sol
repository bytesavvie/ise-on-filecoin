// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IPoolInterface {
    function stake(uint256 amount, address donor) external returns (uint256);
    function getStakingTokenBalance(address donor) external view returns (uint256);
    // Add more standardized functions as needed
}

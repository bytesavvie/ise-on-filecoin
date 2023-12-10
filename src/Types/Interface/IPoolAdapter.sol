// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

interface IPoolAdapter {
    function stake(uint256 amount) external returns (uint256);

    function calculateYield() external view returns (uint256);
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

abstract contract PoolAdapter {
    function stake(uint256 amount) external virtual returns (uint256);

    function calculateYield() external view virtual returns (uint256);
}

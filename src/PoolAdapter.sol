// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

interface IPoolInterface {
    function stake(uint256 amount) external returns (bool);
    function yield() external returns (uint256);
}

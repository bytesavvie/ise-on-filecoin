// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

contract PoolRegistry {
    mapping(address => bool) public pools;

    function attachPool(address pool) external {
        // Logic to register a pool
        pools[pool] = true;
    }

    // Function to register a new pool adapter
    function registerPoolAdapter(address pool, IPoolInterface poolAdapter) external {
        poolAdapters[pool] = poolAdapter;
    }
}

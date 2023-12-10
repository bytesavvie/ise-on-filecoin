// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./Router.sol";
import "./IPoolInterface.sol";

contract PoolRegistry {
    Router public router;

    constructor(Router _router) {
        router = _router;
    }

    function registerPoolAdapter(address pool, address adapter) external {
        // Access control checks to ensure only authorized users can register adapters
        bytes32 identifier = router.getPoolAdapterIdentifier(pool);
        router.updateAddress(identifier, adapter);
    }

    function getPoolAdapter(address pool) external view returns (IPoolInterface) {
        address adapterAddress = router.getAddress(router.getPoolAdapterIdentifier(pool));
        require(adapterAddress != address(0), "Adapter not found for the given pool");
        return IPoolInterface(adapterAddress);
    }
}

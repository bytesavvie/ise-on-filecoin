// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import {IRouter} from "src/Types/Interface/IRouter.sol";
import {IPoolAdapter} from "src/Types/Interface/IPoolAdapter.sol";

library GetRoute {
    function getDonationFactory(
        address router
    ) internal view returns (address) {
        return IRouter(router).getRoute("DonationFactory");
    }

    function getPoolRegistry(address router) internal view returns (address) {
        return IRouter(router).getRoute("PoolRegistry");
    }

    // Additional getter functions for other contracts within the ISE project
    // ...

    // Get a pool adapter by its Pool ID
    function getPoolAdapter(
        address router,
        uint256 poolId
    ) internal view returns (IPoolAdapter) {
        // Construct the pool identifier string e.g., "PoolAdapter1"
        string memory poolName = string(
            abi.encodePacked("PoolAdapter", uint2str(poolId))
        );
        return IPoolAdapter(IRouter(router).getRoute(poolName));
    }

    // Helper function to convert uint256 to string
    function uint2str(uint256 _i) internal pure returns (string memory str) {
        if (_i == 0) {
            return "0";
        }
        uint256 j = _i;
        uint256 length;
        while (j != 0) {
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint256 k = length;
        while (_i != 0) {
            bstr[--k] = bytes1(uint8(48 + (_i % 10)));
            _i /= 10;
        }
        str = string(bstr);
    }
}

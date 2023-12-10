// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Router is IRouter, Ownable {
    mapping(string => address) private _routes;

    event RouteUpdated(string name, address addr);

    function getRoute(string calldata name) public view override returns (address) {
        require(_routes[name] != address(0), "Route does not exist");
        return _routes[name];
    }

    function setRoute(string calldata name, address addr) external override onlyOwner {
        require(addr != address(0), "Cannot set a zero address");
        _routes[name] = addr;
        emit RouteUpdated(name, addr);
    }
}

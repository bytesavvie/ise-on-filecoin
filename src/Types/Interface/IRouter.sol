interface IRouter {
    function getRoute(string calldata name) external view returns (address);
    function setRoute(string calldata name, address addr) external;
}

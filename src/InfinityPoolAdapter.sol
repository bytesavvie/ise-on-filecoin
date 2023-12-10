contract InfinityPoolAdapter is IPoolInterface {
    IGlifInfinityPool public infinityPool;

    constructor(address _infinityPool) {
        infinityPool = IGlifInfinityPool(_infinityPool);
    }

    function stake(uint256 amount, address donor) external override returns (uint256) {
        // Interact with the Glif InfinityPool's staking method
        // Assuming the Glif InfinityPool has a method 'stakeFIL' that accepts FIL and mints iFIL
        return infinityPool.stakeFIL{value: amount}(donor);
    }

    function getStakingTokenBalance(address donor) external view override returns (uint256) {
        // Assuming the Glif InfinityPool has a method 'balanceOf' that returns the iFIL balance
        return infinityPool.balanceOf(donor);
    }
}

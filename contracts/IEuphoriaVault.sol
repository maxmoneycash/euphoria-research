// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title  Euphoria Vault ("Euphoria Vault", EV), reconstructed interface
/// @notice Proxy 0xdf8248fee58e791149e69f6c61129D471EaFC11E on MegaETH (chain 4326),
///         implementation 0x4225d1ab3c5efb7895b7167151d978f16c995f7c (unchanged since May 2026).
///         An ERC-4626 share vault over USDm that takes the house side of every bet. Every name
///         here hashes to a selector in the deployed bytecode. See README.md.
interface IEuphoriaVault {
    // ------------------------------------------------------------ the house side

    /// Exchange only (NotExchange otherwise): sends `amount` USDm to the Exchange as the house's
    /// stake when a position opens. Winnings come back as plain USDm transfers from the Exchange.
    function fundPosition(uint256 amount) external;
    function exchange() external view returns (address);
    function setExchange(address exchange_) external;
    /// totalAssets = availableAssets (USDm held) + lockedAssets (house stakes in open positions,
    /// read from Exchange.getLockedBalance(vault)).
    function availableAssets() external view returns (uint256);
    function lockedAssets() external view returns (uint256);

    // ------------------------------------------------------------ who may deposit

    function isWhitelistedDepositor(address account) external view returns (bool);
    function addToDepositorWhitelist(address account) external;
    function removeFromDepositorWhitelist(address account) external;
    function canDeposit(address account) external view returns (bool);
    /// false: deposits are limited to the whitelist.
    function openDepositsEnabled() external view returns (bool);
    function enableOpenDeposits() external;
    function disableOpenDeposits() external;

    // ------------------------------------------------------------ leader (the owner Safe)

    function leader() external view returns (address);
    function pendingLeader() external view returns (address);
    function transferLeader(address newLeader) external;
    function acceptLeader() external;

    // ------------------------------------------------------------ ERC-4626 / ERC-20

    function asset() external view returns (address);
    function totalAssets() external view returns (uint256);
    function convertToShares(uint256 assets) external view returns (uint256);
    function convertToAssets(uint256 shares) external view returns (uint256);
    function maxDeposit(address receiver) external view returns (uint256);
    function maxMint(address receiver) external view returns (uint256);
    function maxWithdraw(address owner) external view returns (uint256);
    function maxRedeem(address owner) external view returns (uint256);
    function previewDeposit(uint256 assets) external view returns (uint256);
    function previewMint(uint256 shares) external view returns (uint256);
    function previewWithdraw(uint256 assets) external view returns (uint256);
    function previewRedeem(uint256 shares) external view returns (uint256);
    function deposit(uint256 assets, address receiver) external returns (uint256);
    function mint(uint256 shares, address receiver) external returns (uint256);
    function withdraw(uint256 assets, address receiver, address owner) external returns (uint256);
    function redeem(uint256 shares, address receiver, address owner) external returns (uint256);
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);

    // ------------------------------------------------------------ admin

    function initialize(address asset_, string calldata name_, string calldata symbol_,
                        address owner_, address leader_, address exchange_) external; // argument roles ours
    function pause() external;
    function unpause() external;
    function paused() external view returns (bool);
    function owner() external view returns (address);
    function pendingOwner() external view returns (address);
    function transferOwnership(address newOwner) external;
    function acceptOwnership() external;
    function renounceOwnership() external;
    function proxiableUUID() external view returns (bytes32);
    function UPGRADE_INTERFACE_VERSION() external pure returns (string memory);
    function upgradeToAndCall(address newImplementation, bytes calldata data) external payable;

    event ExchangeSet(address exchange);
    event DepositorWhitelistAdded(address account);
    event DepositorWhitelistRemoved(address account);

    error NotExchange(address caller);     // 0x5dd9d0db
    error NotPendingLeader(address caller); // 0xe4692ee4
    error DepositsDisabled();               // 0x717a1648
}

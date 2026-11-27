// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title  Euphoria Exchange, reconstructed interface
/// @notice Proxy 0x12759afcA690637b425ffbA3265F0Dc2F6242A8D on MegaETH (chain 4326),
///         implementation 0x2ffc67547c57d1b1d6aea74508689c36dcc7bc1a (Nov 20, 2026).
///         Euphoria has not published source. This is written by hand from the bytecode, live
///         eth_calls and real transactions (README.md has the evidence for each entry).
///
///         Every function, event and error in IEuphoriaExchange hashes to a selector or topic in
///         the deployed bytecode, so the names are very likely Euphoria's own and the interface can
///         be called as is. Functions whose real names are unknown are not in the interface,
///         because a guessed name gives a different selector; they are in EuphoriaUnnamed below,
///         with their raw selectors and argument layouts.
///
///         Amounts are USDm with 18 decimals. Prices have 8 decimals. Times are unix seconds.
interface IEuphoriaExchange {
    struct UnderlyingInfo {
        string symbol;          // "ETH", "BTC", "SOL", "E11", "E12", "E13"
        bytes32 lowFeedId;      // e.g. "BTC_LOW"
        bytes32 highFeedId;     // e.g. "BTC_HIGH"
        uint8 signerSet;        // as getOracleSignerSet
    }

    // ------------------------------------------------------------ trading

    /// Settles after the window, using a RedStone-format signed payload appended to the calldata.
    /// The two ids are feed names ("BTC_LOW", "BTC_HIGH"), not prices; they must match
    /// getDataFeedIds(underlying). The winner takes the whole pot.
    function settlePosition(bytes20 positionId, bytes32 lowFeedId, bytes32 highFeedId) external;

    // ------------------------------------------------------------ reads

    /// Reverts PositionNotFound() once the position has been settled or cancelled.
    function getPositionDetails(bytes20 positionId) external view returns (
        uint256 startPrice, uint256 priceInterval, uint256 startTime, uint256 timeInterval,
        uint8 underlying, uint256 nonce, address taker, address maker,
        uint256 takerAmount, uint256 makerAmount
    );
    /// The taker.
    function ownerOfPosition(bytes20 positionId) external view returns (address);
    /// Underlyings 1 ETH, 2 BTC, 3 SOL, 4 E11 ("Steady"), 5 E12, 6 E13. Others revert
    /// UnsupportedUnderlying.
    function getUnderlyingInfo(uint8 underlying) external view returns (UnderlyingInfo memory);
    function getDataFeedIds(uint8 underlying) external view returns (bytes32 low, bytes32 high);
    /// 0 = RedStone Bolt node keys (ETH, BTC, SOL); 2 = Euphoria's own key (E11 to E13).
    function getOracleSignerSet(uint8 underlying) external view returns (uint256);
    /// Stake held in open positions, for a player or for the Vault.
    function getLockedBalance(address account) external view returns (uint256);
    function getPendingWithdrawal(address account) external view returns (uint256);
    function claimPendingWithdrawal() external;
    function rescuePendingWithdrawal(address from, address to) external;

    // ------------------------------------------------------------ RedStone consumer (standard)

    /// Reverts SignerNotAuthorised for anyone outside the hardcoded signer list.
    function getAuthorisedSignerIndex(address signer) external view returns (uint8);
    /// 1: one valid signature is enough.
    function getUniqueSignersThreshold() external view returns (uint8);
    function validateTimestamp(uint256 timestampMs) external view;
    function aggregateValues(uint256[] calldata values) external pure returns (uint256);
    function extractTimestampsAndAssertAllAreEqual() external pure returns (uint256);
    /// Reverts GetDataServiceIdNotImplemented.
    function getDataServiceId() external pure returns (string memory);
    function isTestnet() external view returns (bool);

    // ------------------------------------------------------------ EIP-712 (taker orders)

    function TAKER_ORDER_TYPEHASH() external pure returns (bytes32);
    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function EIP712_DOMAIN_NAME() external pure returns (string memory);    // "Euphoria"
    function EIP712_DOMAIN_VERSION() external pure returns (string memory); // "1"
    function eip712Domain() external view returns (
        bytes1 fields, string memory name, string memory version, uint256 chainId,
        address verifyingContract, bytes32 salt, uint256[] memory extensions
    );

    // ------------------------------------------------------------ admin (owner = 2-of-3 Safe)

    function collateralToken() external pure returns (address); // USDm
    function feeBasisPoints() external view returns (uint16);   // 0
    function setFeeBasisPoints(uint16 bps) external;
    function feeCollector() external view returns (address);
    function setFeeCollector(address collector) external;
    function pause() external;
    function unpause() external;
    function paused() external view returns (bool);
    function owner() external view returns (address);
    function pendingOwner() external view returns (address);
    function transferOwnership(address newOwner) external;
    function acceptOwnership() external;
    function renounceOwnership() external;
    function initialize(address owner_) external;
    function proxiableUUID() external view returns (bytes32);
    function UPGRADE_INTERFACE_VERSION() external pure returns (string memory); // "5.0.0"
    function upgradeToAndCall(address newImplementation, bytes calldata data) external payable;

    // ------------------------------------------------------------ events with known names

    event WithdrawalClaimed(address account, uint256 amount);
    event FeeCollectorUpdated(address collector);
    event FeeBasisPointsUpdated(uint16 bps);
    event Paused(address account);
    event Unpaused(address account);
    event Upgraded(address indexed implementation);
    event OwnershipTransferStarted(address indexed previousOwner, address indexed newOwner);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    // ------------------------------------------------------------ errors

    error PositionNotFound();                      // 0x6ec9be11
    error PositionDoesNotExist();                  // 0xf7b3b391
    error PositionNotExpired();                    // 0x13ef42aa
    error InvalidOracleRange();                    // 0xa0f5ba6a, low > high
    error UnsupportedUnderlying(uint8 underlying); // 0xf2aa03b5
    error InvalidFee();                            // 0x58d620b3
    error SignerNotAuthorised(address signer);     // 0xec459bc0
    error TimestampIsTooOld(uint256 receivedTimestampMs, uint256 blockTimestampMs);          // 0x0321d0b5
    error TimestampFromTooLongFuture(uint256 receivedTimestampMs, uint256 blockTimestampMs); // 0xb6b0916d
    error CalldataMustHaveValidPayload();          // 0xe7764c9e
    error DataFeedIdMismatch(bytes32 expected, bytes32 received); // 0x47e8e6df, argument names ours
    error OwnableUnauthorizedAccount(address account);             // 0x118cdaa7
}

/// Selectors and topics whose real names are unknown. Our labels are in the comments; the
/// behaviour comes from real transactions (tx) or eth_call (call) where marked, otherwise from
/// reading the bytecode (code). Call these with abi.encodePacked(selector, abi.encode(args)).
library EuphoriaUnnamed {
    /// Order as it appears in calldata (one ABI tuple, field order as here):
    /// (address taker, address maker, uint256 takerAmount, uint256 makerAmount, uint8 underlying,
    ///  uint256 nonce, uint256 startTime, uint256 timeInterval, uint256 startPrice,
    ///  uint256 priceInterval, bytes signature)

    /// "open position" (tx): (Order). Sent by an operator key every time. Pulls takerAmount from the taker and calls
    /// Vault.fundPosition(makerAmount). Used by 9,323 of 9,324 sampled opens.
    bytes4 internal constant OPEN = 0x93ca625d;
    /// "open with permit" (tx, 1 of 5,442 October opens): (Order, uint256 value, uint256 deadline,
    /// uint8 v, bytes32 r, bytes32 s). Runs USDm.permit for the taker first.
    bytes4 internal constant OPEN_WITH_PERMIT = 0x6f7e758c;
    /// "operator settle" (call): (bytes20 positionId, uint256 low, uint256 high). Operators only
    /// (others get NOT_OPERATOR). Simulated from an operator key: reverts PositionNotExpired
    /// before the window ends; one block after it ends it succeeds with any low <= high the
    /// operator picks, and reverts InvalidOracleRange if low > high.
    bytes4 internal constant OPERATOR_SETTLE = 0x73b13318;
    /// "cancel" (call): (bytes20 positionId). Refunds both sides. Simulated from an operator key it
    /// succeeds on a live position, before its window starts; others get NOT_OPERATOR; an
    /// unknown id reverts PositionDoesNotExist.
    bytes4 internal constant CANCEL = 0xab73418a;

    /// "isOperator(address) -> bool" (call): true for the 1,000 current operator keys.
    bytes4 internal constant IS_OPERATOR = 0x6002095b;
    /// "operators() -> address[]" (call).
    bytes4 internal constant OPERATORS = 0x88dd2204;
    /// "operatorCount() -> uint256" (call): 1,000.
    bytes4 internal constant OPERATOR_COUNT = 0x07c107a7;
    /// "operatorAt(uint256) -> address" (call).
    bytes4 internal constant OPERATOR_AT = 0xfeddc85c;
    /// "addOperator(address) -> bool" (call): returns true when simulated from the owner Safe,
    /// reverts OwnableUnauthorizedAccount otherwise; emits OPERATOR_ADDED.
    bytes4 internal constant ADD_OPERATOR = 0xff4ca80e;
    /// "removeOperator(address) -> bool" (call): the same, for removal; emits OPERATOR_REMOVED.
    bytes4 internal constant REMOVE_OPERATOR = 0x594936c3;
    /// "isTestUnderlying(uint8) -> bool" (call, code): underlying >= 240.
    bytes4 internal constant IS_TEST_UNDERLYING = 0x8a71c6a0;
    /// "TEST_UNDERLYING_START() -> uint256" (call): 240.
    bytes4 internal constant TEST_UNDERLYING_START = 0x20b0a709;

    /// "PositionOpened(bytes20 indexed id, address indexed taker, address indexed maker)" (tx).
    bytes32 internal constant POSITION_OPENED = 0x9f039a0ca58d6157d7b6914e2d60cedacf65fea21a365e93d708a5e5c25454f3;
    /// "PositionSettled(bytes20 indexed id, address indexed winner, uint256 payout, uint256)" (tx).
    /// winner is the taker or the Vault (546 and 1,483 of 2,029 on Nov 20); payout is the pot.
    /// The last field was zero in all 7,471 settlements sampled; with fees at 0 bps it is most
    /// likely the fee.
    bytes32 internal constant POSITION_SETTLED = 0x90cacdb710d0777a8e5fb6387c414be82e2ffe362a703077117a2a995fce12c1;
    /// "Balance(address indexed account, uint256)" (tx): after each USDm movement; the value
    /// matches the account's USDm balance afterwards (checked for the Vault).
    bytes32 internal constant BALANCE = 0x163aa6d2d8e5248ce93dbd22509af93e5f27f8e0edc15c9e26f2867c593e0870;
    /// "OperatorAdded(address indexed)" (tx): 1,000 keys at launch (blocks 12,189,043 to
    /// 12,189,397), 1,000 new keys in May (blocks 15,392,835 to 15,393,376).
    bytes32 internal constant OPERATOR_ADDED = 0xdf36591d9c2d1e71f6cc2b849afcf774607ac4adcc7897fbf708d73810867a2b;
    /// "OperatorRemoved(address indexed)" (tx): the 1,000 launch keys, blocks 15,407,818 to
    /// 15,408,043.
    bytes32 internal constant OPERATOR_REMOVED = 0x92c2b40e3c31c052e6182701e7acd8ddd2b64a1e1ad7bde896ffd0701186cab7;
    /// Declared in the bytecode, never emitted by the Exchange proxy (checked over all history).
    bytes32 internal constant UNUSED_EVENT = 0xbd710f93b7c83aa6ced166a252dcdc41f47a582056b7306cd808207bf2a7cd07;

    /// "not an operator" (call): what non-operators get from the operator-only functions.
    bytes4 internal constant NOT_OPERATOR = 0x17cb2fd6;
}

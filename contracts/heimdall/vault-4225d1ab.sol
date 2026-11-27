// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/// @title            Decompiled Contract
/// @author           Jonathan Becker <jonathan@jbecker.dev>
/// @custom:version   heimdall-rs v0.9.2
///
/// @notice           This contract was decompiled using the heimdall-rs decompiler.
///                     It was generated directly by tracing the EVM opcodes from this contract.
///                     As a result, it may not compile or even be valid solidity code.
///                     Despite this, it should be obvious what each function does. Overall
///                     logic should have been preserved throughout decompiling.
///
/// @custom:github    You can find the open-source decompiler here:
///                       https://heimdall.rs

contract DecompiledContract {
    uint256 public constant proxiableUUID = e07c8dba;
    bytes public constant UPGRADE_INTERFACE_VERSION = 0xBytes([53, 46, 48, 46, 48]);
    
    mapping(bytes32 => bytes32) storage_map_b;
    bytes32 store_a;
    
    event Event_21d8cd1e();
    event ExchangeSet(address);
    event Event_5578e013();
    event Event_64c18e2f();
    event Event_17e4d0ee();
    event Approval(address, address, uint256);
    error ERC20InvalidSender(address);
    event DepositorWhitelistAdded(address);
    event Paused(address);
    event Event_f57de0e1();
    event Transfer(address, address, uint256);
    event Upgraded(address);
    event DepositorWhitelistRemoved(address);
    event OwnershipTransferStarted(address, address);
    event Unpaused(address);
    event OwnershipTransferred(address, address);
    
    /// @custom:selector    0x06fdde03
    /// @custom:signature   name() public view returns (string memory)
    function name() public view returns (string memory) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        if (!store_a) {
            if (((store_a >> 0x01) < 0x20) == (store_a)) {
                if (!store_a) {
                    if (0x01 == (store_a)) {
                        if (0 < (store_a >> 0x01)) {
                            if (((var_d + (uint248(((0x20 + (var_d + 0)) - var_d) + 0x1f))) > 0xffffffffffffffff) | ((var_d + (uint248(((0x20 + (var_d + 0)) - var_d) + 0x1f))) < var_d)) {
                                uint248 var_d = var_d + (uint248(((0x20 + (var_d + 0)) - var_d) + 0x1f));
                                return abi.encodePacked(0x20, var_d.length);
                                if (((var_d + (uint248((0 - var_d) + 0x1f))) > 0xffffffffffffffff) | ((var_d + (uint248((0 - var_d) + 0x1f))) < var_d)) {
                                    var_d = var_d + (uint248((0 - var_d) + 0x1f));
                                    var_d = 0;
                                    return abi.encodePacked(0x20, var_d.length);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    /// @custom:selector    0xb3d7f6b9
    /// @custom:signature   previewMint(uint256 arg0) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function previewMint(uint256 arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        address var_c = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_c); // staticcall
        var_c = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_c4086893(var_c); // staticcall
        require(0 > 0);
        require(0 > 0x01);
        require(store_a > (store_a + 0x0f4240));
        var_d = 0x11;
        require(((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * 0x01) == (((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * 0x01)));
        require(!(store_a + 0x0f4240) > (((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * 0x01) - (((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * 0x01))));
        require(!store_a + 0x0f4240);
        require(!0x01 < 0x04);
        require(0x01 == 0x01);
        require(!store_a + 0x0f4240);
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x4f1ef286
    /// @custom:signature   Unresolved_4f1ef286(address arg0, uint256 arg1) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function Unresolved_4f1ef286(address arg0, uint256 arg1) public payable {
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x40);
        require(arg0 - (address(arg0)));
        require(arg1 > 0xffffffffffffffff);
        require(!((arg1 + 0x23) < msg.data.length), CustomError_e07c8dba());
        require(arg1 > 0xffffffffffffffff, CustomError_e07c8dba());
        require(((var_c + (uint248((0x20 + (arg1 + 0x1f)) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248((0x20 + (arg1 + 0x1f)) + 0x1f))) < var_c), CustomError_e07c8dba());
        uint256 var_c = var_c + (uint248((0x20 + (arg1 + 0x1f)) + 0x1f));
        uint256 var_d = (arg1);
        require((arg1 + 0x24) + var_d > msg.data.length, CustomError_e07c8dba());
        require(!(0x4225d1ab3c5efb7895b7167151d978f16c995f7c == address(this)), CustomError_e07c8dba());
        require(0x4225d1ab3c5efb7895b7167151d978f16c995f7c == address(this), CustomError_e07c8dba());
        require(msg.sender - (address(store_a)), CustomError_118cdaa7());
        (bool success, bytes memory ret0) = address(arg0).proxiableUUID(); // staticcall
        var_a = var_a;
        require(0 - var_a, CustomError_4c9c8ce3());
        require(!address(arg0).code.length, CustomError_4c9c8ce3());
        store_a = (address(arg0)) | (uint96(store_a));
        emit Upgraded(address(arg0));
        require(!var_c.length, CustomError_d6bda275());
        (bool success, bytes memory ret0) = address(arg0).Unresolved_(var_g); // delegatecall
        require(!ret0.length, CustomError_d6bda275());
        var_c = (var_c + ret0.length) + 0x20;
        if (ret0.length) {
        }
        require(msg.value, CustomError_b398979f());
        require(0x20 > ret0.length);
        require(((var_c + 0x20) > 0xffffffffffffffff) | ((var_c + 0x20) < var_c));
        var_c = var_c + 0x20;
        require(((var_c + 0x20) - var_c) < 0x20);
        require(!(address(store_a) == 0x4225d1ab3c5efb7895b7167151d978f16c995f7c), CustomError_e07c8dba());
    }
    
    /// @custom:selector    0x20124bce
    /// @custom:signature   availableAssets() public payable returns (uint256)
    function availableAssets() public payable returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        address var_c = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_c); // staticcall
        return 0;
        require(0x20 > ret0.length);
        require(((var_d + 0x20) > 0xffffffffffffffff) | ((var_d + 0x20) < var_d));
        uint256 var_d = var_d + 0x20;
        require(((var_d + 0x20) - var_d) < 0x20);
        return var_d.length;
    }
    
    /// @custom:selector    0xf30c6a1a
    /// @custom:signature   addToDepositorWhitelist(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function addToDepositorWhitelist(address arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        require(msg.sender - (address(store_a)), CustomError_6afcb78f());
        address var_a = address(arg0);
        storage_map_b[var_a] = 0x01 | (uint248(storage_map_b[var_a]));
        emit DepositorWhitelistAdded(address(arg0));
    }
    
    /// @custom:selector    0x402d267d
    /// @custom:signature   maxDeposit(address arg0) public pure returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function maxDeposit(address arg0) public pure returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        return 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    }
    
    /// @custom:selector    0x23b872dd
    /// @custom:signature   transferFrom(address arg0, address arg1, uint256 arg2) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    function transferFrom(address arg0, address arg1, uint256 arg2) public payable returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x60);
        require(arg0 - (address(arg0)));
        require(arg1 - (address(arg1)));
        var_a = address(msg.sender);
        require(storage_map_b[var_a] < 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, CustomError_e450d38c());
        require(!(address(arg0)), CustomError_e450d38c());
        require(!(address(arg1)), CustomError_e450d38c());
        var_a = var_a;
        require(storage_map_b[var_a] < arg2, CustomError_e450d38c());
        var_a = 0xe450d38c00000000000000000000000000000000000000000000000000000000;
        var_a = var_a;
        storage_map_b[var_a] = storage_map_b[var_a] - arg2;
        var_a = var_a;
        storage_map_b[var_a] = storage_map_b[var_a] + arg2;
        emit Transfer(address(arg0), address(arg1), arg2);
        return 0x01;
        var_a = 0x96c6fd1e00000000000000000000000000000000000000000000000000000000;
        require(storage_map_b[var_a] < arg2, CustomError_fb8f41b2());
        var_a = 0xfb8f41b200000000000000000000000000000000000000000000000000000000;
        require(!(address(arg0)), CustomError_94280d62());
        require(!(address(msg.sender)), CustomError_94280d62());
    }
    
    /// @custom:selector    0xab8d38a4
    /// @custom:signature   Unresolved_ab8d38a4(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_ab8d38a4(address arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        require(msg.sender - (address(store_a)), CustomError_6afcb78f());
        require(!(address(arg0)), CustomError_d92e233d());
        store_a = (address(arg0)) | (uint96(store_a));
        emit Event_21d8cd1e(address(arg0));
    }
    
    /// @custom:selector    0x53756591
    /// @custom:signature   Unresolved_53756591() public payable
    function Unresolved_53756591() public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        require(msg.sender - (address(store_a)), CustomError_6afcb78f());
        store_a = 0x010000000000000000000000000000000000000000 | (uint248(store_a));
        emit Event_5578e013();
    }
    
    /// @custom:selector    0xc6e6f592
    /// @custom:signature   convertToShares(uint256 arg0) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function convertToShares(uint256 arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(store_a > (store_a + 0x0f4240));
        address var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_d); // staticcall
        var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_c4086893(var_d); // staticcall
        require(0 > 0);
        require(0 > 0x01);
        var_b = 0x11;
        require(((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * (store_a + 0x0f4240)) == (((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * (store_a + 0x0f4240))));
        require(!0x01 > (((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * (store_a + 0x0f4240)) - (((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * (store_a + 0x0f4240)))));
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!0x01);
        require(!0x01);
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!0x01);
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x18160ddd
    /// @custom:signature   totalSupply() public view returns (uint256)
    function totalSupply() public view returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return store_a;
    }
    
    /// @custom:selector    0x5185fb34
    /// @custom:signature   Unresolved_5185fb34() public payable
    function Unresolved_5185fb34() public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        require(msg.sender - (address(store_a)), CustomError_6afcb78f());
        store_a = uint96(store_a);
        emit Event_f57de0e1();
    }
    
    /// @custom:selector    0x4cdad506
    /// @custom:signature   previewRedeem(uint256 arg0) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function previewRedeem(uint256 arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        address var_c = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_c); // staticcall
        var_c = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_c4086893(var_c); // staticcall
        require(0 > 0);
        require(0 > 0x01);
        require(store_a > (store_a + 0x0f4240));
        var_d = 0x11;
        require(((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * 0x01) == (((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * 0x01)));
        require(!(store_a + 0x0f4240) > (((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * 0x01) - (((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * 0x01))));
        require(!store_a + 0x0f4240);
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!store_a + 0x0f4240);
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0xba087652
    /// @custom:signature   redeem(uint256 arg0, address arg1, address arg2) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg2 ["address", "uint160", "bytes20", "int160"]
    function redeem(uint256 arg0, address arg1, address arg2) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x60);
        require(arg1 - (address(arg1)));
        require(arg2 - (address(arg2)));
        var_a = var_a;
        address var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_d); // staticcall
        require(store_a > (store_a + 0x0f4240));
        var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_d); // staticcall
        var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_c4086893(var_d); // staticcall
        require(0 > 0);
        require(0 > 0x01);
        var_e = 0x11;
        require(((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (0 * (store_a + 0x0f4240)) == (((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (0 * (store_a + 0x0f4240))));
        require(!0x01 > (((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (0 * (store_a + 0x0f4240)) - (((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (0 * (store_a + 0x0f4240)))));
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!0x01);
        require(!0x01);
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!0x01);
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x40eedabb
    /// @custom:signature   leader() public view returns (address)
    function leader() public view returns (address) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return address(store_a);
    }
    
    /// @custom:selector    0xb460af94
    /// @custom:signature   withdraw(uint256 arg0, address arg1, address arg2) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg2 ["address", "uint160", "bytes20", "int160"]
    function withdraw(uint256 arg0, address arg1, address arg2) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x60);
        require(arg1 - (address(arg1)));
        require(arg2 - (address(arg2)));
        var_a = var_a;
        address var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_d); // staticcall
        require(store_a > (store_a + 0x0f4240));
        var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_d); // staticcall
        var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_c4086893(var_d); // staticcall
        require(0 > 0);
        require(0 > 0x01);
        var_e = 0x11;
        require(((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (0 * (store_a + 0x0f4240)) == (((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (0 * (store_a + 0x0f4240))));
        require(!0x01 > (((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (0 * (store_a + 0x0f4240)) - (((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (0 * (store_a + 0x0f4240)))));
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!0x01);
        require(!0x01);
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!0x01);
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0xd2f7265a
    /// @custom:signature   exchange() public view returns (address)
    function exchange() public view returns (address) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return address(store_a);
    }
    
    /// @custom:selector    0x226ac791
    /// @custom:signature   isWhitelistedDepositor(address arg0) public view returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function isWhitelistedDepositor(address arg0) public view returns (bool) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        address var_a = address(arg0);
        return !(!bytes1(storage_map_b[var_a]));
    }
    
    /// @custom:selector    0x67b1f5df
    /// @custom:signature   setExchange(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function setExchange(address arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        require(msg.sender - (address(store_a)), CustomError_118cdaa7());
        require(!(address(arg0)), CustomError_d92e233d());
        store_a = (address(arg0)) | (uint96(store_a));
        emit ExchangeSet(address(arg0));
    }
    
    /// @custom:selector    0x79ba5097
    /// @custom:signature   acceptOwnership() public payable
    function acceptOwnership() public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        require(address(store_a) - msg.sender, CustomError_118cdaa7());
        store_a = uint96(store_a);
        store_a = (address(msg.sender)) | (uint96(store_a));
        emit OwnershipTransferred(address(store_a), address(msg.sender));
    }
    
    /// @custom:selector    0xd4329775
    /// @custom:signature   Unresolved_d4329775() public view returns (bool)
    function Unresolved_d4329775() public view returns (bool) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return !(!bytes1(store_a >> 0xa0));
    }
    
    /// @custom:selector    0x095ea7b3
    /// @custom:signature   approve(address arg0, uint256 arg1) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function approve(address arg0, uint256 arg1) public payable returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x40);
        require(arg0 - (address(arg0)));
        require(!msg.sender, CustomError_94280d62());
        require(!(address(arg0)), CustomError_94280d62());
        var_a = address(arg0);
        storage_map_b[var_a] = arg1;
        emit Approval(msg.sender, address(arg0), arg1);
        return 0x01;
    }
    
    /// @custom:selector    0xdb8d8fc6
    /// @custom:signature   Unresolved_db8d8fc6(address arg0, uint256 arg1, uint256 arg2, address arg3, address arg4, address arg5) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg4 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg5 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_db8d8fc6(address arg0, uint256 arg1, uint256 arg2, address arg3, address arg4, address arg5) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0xc0);
        require(arg0 - (address(arg0)));
        require(arg1 > 0xffffffffffffffff);
        require(arg1 > 0xffffffffffffffff);
        require(((var_c + (uint248((0x20 + (arg1 + 0x1f)) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248((0x20 + (arg1 + 0x1f)) + 0x1f))) < var_c));
        uint256 var_c = var_c + (uint248((0x20 + (arg1 + 0x1f)) + 0x1f));
        require(arg2 > 0xffffffffffffffff);
        require(arg2 > 0xffffffffffffffff);
        require(((var_c + (uint248((0x20 + (arg2 + 0x1f)) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248((0x20 + (arg2 + 0x1f)) + 0x1f))) < var_c));
        var_c = var_c + (uint248((0x20 + (arg2 + 0x1f)) + 0x1f));
        require(arg3 - (address(arg3)));
        require(arg4 - (address(arg4)));
        require(arg5 - (address(arg5)));
        if (!uint64(store_a)) {
            require(!(uint64(store_a)), CustomError_d7e6bcf8());
            require(0x01 == (uint64(store_a)), CustomError_d7e6bcf8());
            require(!(!uint64(store_a)), CustomError_d7e6bcf8());
            store_a = 0x01 | (uint192(store_a));
            require(address(this).code.length, CustomError_d7e6bcf8());
            require(!(bytes1(store_a >> 0x40)), CustomError_d7e6bcf8());
            require(!(bytes1(store_a >> 0x40)), CustomError_d7e6bcf8());
            require(!(bytes1(store_a >> 0x40)), CustomError_d7e6bcf8());
            require(var_c.length > 0xffffffffffffffff, CustomError_d7e6bcf8());
            require(!(bytes1(store_a)), CustomError_d7e6bcf8());
            require(((store_a >> 0x01) < 0x20) == (bytes1(store_a)), CustomError_d7e6bcf8());
            require((store_a >> 0x01) > 0x1f, CustomError_d7e6bcf8());
            require(var_c.length < 0x20, CustomError_d7e6bcf8());
            require((0x2ae08a8e29253f69ac5d979a101956ab8f8d9d7ded63fa7a83b16fc47648eab0 + ((var_c.length + 0x1f) >> 0x05)) < ((((store_a >> 0x01) + 0x1f) >> 0x05) + 0x2ae08a8e29253f69ac5d979a101956ab8f8d9d7ded63fa7a83b16fc47648eab0), CustomError_d7e6bcf8());
            var_a = var_a;
            require(0x01 == (var_c.length > 0x1f), CustomError_d7e6bcf8());
            require(0 < (uint248(var_c.length)), CustomError_d7e6bcf8());
            storage_map_b[var_a] = (~(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff >> (bytes1(var_c.length << 0x03)))) & (var_h);
            store_a = (var_c.length << 0x01) + 0x01;
            require(uint248(var_c.length) < var_c.length, CustomError_d7e6bcf8());
            require(var_c.length > 0xffffffffffffffff, CustomError_d7e6bcf8());
        }
        store_a = 0x010000000000000001 | (uint184(store_a));
        require(!(bytes1(store_a >> 0x40)), CustomError_d7e6bcf8());
        require(!(bytes1(store_a >> 0x40)), CustomError_d7e6bcf8());
        require(!(!uint64(store_a)), CustomError_f92ee8a9());
    }
    
    /// @custom:selector    0x274fc72a
    /// @custom:signature   lockedAssets() public payable returns (uint256)
    function lockedAssets() public payable returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        address var_c = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_c4086893(var_c); // staticcall
        return 0;
        require(0x20 > ret0.length);
        require(((var_d + 0x20) > 0xffffffffffffffff) | ((var_d + 0x20) < var_d));
        uint256 var_d = var_d + 0x20;
        require(((var_d + 0x20) - var_d) < 0x20);
        return var_d.length;
    }
    
    /// @custom:selector    0xf2fde38b
    /// @custom:signature   transferOwnership(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function transferOwnership(address arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        require(msg.sender - (address(store_a)), CustomError_118cdaa7());
        store_a = (address(arg0)) | (uint96(store_a));
        emit OwnershipTransferStarted(address(store_a), address(arg0));
    }
    
    /// @custom:selector    0xc63d75b6
    /// @custom:signature   maxMint(address arg0) public pure returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function maxMint(address arg0) public pure returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        return 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    }
    
    /// @custom:selector    0x07a2d13a
    /// @custom:signature   convertToAssets(uint256 arg0) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function convertToAssets(uint256 arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        address var_c = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_c); // staticcall
        var_c = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_c4086893(var_c); // staticcall
        require(0 > 0);
        require(0 > 0x01);
        require(store_a > (store_a + 0x0f4240));
        var_d = 0x11;
        require(((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * 0x01) == (((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * 0x01)));
        require(!(store_a + 0x0f4240) > (((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * 0x01) - (((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * 0x01))));
        require(!store_a + 0x0f4240);
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!store_a + 0x0f4240);
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x8456cb59
    /// @custom:signature   pause() public payable
    function pause() public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        require(msg.sender - (address(store_a)), CustomError_118cdaa7());
        require(bytes1(store_a), CustomError_d93c0665());
        store_a = (uint248(store_a)) | 0x01;
        emit Paused(msg.sender);
    }
    
    /// @custom:selector    0xa9059cbb
    /// @custom:signature   transfer(address arg0, uint256 arg1) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function transfer(address arg0, uint256 arg1) public payable returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x40);
        require(arg0 - (address(arg0)));
        require(!(address(msg.sender)), CustomError_e450d38c());
        require(!(address(arg0)), CustomError_e450d38c());
        var_a = var_a;
        require(storage_map_b[var_a] < arg1, CustomError_e450d38c());
        var_a = 0xe450d38c00000000000000000000000000000000000000000000000000000000;
        var_a = var_a;
        storage_map_b[var_a] = storage_map_b[var_a] - arg1;
        var_a = var_a;
        storage_map_b[var_a] = storage_map_b[var_a] + arg1;
        emit Transfer(address(msg.sender), address(arg0), arg1);
        return 0x01;
    }
    
    /// @custom:selector    0x23bbfd76
    /// @custom:signature   Unresolved_23bbfd76() public payable
    function Unresolved_23bbfd76() public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        require(msg.sender - (address(store_a)), CustomError_6afcb78f());
        store_a = uint248(store_a);
        emit Event_64c18e2f();
    }
    
    /// @custom:selector    0x4bf0d331
    /// @custom:signature   canDeposit(address arg0) public view returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function canDeposit(address arg0) public view returns (bool) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        require(!bytes1(store_a >> 0xa0));
        require(!bytes1(store_a >> 0xa0));
        return !(!bytes1(store_a >> 0xa0));
        address var_a = address(arg0);
        return !(!bytes1(storage_map_b[var_a]));
        require(!(address(store_a)) == (address(arg0)));
        var_a = address(arg0);
        return !(!bytes1(storage_map_b[var_a]));
        return !(!(address(store_a)) == (address(arg0)));
    }
    
    /// @custom:selector    0x6e553f65
    /// @custom:signature   deposit(uint256 arg0, address arg1) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    function deposit(uint256 arg0, address arg1) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x40);
        require(arg1 - (address(arg1)));
        require(!bytes1(store_a >> 0xa0));
        require(!bytes1(store_a >> 0xa0));
        require(!bytes1(store_a >> 0xa0));
        require(store_a > (store_a + 0x0f4240));
        address var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_d); // staticcall
        var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_c4086893(var_d); // staticcall
        require(0 > 0);
        require(0 > 0x01);
        var_b = 0x11;
        require(((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * (store_a + 0x0f4240)) == (((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * (store_a + 0x0f4240))));
        require(!0x01 > (((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * (store_a + 0x0f4240)) - (((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * (store_a + 0x0f4240)))));
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!0x01);
        require(!0x01);
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!0x01);
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        if (0x20 > ret0.length) {
        }
        require(!(address(store_a) == (address(msg.sender))), CustomError_717a1648());
        require(!(address(store_a) == (address(msg.sender))), CustomError_717a1648());
    }
    
    /// @custom:selector    0xce96cb77
    /// @custom:signature   maxWithdraw(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function maxWithdraw(address arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        var_a = var_a;
        address var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_d); // staticcall
        require(store_a > (store_a + 0x0f4240));
        var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_d); // staticcall
        var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_c4086893(var_d); // staticcall
        require(0 > 0);
        require(0 > 0x01);
        var_e = 0x11;
        require(((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (0 * (store_a + 0x0f4240)) == (((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (0 * (store_a + 0x0f4240))));
        require(!0x01 > (((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (0 * (store_a + 0x0f4240)) - (((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (0 * (store_a + 0x0f4240)))));
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!0x01);
        require(!0x01);
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!0x01);
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0xe30c3978
    /// @custom:signature   pendingOwner() public view returns (address)
    function pendingOwner() public view returns (address) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return address(store_a);
    }
    
    /// @custom:selector    0xef8b30f7
    /// @custom:signature   previewDeposit(uint256 arg0) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function previewDeposit(uint256 arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(store_a > (store_a + 0x0f4240));
        address var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_d); // staticcall
        var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_c4086893(var_d); // staticcall
        require(0 > 0);
        require(0 > 0x01);
        var_b = 0x11;
        require(((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * (store_a + 0x0f4240)) == (((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * (store_a + 0x0f4240))));
        require(!0x01 > (((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * (store_a + 0x0f4240)) - (((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * (store_a + 0x0f4240)))));
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!0x01);
        require(!0x01);
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!0x01);
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x8da5cb5b
    /// @custom:signature   owner() public view returns (address)
    function owner() public view returns (address) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return address(store_a);
    }
    
    /// @custom:selector    0x0a28a477
    /// @custom:signature   previewWithdraw(uint256 arg0) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function previewWithdraw(uint256 arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(store_a > (store_a + 0x0f4240));
        address var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_d); // staticcall
        var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_c4086893(var_d); // staticcall
        require(0 > 0);
        require(0 > 0x01);
        var_b = 0x11;
        require(((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * (store_a + 0x0f4240)) == (((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * (store_a + 0x0f4240))));
        require(!0x01 > (((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * (store_a + 0x0f4240)) - (((arg0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * (store_a + 0x0f4240)))));
        require(!0x01 < 0x04);
        require(0x01 == 0x01);
        require(!0x01);
        require(!0x01);
        require(!0x01 < 0x04);
        require(0x01 == 0x01);
        require(!0x01);
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x70a08231
    /// @custom:signature   balanceOf(address arg0) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function balanceOf(address arg0) public view returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        var_a = var_a;
        return storage_map_b[var_a];
    }
    
    /// @custom:selector    0x5c975abb
    /// @custom:signature   paused() public view returns (bool)
    function paused() public view returns (bool) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return !(!bytes1(store_a));
    }
    
    /// @custom:selector    0x313ce567
    /// @custom:signature   decimals() public view returns (bool)
    function decimals() public view returns (bool) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        if (((store_a >> 0xa0) + 0x06) > 0xff) {
            return bytes1((store_a >> 0xa0) + 0x06);
        }
    }
    
    /// @custom:selector    0x95d89b41
    /// @custom:signature   symbol() public view returns (string memory)
    function symbol() public view returns (string memory) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        if (!store_a) {
            if (((store_a >> 0x01) < 0x20) == (store_a)) {
                if (!store_a) {
                    if (0x01 == (store_a)) {
                        if (0 < (store_a >> 0x01)) {
                            if (((var_d + (uint248(((0x20 + (var_d + 0)) - var_d) + 0x1f))) > 0xffffffffffffffff) | ((var_d + (uint248(((0x20 + (var_d + 0)) - var_d) + 0x1f))) < var_d)) {
                                uint248 var_d = var_d + (uint248(((0x20 + (var_d + 0)) - var_d) + 0x1f));
                                return abi.encodePacked(0x20, var_d.length);
                                if (((var_d + (uint248((0 - var_d) + 0x1f))) > 0xffffffffffffffff) | ((var_d + (uint248((0 - var_d) + 0x1f))) < var_d)) {
                                    var_d = var_d + (uint248((0 - var_d) + 0x1f));
                                    var_d = 0;
                                    return abi.encodePacked(0x20, var_d.length);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    /// @custom:selector    0xec4f7e20
    /// @custom:signature   fundPosition(uint256 arg0) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function fundPosition(uint256 arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20, CustomError_5dd9d0db());
        require(msg.sender - (address(store_a)), CustomError_5dd9d0db());
        require(bytes1(store_a), CustomError_5274afe7());
        var_a = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
        var_b = address(store_a);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_a9059cbb(var_b); // call
        require(!(success & (var_a == 0x01)), CustomError_5274afe7());
        require(bytes1(!success));
        require(!((!ret0.length) & (address(store_a).code.length) & (success)), CustomError_5274afe7());
    }
    
    /// @custom:selector    0xd905777e
    /// @custom:signature   maxRedeem(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function maxRedeem(address arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        var_a = var_a;
        address var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_d); // staticcall
        require(store_a > (store_a + 0x0f4240));
        var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_d); // staticcall
        var_d = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_c4086893(var_d); // staticcall
        require(0 > 0);
        require(0 > 0x01);
        var_e = 0x11;
        require(((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (0 * (store_a + 0x0f4240)) == (((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (0 * (store_a + 0x0f4240))));
        require(!0x01 > (((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (0 * (store_a + 0x0f4240)) - (((0 * (store_a + 0x0f4240)) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (0 * (store_a + 0x0f4240)))));
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!0x01);
        require(!0x01);
        require(!0 < 0x04);
        require(0 == 0x01);
        require(!0x01);
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0xdd62ed3e
    /// @custom:signature   allowance(address arg0, address arg1) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    function allowance(address arg0, address arg1) public view returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x40);
        require(arg0 - (address(arg0)));
        require(arg1 - (address(arg1)));
        var_a = address(arg1);
        return storage_map_b[var_a];
    }
    
    /// @custom:selector    0x340fea41
    /// @custom:signature   Unresolved_340fea41() public view returns (address)
    function Unresolved_340fea41() public view returns (address) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return address(store_a);
    }
    
    /// @custom:selector    0x715018a6
    /// @custom:signature   renounceOwnership() public payable
    function renounceOwnership() public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        require(msg.sender - (address(store_a)), CustomError_118cdaa7());
        store_a = uint96(store_a);
        store_a = uint96(store_a);
        emit OwnershipTransferred(address(store_a), 0);
    }
    
    /// @custom:selector    0x01e1d114
    /// @custom:signature   totalAssets() public payable returns (uint256)
    function totalAssets() public payable returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        address var_c = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_c); // staticcall
        var_c = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_c4086893(var_c); // staticcall
        require(0 > 0);
        return 0;
        require(0x20 > ret0.length);
        require(((var_e + 0x20) > 0xffffffffffffffff) | ((var_e + 0x20) < var_e));
        uint256 var_e = var_e + 0x20;
        require(((var_e + 0x20) - var_e) < 0x20);
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x3f4ba83a
    /// @custom:signature   unpause() public payable
    function unpause() public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        require(msg.sender - (address(store_a)), CustomError_118cdaa7());
        require(!(bytes1(store_a)), CustomError_8dfc202b());
        store_a = uint248(store_a);
        emit Unpaused(msg.sender);
    }
    
    /// @custom:selector    0x8b162b29
    /// @custom:signature   Unresolved_8b162b29() public payable
    function Unresolved_8b162b29() public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        require(msg.sender - (address(store_a)), CustomError_e4692ee4());
        store_a = (address(store_a)) | (uint96(store_a));
        store_a = uint96(store_a);
        emit Event_17e4d0ee(address(store_a), address(store_a));
    }
    
    /// @custom:selector    0x38d52e0f
    /// @custom:signature   asset() public view returns (address)
    function asset() public view returns (address) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return address(store_a);
    }
    
    /// @custom:selector    0x90e2c934
    /// @custom:signature   removeFromDepositorWhitelist(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function removeFromDepositorWhitelist(address arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        require(msg.sender - (address(store_a)), CustomError_6afcb78f());
        address var_a = address(arg0);
        storage_map_b[var_a] = uint248(storage_map_b[var_a]);
        emit DepositorWhitelistRemoved(address(arg0));
    }
    
    /// @custom:selector    0x94bf804d
    /// @custom:signature   mint(uint256 arg0, address arg1) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    function mint(uint256 arg0, address arg1) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x40);
        require(arg1 - (address(arg1)));
        require(!bytes1(store_a >> 0xa0));
        require(!bytes1(store_a >> 0xa0));
        require(!bytes1(store_a >> 0xa0));
        address var_c = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_70a08231(var_c); // staticcall
        var_c = address(this);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_c4086893(var_c); // staticcall
        require(0 > 0);
        require(0 > 0x01);
        require(store_a > (store_a + 0x0f4240));
        var_d = 0x11;
        require(((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * 0x01) == (((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * 0x01)));
        require(!(store_a + 0x0f4240) > (((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg0 * 0x01) - (((arg0 * 0x01) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg0 * 0x01))));
        require(!store_a + 0x0f4240);
        require(!0x01 < 0x04);
        require(0x01 == 0x01);
        require(!store_a + 0x0f4240);
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        if (0x20 > ret0.length) {
        }
        require(!(address(store_a) == (address(msg.sender))), CustomError_717a1648());
        require(!(address(store_a) == (address(msg.sender))), CustomError_717a1648());
    }
}
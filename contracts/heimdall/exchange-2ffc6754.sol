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
    bytes public constant getDataServiceId = 608b5307;
    bytes public constant EIP712_DOMAIN_NAME = 0xBytes([69, 117, 112, 104, 111, 114, 105, 97]);
    uint256 public constant getUniqueSignersThreshold = 1;
    bytes public constant EIP712_DOMAIN_VERSION = 0xBytes([49]);
    uint256 public constant collateralToken = 1432908920077931773236292752412684396702889703911;
    uint256 public constant unresolved_20b0a709 = 240;
    uint256 public constant TAKER_ORDER_TYPEHASH = 10603402632332447229679325466016371962007389700358194443305398164092831349407;
    
    mapping(bytes32 => bytes32) storage_map_l;
    mapping(bytes32 => bytes32) storage_map_h;
    mapping(bytes32 => bytes32) storage_map_i;
    mapping(bytes32 => bytes32) storage_map_p;
    mapping(bytes32 => bytes32) storage_map_r;
    mapping(bytes32 => bytes32) storage_map_c;
    mapping(bytes32 => bytes32) storage_map_f;
    bytes32 store_j;
    mapping(bytes32 => bytes32) storage_map_g;
    mapping(bytes32 => bytes32) storage_map_e;
    bytes32 store_a;
    mapping(bytes32 => bytes32) storage_map_n;
    mapping(bytes32 => bytes32) storage_map_b;
    mapping(bytes32 => bytes32) storage_map_q;
    mapping(bytes32 => bytes32) storage_map_m;
    bytes32 store_s;
    mapping(bytes32 => bytes32) storage_map_o;
    mapping(bytes32 => bytes32) storage_map_d;
    bytes32 store_t;
    mapping(bytes32 => bytes32) storage_map_k;
    
    event Event_bd710f93();
    event OwnershipTransferred(address, address);
    error OwnableUnauthorizedAccount(address);
    event WithdrawalClaimed(address, uint256);
    event Paused(address);
    event FeeCollectorUpdated(address);
    event Upgraded(address);
    event Event_92c2b40e();
    event OwnershipTransferStarted(address, address);
    event Event_df36591d();
    event Unpaused(address);
    event FeeBasisPointsUpdated(uint16);
    
    /// @custom:selector    0x548599cd
    /// @custom:signature   Unresolved_548599cd(bool arg0) public view returns (uint256)
    /// @param              arg0 ["bool", "uint8", "bytes1", "int8"]
    function Unresolved_548599cd(bool arg0) public view returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(bytes1(arg0) - arg0);
        if (((var_a + 0x80) > 0xffffffffffffffff) | ((var_a + 0x80) < var_a)) {
            uint256 var_a = var_a + 0x80;
            if (arg0 == 0x01) {
                require(((var_a + 0x80) > 0xffffffffffffffff) | ((var_a + 0x80) < var_a), CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x01, CustomError_f2aa03b5());
                var_a = var_a + 0x40;
                require(((var_a + 0x80) > 0xffffffffffffffff) | ((var_a + 0x80) < var_a), CustomError_f2aa03b5());
                require(((var_a + 0x40) > 0xffffffffffffffff) | ((var_a + 0x40) < var_a), CustomError_f2aa03b5());
                return var_o;
                require(!(var_o < 0x03), CustomError_f2aa03b5());
                require(!(var_o < 0x03), CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x02, CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x03, CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x04, CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x05, CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x06, CustomError_f2aa03b5());
                require(!(bytes1(arg0) < 0xf0), CustomError_f2aa03b5());
                require(!(block.chainid == 0x7a69), CustomError_f2aa03b5());
                require(!(block.chainid == 0x7a69), CustomError_f2aa03b5());
                require(!(bytes1(arg0) < 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000), CustomError_f2aa03b5());
                require(!((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) < 0x04ee2d6d415b85acef8100000000), CustomError_f2aa03b5());
                require(!(((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) < 0x2386f26fc10000), CustomError_f2aa03b5());
                require(!((((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) < 0x05f5e100), CustomError_f2aa03b5());
                require(!(((((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) / 0x05f5e100) < 0x2710), CustomError_f2aa03b5());
                require(!((((((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) / 0x05f5e100) / 0x2710) < 0x64), CustomError_f2aa03b5());
                require(!(((((((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) / 0x05f5e100) / 0x2710) / 0x64) < 0x0a), CustomError_f2aa03b5());
                var_a = var_a + 0xa0;
                require(0x80 > 0xffffffffffffffff, CustomError_f2aa03b5());
                require(((var_a + 0xa0) > 0xffffffffffffffff) | ((var_a + 0xa0) < var_a), CustomError_f2aa03b5());
            }
            require(0x80 > 0xffffffffffffffff, CustomError_f2aa03b5());
        }
    }
    
    /// @custom:selector    0xab73418a
    /// @custom:signature   Unresolved_ab73418a(address arg0) public view
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_ab73418a(address arg0) public view {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        var_a = var_a;
        require(transient[var_a], CustomError_3ee5aeb5());
        var_a = var_a;
        transient[var_a] = 0x01;
        require(bytes1(store_a), CustomError_d93c0665());
        var_a = var_a;
        require(!storage_map_b[var_a], CustomError_f7b3b391());
        var_a = var_a;
        require(!(arg0 >> 0x60), CustomError_f7b3b391());
        var_a = 0x01dc27bb5462fdadcb;
        require(storage_map_c[var_a] >> 0x80, CustomError_f7b3b391());
        require(!(storage_map_d[keccak256(var_a) << 0x20] >> 0x60), CustomError_f7b3b391());
        require((storage_map_d[keccak256(var_a) << 0x20] >> 0x60) == (arg0 >> 0x60), CustomError_f7b3b391());
        require(!(storage_map_c[var_a] >> 0x80), CustomError_f7b3b391());
        require(((var_d + 0x0140) > 0xffffffffffffffff) | ((var_d + 0x0140) < var_d), CustomError_f7b3b391());
    }
    
    /// @custom:selector    0x4f1ef286
    /// @custom:signature   Unresolved_4f1ef286(address arg0, uint256 arg1) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function Unresolved_4f1ef286(address arg0, uint256 arg1) public payable {
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x40);
        require(address(arg0) - arg0);
        require(arg1 > 0xffffffffffffffff);
        require(!((arg1 + 0x23) < msg.data.length), CustomError_e07c8dba());
        require(arg1 > 0xffffffffffffffff, CustomError_e07c8dba());
        require(((var_c + (uint248((0x20 + (0x1f + (arg1))) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248((0x20 + (0x1f + (arg1))) + 0x1f))) < var_c), CustomError_e07c8dba());
        uint256 var_c = var_c + (uint248((0x20 + (0x1f + (arg1))) + 0x1f));
        uint256 var_d = (arg1);
        require((arg1 + 0x24) + var_d > msg.data.length, CustomError_e07c8dba());
        require(!(0x2ffc67547c57d1b1d6aea74508689c36dcc7bc1a == address(this)), CustomError_e07c8dba());
        require(0x2ffc67547c57d1b1d6aea74508689c36dcc7bc1a == address(this), CustomError_e07c8dba());
        require(msg.sender - (address(store_a)), CustomError_118cdaa7());
        (bool success, bytes memory ret0) = address(arg0).proxiableUUID(); // staticcall
        var_a = var_a;
        require(0 - var_a, CustomError_4c9c8ce3());
        require(!address(arg0).code.length, CustomError_4c9c8ce3());
        store_a = (address(arg0)) | (uint96(store_a));
        emit Upgraded(address(arg0));
        require(!var_c.length, CustomError_d6bda275());
        (bool success, bytes memory ret0) = address(arg0).Unresolved_(var_g); // delegatecall
        require(0 - ret0.length, CustomError_d6bda275());
        if (ret0.length) {
        }
        require(msg.value, CustomError_b398979f());
        if (0x20 > ret0.length) {
        }
        require(!(address(store_a) == 0x2ffc67547c57d1b1d6aea74508689c36dcc7bc1a), CustomError_e07c8dba());
    }
    
    /// @custom:selector    0x6f7e758c
    /// @custom:signature   Unresolved_6f7e758c(uint256 arg0, uint256 arg1, uint256 arg2, bool arg3, uint256 arg4, uint256 arg5, uint64 arg6) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["bool", "uint8", "bytes1", "int8"]
    /// @param              arg4 ["uint256", "bytes32", "int256"]
    /// @param              arg5 ["uint256", "bytes32", "int256"]
    /// @param              arg6 ["uint64", "bytes8", "int64"]
    function Unresolved_6f7e758c(uint256 arg0, uint256 arg1, uint256 arg2, bool arg3, uint256 arg4, uint256 arg5, uint64 arg6) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0xc0);
        require(arg0 > 0xffffffffffffffff);
        require(bytes1(arg3) - arg3);
        var_a = var_a;
        require(transient[var_a], CustomError_3ee5aeb5());
        var_a = var_a;
        transient[var_a] = 0x01;
        require(bytes1(store_a), CustomError_d93c0665());
        var_a = var_a;
        require(!storage_map_b[var_a]);
        require(address(arg0) - (arg0));
        require(!address(0xfafddbb3fc7688494971a79cc65dca3ef82079e7).code.length);
        uint256 var_d = address(arg0);
        (bool success, bytes memory ret0) = address(0xfafddbb3fc7688494971a79cc65dca3ef82079e7).Unresolved_d505accf(var_d); // call
        require((arg0 + 0xc0) - (uint64(arg0 + 0xc0)));
        require(!block.timestamp < (uint64(arg0 + 0xc0)));
        require(address(arg0) - (arg0));
        var_d = address(arg0);
        (bool success, bytes memory ret0) = address(0xfafddbb3fc7688494971a79cc65dca3ef82079e7).Unresolved_dd62ed3e(var_d); // staticcall
        require((arg0 + 0x40) - (address(arg0 + 0x40)));
        require(address(arg0 + 0x40) > 0);
        require(address(arg0) - (arg0));
        require(0x20 > ret0.length);
        require(((var_k + 0x20) > 0xffffffffffffffff) | ((var_k + 0x20) < var_k));
        uint256 var_k = var_k + 0x20;
        require(((var_k + 0x20) - var_k) < 0x20);
        require((arg0 + 0x40) - (address(arg0 + 0x40)));
    }
    
    /// @custom:selector    0x73b13318
    /// @custom:signature   Unresolved_73b13318(address arg0, uint256 arg1, uint256 arg2) public view
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    function Unresolved_73b13318(address arg0, uint256 arg1, uint256 arg2) public view {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x60);
        require(arg0 - (address(arg0)));
        var_a = var_a;
        require(transient[var_a], CustomError_3ee5aeb5());
        var_a = var_a;
        transient[var_a] = 0x01;
        require(bytes1(store_a), CustomError_d93c0665());
        var_a = var_a;
        require(!storage_map_b[var_a], CustomError_13ef42aa());
        require(((var_c + 0x0140) > 0xffffffffffffffff) | ((var_c + 0x0140) < var_c), CustomError_13ef42aa());
        uint256 var_c = var_c + 0x0140;
        var_a = var_a;
        require(!(arg0 >> 0x60), CustomError_13ef42aa());
        var_a = 0x01dc27bb5462fdadcb;
        require(storage_map_c[var_a] >> 0x80, CustomError_13ef42aa());
        require(!(storage_map_d[keccak256(var_a) << 0x20] >> 0x60), CustomError_13ef42aa());
        require((storage_map_d[keccak256(var_a) << 0x20] >> 0x60) == (arg0 >> 0x60), CustomError_13ef42aa());
        require(!((keccak256(var_a) << 0x20) | (storage_map_c[var_a] >> 0x80) * (storage_map_c[var_a] >> 0x80)), CustomError_13ef42aa());
        require(((var_c + 0x0140) > 0xffffffffffffffff) | ((var_c + 0x0140) < var_c), CustomError_13ef42aa());
        var_c = var_c + 0x0140;
        var_a = 0x6b839d425b25d405;
        require(uint64(var_z) + (uint64(uint32(var_aa))) > 0xffffffffffffffff, CustomError_13ef42aa());
        require(block.timestamp < (uint64(var_z + (uint32(var_aa)))), CustomError_13ef42aa());
        require(arg1 > arg2, CustomError_a0f5ba6a());
        if (uint64(var_c.length) > (uint64(var_c.length) + (uint64(var_ab)))) {
            if (!(uint64(var_c.length)) > arg2) {
                require(uint64(var_c.length) > (uint64(var_c.length) + (uint64(var_ab))), CustomError_6ec9be11());
                require(!(uint64(var_c.length) > arg2), CustomError_6ec9be11());
                require(!(!(uint64(var_c.length)) > arg2), CustomError_6ec9be11());
                require(address(var_ac) > (address(var_ac) + (address(var_ad))), CustomError_6ec9be11());
                require(!(!(uint64(var_c.length)) > arg2), CustomError_6ec9be11());
                var_a = var_a;
                require(!(address(var_ad) * (uint16(store_a >> 0xa0)) / (address(var_ad)) == (uint16(store_a >> 0xa0)) | (!address(var_ad))), CustomError_6ec9be11());
                var_a = var_a;
                require(storage_map_b[var_a] - (address(var_ad)) > storage_map_b[var_a], CustomError_6ec9be11());
            }
        }
    }
    
    /// @custom:selector    0xfeddc85c
    /// @custom:signature   Unresolved_feddc85c(uint256 arg0) public view returns (address)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function Unresolved_feddc85c(uint256 arg0) public view returns (address) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(!arg0 < store_a);
        return address(store_j);
    }
    
    /// @custom:selector    0xf50b2efe
    /// @custom:signature   validateTimestamp(uint256 arg0) public view
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function validateTimestamp(uint256 arg0) public view {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20, CustomError_b6b0916d());
        require(0 == (block.timestamp < (arg0 / 0x03e8)), CustomError_b6b0916d());
        require(((arg0 / 0x03e8) - block.timestamp) > (arg0 / 0x03e8), CustomError_b6b0916d());
        require(0x3c < ((arg0 / 0x03e8) - block.timestamp), CustomError_b6b0916d());
        require((block.timestamp - (arg0 / 0x03e8)) > block.timestamp, CustomError_0321d0b5());
        require(0xb4 < (block.timestamp - (arg0 / 0x03e8)), CustomError_0321d0b5());
    }
    
    /// @custom:selector    0x39cf07b7
    /// @custom:signature   claimPendingWithdrawal() public payable
    function claimPendingWithdrawal() public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        var_a = var_a;
        require(transient[var_a], CustomError_3ee5aeb5());
        var_a = var_a;
        transient[var_a] = 0x01;
        address var_a = address(msg.sender);
        require(!storage_map_b[var_a], CustomError_5274afe7());
        var_a = address(msg.sender);
        storage_map_b[var_a] = 0;
        var_a = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
        address var_c = address(msg.sender);
        (bool success, bytes memory ret0) = address(0xfafddbb3fc7688494971a79cc65dca3ef82079e7).many_msg_babbage(var_c); // call
        require(!(success & (var_a == 0x01)), CustomError_5274afe7());
        var_a = 0x5274afe700000000000000000000000000000000000000000000000000000000;
        emit WithdrawalClaimed(msg.sender, storage_map_b[var_a]);
        var_a = var_a;
        transient[var_a] = 0;
        require(bytes1(!success));
        require(!(address(0xfafddbb3fc7688494971a79cc65dca3ef82079e7).code.length & (!ret0.length) & (success)), CustomError_5274afe7());
        emit WithdrawalClaimed(msg.sender, storage_map_b[var_a]);
        var_a = var_a;
        transient[var_a] = 0;
    }
    
    /// @custom:selector    0xc4086893
    /// @custom:signature   getLockedBalance(address arg0) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function getLockedBalance(address arg0) public view returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(address(arg0) - arg0);
        var_a = var_a;
        require(!storage_map_b[var_a] > 0x01);
        require((storage_map_b[var_a] + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) > storage_map_b[var_a]);
        return storage_map_b[var_a] + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
        return 0;
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
    
    /// @custom:selector    0x7ee8b2f8
    /// @custom:signature   getPendingWithdrawal(address arg0) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function getPendingWithdrawal(address arg0) public view returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(address(arg0) - arg0);
        address var_a = address(arg0);
        return storage_map_b[var_a];
    }
    
    /// @custom:selector    0x88dd2204
    /// @custom:signature   Unresolved_88dd2204() public view returns (bytes memory)
    function Unresolved_88dd2204() public view returns (bytes memory) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        if (0 < store_a) {
            if (((var_c + (uint248(((var_c + 0x20) - var_c) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248(((var_c + 0x20) - var_c) + 0x1f))) < var_c)) {
                uint248 var_c = var_c + (uint248(((var_c + 0x20) - var_c) + 0x1f));
                return abi.encodePacked(0x20, var_c.length);
            }
        }
    }
    
    /// @custom:selector    0x3ce142f5
    /// @custom:signature   getAuthorisedSignerIndex(address arg0) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function getAuthorisedSignerIndex(address arg0) public view returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(address(arg0) - arg0);
        require(!(0x03 > transient[0xa4f4f0a88f05a6b1de8dd999c904db7bb75b5587303a63f6ce56735645310fda]), CustomError_ec459bc0());
        require(transient[0xa4f4f0a88f05a6b1de8dd999c904db7bb75b5587303a63f6ce56735645310fda] == 0x02, CustomError_ec459bc0());
        require(!(block.chainid == 0x7a69), CustomError_ec459bc0());
        require(!(block.chainid == 0x7a69), CustomError_ec459bc0());
        require(0xaa100cd7cc79a8e11ae23af11c449aafa496bc8d == (address(arg0)), CustomError_ec459bc0());
        return 0;
        require(!(0x03 > transient[0xa4f4f0a88f05a6b1de8dd999c904db7bb75b5587303a63f6ce56735645310fda]), CustomError_ec459bc0());
        require(transient[0xa4f4f0a88f05a6b1de8dd999c904db7bb75b5587303a63f6ce56735645310fda] == 0x01, CustomError_ec459bc0());
        require(!(block.chainid == 0x7a69), CustomError_ec459bc0());
        require(block.chainid == 0x7a69, CustomError_ec459bc0());
        require(0xd8a2f3665205c08cf4836f468476e34f2b9db599 == (address(arg0)), CustomError_ec459bc0());
        return 0;
        require(address(arg0) == 0x17e2609e18f9ae7667467695dc701ce3865464ef, CustomError_ec459bc0());
        return 0;
        require(address(arg0) == 0x4780bb20c0293b4b5e00c80a350acab467300d2e, CustomError_ec459bc0());
        return 0x01;
        require(address(arg0) == 0x6a4d1b2fc6a894928979f152a8c9245d96860604, CustomError_ec459bc0());
        return 0x02;
        require(address(arg0) == 0x80a7db0c2be819afa7c2755f02c8265f157cbdf6, CustomError_ec459bc0());
        return 0x03;
        require(0xbbd80bef77fd96b1d7d5db0614af5cb7b3d1d71f == (address(arg0)), CustomError_ec459bc0());
        return 0x04;
    }
    
    /// @custom:selector    0xff4ca80e
    /// @custom:signature   Unresolved_ff4ca80e(address arg0) public payable returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_ff4ca80e(address arg0) public payable returns (bool) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(address(arg0) - arg0);
        require(msg.sender - (address(store_a)), CustomError_118cdaa7());
        var_a = var_a;
        require(storage_map_b[var_a]);
        require(0);
        emit Event_df36591d(address(arg0));
        return 0;
        return 0;
        require(!store_a < 0x010000000000000000);
        store_a = store_a + 0x01;
        require(!store_a < store_a);
        var_a = var_a;
        storage_map_k[var_a] = (0 & (storage_map_k[var_a])) | (address(arg0) << 0);
        var_a = var_a;
        storage_map_b[var_a] = store_a;
        require(0x01);
        return 0x01;
        emit Event_df36591d(address(arg0));
        return 0x01;
    }
    
    /// @custom:selector    0xa644f434
    /// @custom:signature   Unresolved_a644f434(bool arg0) public view returns (bytes memory)
    /// @param              arg0 ["bool", "uint8", "bytes1", "int8"]
    function Unresolved_a644f434(bool arg0) public view returns (bytes memory) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(bytes1(arg0) - arg0);
        if (((var_a + 0x80) > 0xffffffffffffffff) | ((var_a + 0x80) < var_a)) {
            uint256 var_a = var_a + 0x80;
            if (arg0 == 0x01) {
                require(((var_a + 0x80) > 0xffffffffffffffff) | ((var_a + 0x80) < var_a), CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x01, CustomError_f2aa03b5());
                var_a = var_a + 0x40;
                require(((var_a + 0x80) > 0xffffffffffffffff) | ((var_a + 0x80) < var_a), CustomError_f2aa03b5());
                return abi.encodePacked(0x20, 0x80, var_t, var_v, var_x, var_q);
                require(((var_a + 0x40) > 0xffffffffffffffff) | ((var_a + 0x40) < var_a), CustomError_f2aa03b5());
                require(!(var_x < 0x03), CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x02, CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x03, CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x04, CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x05, CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x06, CustomError_f2aa03b5());
                require(!(bytes1(arg0) < 0xf0), CustomError_f2aa03b5());
                require(!(block.chainid == 0x7a69), CustomError_f2aa03b5());
                require(!(block.chainid == 0x7a69), CustomError_f2aa03b5());
                require(!(bytes1(arg0) < 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000), CustomError_f2aa03b5());
                require(!((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) < 0x04ee2d6d415b85acef8100000000), CustomError_f2aa03b5());
                require(!(((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) < 0x2386f26fc10000), CustomError_f2aa03b5());
                require(!((((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) < 0x05f5e100), CustomError_f2aa03b5());
                require(!(((((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) / 0x05f5e100) < 0x2710), CustomError_f2aa03b5());
                require(!((((((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) / 0x05f5e100) / 0x2710) < 0x64), CustomError_f2aa03b5());
                require(!(((((((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) / 0x05f5e100) / 0x2710) / 0x64) < 0x0a), CustomError_f2aa03b5());
                var_a = var_a + 0xa0;
                require(0x80 > 0xffffffffffffffff, CustomError_f2aa03b5());
                require(((var_a + 0xa0) > 0xffffffffffffffff) | ((var_a + 0xa0) < var_a), CustomError_f2aa03b5());
            }
            require(0x80 > 0xffffffffffffffff, CustomError_f2aa03b5());
        }
    }
    
    /// @custom:selector    0x6002095b
    /// @custom:signature   Unresolved_6002095b(address arg0) public view returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_6002095b(address arg0) public view returns (bool) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(address(arg0) - arg0);
        var_a = var_a;
        return storage_map_b[var_a];
    }
    
    /// @custom:selector    0xc8e5f200
    /// @custom:signature   Unresolved_c8e5f200(address arg0) public view returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_c8e5f200(address arg0) public view returns (bytes memory) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        require(((var_a + 0x0140) > 0xffffffffffffffff) | ((var_a + 0x0140) < var_a), CustomError_6ec9be11());
        uint256 var_a = var_a + 0x0140;
        require(((var_a + 0x0140) > 0xffffffffffffffff) | ((var_a + 0x0140) < var_a), CustomError_6ec9be11());
        var_a = var_a + 0x0140;
        var_b = var_b;
        require(!(arg0 >> 0x60), CustomError_6ec9be11());
        var_b = 0x01dc27bb5462fdadcb;
        require(storage_map_l[var_b] >> 0x80, CustomError_6ec9be11());
        require(!(storage_map_m[keccak256(var_b) << 0x20] >> 0x60), CustomError_6ec9be11());
        require((storage_map_m[keccak256(var_b) << 0x20] >> 0x60) == (arg0 >> 0x60), CustomError_6ec9be11());
        require(!((keccak256(var_b) << 0x20) | (storage_map_l[var_b] >> 0x80) * (storage_map_l[var_b] >> 0x80)), CustomError_6ec9be11());
        require(((var_a + 0x0140) > 0xffffffffffffffff) | ((var_a + 0x0140) < var_a), CustomError_6ec9be11());
        var_a = var_a + 0x0140;
        var_b = 0x6b839d425b25d405;
        return abi.encodePacked(uint64(var_a.length), uint64(var_bc), uint64(var_bd), uint32(var_be), bytes1(var_bf), bytes1(var_bg), address(var_bh), address(var_bi), address(var_bj), address(var_bk));
    }
    
    /// @custom:selector    0x84b0196e
    /// @custom:signature   eip712Domain() public view returns (uint256)
    function eip712Domain() public view returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        require(!store_s, "EIP712: Uninitialized");
        require(store_s, "EIP712: Uninitialized");
        if (((var_e + 0x40) > 0xffffffffffffffff) | ((var_e + 0x40) < var_e)) {
            uint256 var_e = var_e + 0x40;
            if (((var_e + 0x40) > 0xffffffffffffffff) | ((var_e + 0x40) < var_e)) {
                var_e = var_e + 0x40;
                if (((var_e + 0x20) > 0xffffffffffffffff) | ((var_e + 0x20) < var_e)) {
                    var_e = var_e + 0x20;
                    return abi.encodePacked(0x0f00000000000000000000000000000000000000000000000000000000000000, 0xe0, (uint248(0x1f + var_e.length) + (var_e + 0xe0) + 0x20) - var_e, block.chainid, address(this), 0, (uint248(0x1f + var_e.length) + (uint248(0x1f + var_e.length) + (var_e + 0xe0) + 0x20) + 0x20) - var_e, var_e.length, var_e.length, var_e.length);
                }
            }
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
    
    /// @custom:selector    0x93ca625d
    /// @custom:signature   Unresolved_93ca625d(uint256 arg0, address arg1, uint64 arg2) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["address", "uint128", "bytes16", "int128"]
    /// @param              arg6 ["uint64", "bytes8", "int64"]
    function Unresolved_93ca625d(uint256 arg0, address arg1, uint64 arg2) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 > 0xffffffffffffffff);
        var_a = var_a;
        require(transient[var_a]);
        var_a = var_a;
        transient[var_a] = 0x01;
        require(bytes1(store_a));
        var_a = var_a;
        require(!storage_map_b[var_a]);
        require((arg0 + 0xc0) - (uint64(arg0 + 0xc0)));
        require(!block.timestamp < (uint64(arg0 + 0xc0)));
        require(address(arg0) - (arg0));
        uint256 var_d = address(arg0);
        (bool success, bytes memory ret0) = address(0xfafddbb3fc7688494971a79cc65dca3ef82079e7).Unresolved_dd62ed3e(var_d); // staticcall
        require((arg0 + 0x40) - (address(arg0 + 0x40)));
        require(address(arg0 + 0x40) > 0);
        require(address(arg0) - (arg0));
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        require((arg0 + 0x40) - (address(arg0 + 0x40)));
    }
    
    /// @custom:selector    0x21d5c9bb
    /// @custom:signature   Unresolved_21d5c9bb(address arg0, uint256 arg1, uint256 arg2) public view
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    function Unresolved_21d5c9bb(address arg0, uint256 arg1, uint256 arg2) public view {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x60);
        require(arg0 - (address(arg0)));
        var_a = var_a;
        require(transient[var_a], CustomError_d93c0665());
        var_a = var_a;
        transient[var_a] = 0x01;
        require(bytes1(store_a), CustomError_d93c0665());
        require(((var_b + 0x0140) > 0xffffffffffffffff) | ((var_b + 0x0140) < var_b), CustomError_47e8e6df());
        uint256 var_b = var_b + 0x0140;
        var_a = var_a;
        require(!(arg0 >> 0x60), CustomError_47e8e6df());
        var_a = 0x01dc27bb5462fdadcb;
        require(storage_map_c[var_a] >> 0x80, CustomError_47e8e6df());
        require(!(storage_map_d[keccak256(var_a) << 0x20] >> 0x60), CustomError_47e8e6df());
        require((storage_map_d[keccak256(var_a) << 0x20] >> 0x60) == (arg0 >> 0x60), CustomError_47e8e6df());
        require(!((keccak256(var_a) << 0x20) | (storage_map_c[var_a] >> 0x80) * (storage_map_c[var_a] >> 0x80)), CustomError_47e8e6df());
        require(((var_b + 0x0140) > 0xffffffffffffffff) | ((var_b + 0x0140) < var_b), CustomError_47e8e6df());
        var_b = var_b + 0x0140;
        var_a = 0x6b839d425b25d405;
        require(((var_b + 0x80) > 0xffffffffffffffff) | ((var_b + 0x80) < var_b), CustomError_47e8e6df());
        var_b = var_b + 0x80;
        require(bytes1(var_ad) == 0x01, CustomError_47e8e6df());
        require(((var_b + 0x80) > 0xffffffffffffffff) | ((var_b + 0x80) < var_b), CustomError_47e8e6df());
        var_b = var_b + 0x80;
        require(((var_b + 0x40) > 0xffffffffffffffff) | ((var_b + 0x40) < var_b), CustomError_47e8e6df());
        var_b = var_b + 0x40;
        require(arg1 - (var_ak), CustomError_47e8e6df());
        require(arg2 - (var_al), CustomError_47e8e6df());
        require(((var_b + 0x60) > 0xffffffffffffffff) | ((var_b + 0x60) < var_b), CustomError_47e8e6df());
        var_b = var_b + 0x60;
        var_ak = msg.data[4:68];
        require(!var_b.length, CustomError_47e8e6df());
        require(!(0x03 > (var_ap)), CustomError_47e8e6df());
        require(!(0x03 > (var_ap)), CustomError_47e8e6df());
        require(!(!var_ap), CustomError_47e8e6df());
        require(!(0x03 > (var_ap)), CustomError_47e8e6df());
        transient[0xa4f4f0a88f05a6b1de8dd999c904db7bb75b5587303a63f6ce56735645310fda] = var_ap;
        require(var_b.length > 0xffffffffffffffff, CustomError_47e8e6df());
        if (var_ad == 0x02) {
            if (var_ad == 0x03) {
                require(bytes1(var_ad) == 0x02, CustomError_f2aa03b5());
                require(bytes1(var_ad) == 0x03, CustomError_f2aa03b5());
                require(bytes1(var_ad) == 0x04, CustomError_f2aa03b5());
                require(bytes1(var_ad) == 0x05, CustomError_f2aa03b5());
                require(bytes1(var_ad) == 0x06, CustomError_f2aa03b5());
                require(!(bytes1(var_ad) < 0xf0), CustomError_f2aa03b5());
                require(!(block.chainid == 0x7a69), CustomError_f2aa03b5());
                require(!(block.chainid == 0x7a69), CustomError_f2aa03b5());
                require(!(bytes1(var_ad) < 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000), CustomError_f2aa03b5());
                require(!((bytes1(var_ad) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) < 0x04ee2d6d415b85acef8100000000), CustomError_f2aa03b5());
                require(!(((bytes1(var_ad) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) < 0x2386f26fc10000), CustomError_f2aa03b5());
                require(!((((bytes1(var_ad) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) < 0x05f5e100), CustomError_f2aa03b5());
                require(!(((((bytes1(var_ad) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) / 0x05f5e100) < 0x2710), CustomError_f2aa03b5());
                require(!((((((bytes1(var_ad) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) / 0x05f5e100) / 0x2710) < 0x64), CustomError_f2aa03b5());
                require(!(((((((bytes1(var_ad) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) / 0x05f5e100) / 0x2710) / 0x64) < 0x0a), CustomError_f2aa03b5());
                var_b = var_b + 0xa0;
                require(0x80 > 0xffffffffffffffff, CustomError_f2aa03b5());
                require(((var_b + 0xa0) > 0xffffffffffffffff) | ((var_b + 0xa0) < var_b), CustomError_f2aa03b5());
            }
            require(0x80 > 0xffffffffffffffff, CustomError_f2aa03b5());
        }
    }
    
    /// @custom:selector    0xf2fde38b
    /// @custom:signature   transferOwnership(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function transferOwnership(address arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(address(arg0) - arg0);
        require(msg.sender - (address(store_a)), CustomError_118cdaa7());
        store_a = (address(arg0)) | (uint96(store_a));
        emit OwnershipTransferStarted(address(store_a), address(arg0));
    }
    
    /// @custom:selector    0x594936c3
    /// @custom:signature   Unresolved_594936c3(address arg0) public view returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_594936c3(address arg0) public view returns (bool) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(address(arg0) - arg0);
        require(msg.sender - (address(store_a)), CustomError_118cdaa7());
        var_a = var_a;
        require(!storage_map_b[var_a]);
        require((storage_map_b[var_a] + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) > storage_map_b[var_a]);
        var_a = var_a;
        require((store_a + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) > store_a);
        require((storage_map_b[var_a] + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (store_a + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff));
        require(!(store_a + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < store_a);
        require(!store_a);
        require(0);
        emit Event_92c2b40e(address(arg0));
        return 0;
        return 0;
    }
    
    /// @custom:selector    0xe30c3978
    /// @custom:signature   pendingOwner() public view returns (address)
    function pendingOwner() public view returns (address) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return address(store_a);
    }
    
    /// @custom:selector    0x92108c86
    /// @custom:signature   isTestnet() public view returns (bool)
    function isTestnet() public view returns (bool) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        if (!block.chainid == 0x7a69) {
            return !(!block.chainid == 0x7a69);
            return !(!block.chainid == 0x18c7);
        }
    }
    
    /// @custom:selector    0x8da5cb5b
    /// @custom:signature   owner() public view returns (address)
    function owner() public view returns (address) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return address(store_a);
    }
    
    /// @custom:selector    0x0731c3cd
    /// @custom:signature   rescuePendingWithdrawal(address arg0, address arg1) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    function rescuePendingWithdrawal(address arg0, address arg1) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x40);
        require(address(arg0) - arg0);
        require(address(arg1) - arg1);
        require(msg.sender - (address(store_a)), CustomError_118cdaa7());
        var_a = var_a;
        require(transient[var_a], CustomError_5274afe7());
        var_a = var_a;
        transient[var_a] = 0x01;
        require(!(address(arg1)), CustomError_5274afe7());
        address var_a = address(arg0);
        require(!storage_map_b[var_a], CustomError_5274afe7());
        var_a = address(arg0);
        storage_map_b[var_a] = 0;
        var_a = 0xa9059cbb00000000000000000000000000000000000000000000000000000000;
        var_b = address(arg1);
        (bool success, bytes memory ret0) = address(0xfafddbb3fc7688494971a79cc65dca3ef82079e7).many_msg_babbage(var_b); // call
        require(!(success & (var_a == 0x01)), CustomError_5274afe7());
        var_a = 0x5274afe700000000000000000000000000000000000000000000000000000000;
        emit Event_bd710f93(address(arg0), address(arg1), storage_map_b[var_a]);
        var_a = var_a;
        transient[var_a] = 0;
        require(bytes1(!success));
        require(!(address(0xfafddbb3fc7688494971a79cc65dca3ef82079e7).code.length & (!ret0.length) & (success)), CustomError_5274afe7());
        emit Event_bd710f93(address(arg0), address(arg1), storage_map_b[var_a]);
        var_a = var_a;
        transient[var_a] = 0;
    }
    
    /// @custom:selector    0xa42dce80
    /// @custom:signature   setFeeCollector(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function setFeeCollector(address arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(address(arg0) - arg0);
        require(msg.sender - (address(store_a)), CustomError_118cdaa7());
        store_a = (address(arg0)) | (uint96(store_a));
        emit FeeCollectorUpdated(address(arg0));
    }
    
    /// @custom:selector    0x5c975abb
    /// @custom:signature   paused() public view returns (bool)
    function paused() public view returns (bool) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return !(!bytes1(store_a));
    }
    
    /// @custom:selector    0x8a71c6a0
    /// @custom:signature   Unresolved_8a71c6a0(bool arg0) public pure returns (bool)
    /// @param              arg0 ["bool", "uint8", "bytes1", "int8"]
    function Unresolved_8a71c6a0(bool arg0) public pure returns (bool) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(bytes1(arg0) - arg0);
        return !(bytes1(arg0) < 0xf0);
    }
    
    /// @custom:selector    0x96d18078
    /// @custom:signature   Unresolved_96d18078(address arg0) public view returns (address)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_96d18078(address arg0) public view returns (address) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (address(arg0)));
        var_a = var_a;
        require(!(arg0 >> 0x60), CustomError_6ec9be11());
        var_a = 0x01dc27bb5462fdadcb;
        require(storage_map_c[var_a] >> 0x80, CustomError_6ec9be11());
        require(!(storage_map_d[keccak256(var_a) << 0x20] >> 0x60), CustomError_6ec9be11());
        require((storage_map_d[keccak256(var_a) << 0x20] >> 0x60) == (arg0 >> 0x60), CustomError_6ec9be11());
        require(!(storage_map_c[var_a] >> 0x80), CustomError_6ec9be11());
        require(((var_d + 0x0140) > 0xffffffffffffffff) | ((var_d + 0x0140) < var_d), CustomError_6ec9be11());
        uint256 var_d = var_d + 0x0140;
        var_a = var_a;
        require(!(arg0 >> 0x60), CustomError_6ec9be11());
        var_a = 0x01dc27bb5462fdadcb;
        require(storage_map_c[var_a] >> 0x80, CustomError_6ec9be11());
        require(!(storage_map_d[keccak256(var_a) << 0x20] >> 0x60), CustomError_6ec9be11());
        require((storage_map_d[keccak256(var_a) << 0x20] >> 0x60) == (arg0 >> 0x60), CustomError_6ec9be11());
        require(!((keccak256(var_a) << 0x20) | (storage_map_c[var_a] >> 0x80) * (storage_map_c[var_a] >> 0x80)), CustomError_6ec9be11());
        require(((var_d + 0x0140) > 0xffffffffffffffff) | ((var_d + 0x0140) < var_d), CustomError_6ec9be11());
        var_a = 0x6b839d425b25d405;
        return address(var_aa);
    }
    
    /// @custom:selector    0xb24ebfcc
    /// @custom:signature   aggregateValues(uint256[] arg0) public pure returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function aggregateValues(uint256[] arg0) public pure returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 > 0xffffffffffffffff);
        if (!(arg0 + 0x23) < msg.data.length) {
            require(!((arg0 + 0x23) < msg.data.length), CustomError_9e198af9());
            require(arg0 > 0xffffffffffffffff, CustomError_9e198af9());
            uint256 var_c = var_c + (uint248((0x20 + (arg0 << 0x05)) + 0x1f));
            require(((var_c + (uint248((0x20 + (arg0 << 0x05)) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248((0x20 + (arg0 << 0x05)) + 0x1f))) < var_c), CustomError_9e198af9());
            require(((arg0 + (arg0 << 0x05)) + 0x24) > msg.data.length, CustomError_9e198af9());
            require((0x24 + arg0) < ((arg0 + (arg0 << 0x05)) + 0x24), CustomError_9e198af9());
            require(var_c.length == 0x02, CustomError_9e198af9());
            require(!var_c.length, CustomError_9e198af9());
            return (var_f + (var_g)) >> 0x01;
            require(var_f > (var_f + (var_g)), CustomError_9e198af9());
            require(!var_c.length, CustomError_9e198af9());
            require((var_c + 0x20) < (0x20 + (var_c + (var_c.length << 0x05))), CustomError_9e198af9());
            require((var_c + 0x20) < (var_c + 0x20), CustomError_9e198af9());
        }
        require(bytes1(var_c.length), CustomError_9e198af9());
        require(!((var_c.length >> 0x01) < var_c.length), CustomError_9e198af9());
        return var_h;
        require(((var_c.length >> 0x01) + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) > (var_c.length >> 0x01), CustomError_9e198af9());
        require(!(((var_c.length >> 0x01) + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < var_c.length), CustomError_9e198af9());
    }
    
    /// @custom:selector    0xb8606eef
    /// @custom:signature   feeBasisPoints() public view returns (uint16)
    function feeBasisPoints() public view returns (uint16) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return uint16(store_a >> 0xa0);
    }
    
    /// @custom:selector    0xc415b95c
    /// @custom:signature   feeCollector() public view returns (address)
    function feeCollector() public view returns (address) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return address(store_a);
    }
    
    /// @custom:selector    0x8c05a694
    /// @custom:signature   setFeeBasisPoints(uint16 arg0) public payable
    /// @param              arg0 ["uint16", "bytes2", "int16"]
    function setFeeBasisPoints(uint16 arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(arg0 - (uint16(arg0)));
        require(msg.sender - (address(store_a)), CustomError_118cdaa7());
        require(uint16(arg0) > 0x03e8, CustomError_58d620b3());
        store_a = (uint16(arg0 << 0xa0)) | (uint240(store_a));
        emit FeeBasisPointsUpdated(uint16(arg0));
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
    
    /// @custom:selector    0xc4d66de8
    /// @custom:signature   initialize(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function initialize(address arg0) public payable {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(address(arg0) - arg0);
        require(!(uint64(store_a)), CustomError_1e4fbdf7());
        require(0x01 == (uint64(store_a)), CustomError_1e4fbdf7());
        require(!(!uint64(store_a)), CustomError_1e4fbdf7());
        require(address(this).code.length, CustomError_1e4fbdf7());
        store_a = (uint192(store_a)) | 0x01;
        require(!(bytes1(store_a >> 0x40)), CustomError_1e4fbdf7());
        require(!(bytes1(store_a >> 0x40)), CustomError_1e4fbdf7());
        require(!(bytes1(store_a >> 0x40)), CustomError_1e4fbdf7());
        require(!(address(arg0)), CustomError_1e4fbdf7());
        store_a = (uint248(store_a)) | 0x010000000000000000;
        require(!(bytes1(store_a >> 0x40)), CustomError_d7e6bcf8());
        require(!(bytes1(store_a >> 0x40)), CustomError_d7e6bcf8());
        require(!(!uint64(store_a)), CustomError_f92ee8a9());
    }
    
    /// @custom:selector    0x07c107a7
    /// @custom:signature   Unresolved_07c107a7() public view returns (uint256)
    function Unresolved_07c107a7() public view returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        return store_a;
    }
    
    /// @custom:selector    0x55a547d5
    /// @custom:signature   Unresolved_55a547d5(uint0 arg0) public pure returns (uint256)
    /// @param              arg18446744073709551615 ["uint0", "bytes0", "int0"]
    function Unresolved_55a547d5(uint0 arg0) public pure returns (uint256) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        require(0x02ed57011e0000 - (uint40(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0])), CustomError_d9d1f465());
        require(0x29 > msg.data.length, CustomError_d9d1f465());
        require(uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) > (uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03), CustomError_d9d1f465());
        require((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) > ((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09), CustomError_d9d1f465());
        require(((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) > (((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02), CustomError_d9d1f465());
        require((((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02) > msg.data.length, CustomError_d9d1f465());
        require(((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) > (((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x20), CustomError_d9d1f465());
        require(msg.data.length < (((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x20), CustomError_d9d1f465());
        require(((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) > (((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02), CustomError_d9d1f465());
        require(!(uint16(msg.data[0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 + (msg.data.length - ((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09))])), CustomError_d9d1f465());
        require(0 < (uint16(msg.data[0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0 + (msg.data.length - ((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09))])), CustomError_d9d1f465());
        require((((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02) > ((((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02) + 0x41), CustomError_d9d1f465());
        require(((((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02) + 0x61) < ((((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02) + 0x41), CustomError_d9d1f465());
        require(((msg.data.length - (((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02)) + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9f) > msg.data.length, CustomError_d9d1f465());
        require((0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9c + (msg.data.length - (((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02))) > ((msg.data.length - (((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02)) + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9f), CustomError_d9d1f465());
        require(0x20 > (0x20 + (uint32(msg.data[0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9c + (msg.data.length - (((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02))]))), CustomError_d9d1f465());
        require(!(uint24(msg.data[(msg.data.length - (((msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7] + 0x03) + 0x09) + 0x02)) + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9f]) * (0x20 + (uint32(msg.data[0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9c + (msg.data.length - (((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02))]))) / (uint24(msg.data[(msg.data.length - (((msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7] + 0x03) + 0x09) + 0x02)) + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9f])) == (0x20 + (uint32(msg.data[0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9c + (msg.data.length - (((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02))]))) | (!uint24(msg.data[(msg.data.length - (((msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7] + 0x03) + 0x09) + 0x02)) + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9f]))), CustomError_d9d1f465());
        require(uint24(msg.data[(msg.data.length - (((msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7] + 0x03) + 0x09) + 0x02)) + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9f]) * (0x20 + (uint32(msg.data[0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9c + (msg.data.length - (((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02))]))) > (uint24(msg.data[(msg.data.length - (((msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7] + 0x03) + 0x09) + 0x02)) + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9f]) * (0x20 + (uint32(msg.data[0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9c + (msg.data.length - (((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02))]))) + 0x4e), CustomError_d9d1f465());
        require((((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02) > ((((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02) + 0x68), CustomError_d9d1f465());
        require((msg.data.length - ((((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02) + 0x68)) > msg.data.length, CustomError_d9d1f465());
        require(!(uint48(msg.data[msg.data.length - ((((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02) + 0x68)])), CustomError_d9d1f465());
        require(0, CustomError_d9d1f465());
        require(uint48(msg.data[msg.data.length - ((((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02) + 0x68)]) - 0, CustomError_d9d1f465());
        require((((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02) > ((((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02) + (uint24(msg.data[(msg.data.length - (((msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7] + 0x03) + 0x09) + 0x02)) + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9f]) * (0x20 + (uint32(msg.data[0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9c + (msg.data.length - (((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02))]))) + 0x4e)), CustomError_336dc9d0());
        require((((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02) > ((((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02) + (uint24(msg.data[(msg.data.length - (((msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7] + 0x03) + 0x09) + 0x02)) + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9f]) * (0x20 + (uint32(msg.data[0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff9c + (msg.data.length - (((uint24(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd7]) + 0x03) + 0x09) + 0x02))]))) + 0x4e)), CustomError_336dc9d0());
        return 0;
    }
    
    /// @custom:selector    0x3644e515
    /// @custom:signature   fopwCDKKK() public view
    function fopwCDKKK() public view {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0);
        if (((var_a + 0x40) > 0xffffffffffffffff) | ((var_a + 0x40) < var_a)) {
            uint256 var_a = var_a + 0x40;
            if (!var_a.length) {
                if (!store_s) {
                    if (((var_a + 0x40) > 0xffffffffffffffff) | ((var_a + 0x40) < var_a)) {
                        var_a = var_a + 0x40;
                        if (!var_a.length) {
                            if (!store_t) {
                            }
                            if (((var_a + 0x40) > 0xffffffffffffffff) | ((var_a + 0x40) < var_a)) {
                                var_a = var_a + 0x40;
                                if (!var_a.length) {
                                    if (!store_t) {
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    /// @custom:selector    0x1052bd65
    /// @custom:signature   Unresolved_1052bd65(bool arg0) public view returns (bytes memory)
    /// @param              arg0 ["bool", "uint8", "bytes1", "int8"]
    function Unresolved_1052bd65(bool arg0) public view returns (bytes memory) {
        require(msg.value);
        require((0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc + msg.data.length) < 0x20);
        require(bytes1(arg0) - arg0);
        if (((var_a + 0x80) > 0xffffffffffffffff) | ((var_a + 0x80) < var_a)) {
            uint256 var_a = var_a + 0x80;
            if (arg0 == 0x01) {
                require(((var_a + 0x80) > 0xffffffffffffffff) | ((var_a + 0x80) < var_a), CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x01, CustomError_f2aa03b5());
                var_a = var_a + 0x40;
                return abi.encodePacked(var_o, var_q);
                require(((var_a + 0x80) > 0xffffffffffffffff) | ((var_a + 0x80) < var_a), CustomError_f2aa03b5());
                require(((var_a + 0x40) > 0xffffffffffffffff) | ((var_a + 0x40) < var_a), CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x02, CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x03, CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x04, CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x05, CustomError_f2aa03b5());
                require(bytes1(arg0) == 0x06, CustomError_f2aa03b5());
                require(!(bytes1(arg0) < 0xf0), CustomError_f2aa03b5());
                require(!(block.chainid == 0x7a69), CustomError_f2aa03b5());
                require(!(block.chainid == 0x7a69), CustomError_f2aa03b5());
                require(!(bytes1(arg0) < 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000), CustomError_f2aa03b5());
                require(!((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) < 0x04ee2d6d415b85acef8100000000), CustomError_f2aa03b5());
                require(!(((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) < 0x2386f26fc10000), CustomError_f2aa03b5());
                require(!((((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) < 0x05f5e100), CustomError_f2aa03b5());
                require(!(((((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) / 0x05f5e100) < 0x2710), CustomError_f2aa03b5());
                require(!((((((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) / 0x05f5e100) / 0x2710) < 0x64), CustomError_f2aa03b5());
                require(!(((((((bytes1(arg0) / 0x184f03e93ff9f4daa797ed6e38ed64bf6a1f010000000000000000) / 0x04ee2d6d415b85acef8100000000) / 0x2386f26fc10000) / 0x05f5e100) / 0x2710) / 0x64) < 0x0a), CustomError_f2aa03b5());
                var_a = var_a + 0xa0;
                require(0x80 > 0xffffffffffffffff, CustomError_f2aa03b5());
                require(((var_a + 0xa0) > 0xffffffffffffffff) | ((var_a + 0xa0) < var_a), CustomError_f2aa03b5());
            }
            require(0x80 > 0xffffffffffffffff, CustomError_f2aa03b5());
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
}
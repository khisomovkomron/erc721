## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```


### FORGE COVERAGE
Analysing contracts...
Running tests...
| File                        | % Lines        | % Statements   | % Branches     | % Funcs       |
|-----------------------------|----------------|----------------|----------------|---------------|
| script/deploy_nftoken.s.sol | 100.00% (4/4)  | 100.00% (5/5)  | 100.00% (0/0)  | 100.00% (1/1) |
| src/nftoken.sol             | 76.32% (29/38) | 78.43% (40/51) | 75.00% (15/20) | 66.67% (8/12) |
| Total                       | 78.57% (33/42) | 80.36% (45/56) | 75.00% (15/20) | 69.23% (9/13) |

### TODO FUNCTIONS 


    // TODO
    // approve 
    // getApproved
    // setApprovalForAll
    // isApprovedForAll
    // safeTransferFrom

### TODO TESTS


    // tests TODO
    
    function testApprove() public {}

    function testgetApproved() public {}

    function testsetApprovalForAll() public {}

    function testisApprovedForAll() public {}

    function testsafeTransferFrom() public {}
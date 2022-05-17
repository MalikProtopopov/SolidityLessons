//SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0;

contract Demo {

    mapping (address => uint) public payments; //storage и позволяет хранить данные в формате ключ - значение

    string public myStr = "test"; //storage
    address public myAddr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; //

    function receiveFunds() public payable {
        payments[msg.sender] = msg.value; //msg - глобальная функция которая хранит значение о том кто отпавил - sender и сколько отправили value
    }
    function transferTo(address targetAddr, uint amount) public {
        address payable _to = payable(targetAddr);
        _to.transfer(amount);
    
    }

    function getBalance(address targetAddr) public view returns(uint){
        return targetAddr.balance; 
    }

    function demo(string memory newValueStr) public {
        string memory myTempStr = "temp";
        myStr = newValueStr;

    }
}

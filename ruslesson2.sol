// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MopedShop {
    mapping (address => bool) buyers;   //хранилище ключ значение, хранит список покупателей
    uint256 public price = 2 ether;
    address public owner;
    address public shopAddress;
    bool fullyPaid;
 
    event ItemFullyPaid(uint _price,  address _shopAddress);

    constructor() {
        owner = msg.sender;
        shopAddress = address(this); //указывает на тот смарконтракт который был развернут
    }
    function getBuyer(address _addr) public view returns(bool){
        require(owner == msg.sender, "You are not an owner");
    }
    function addBuyer(address _addr) public {
        require(owner == msg.sender, "You are not an owner"); //но чтобы не каждый кто вызывает данную фнкцию мог проверить а только владелец
        
        buyers[_addr] = true; 

        //хочет положить под значение переменное адр, значение тру, что данный адресс мой покупатель
    }

    function getBalance() public view returns(uint) { //функцию видят все, она только читает, но не изменяет, и вовзращает целое число без знака
        return shopAddress.balance;
}
   
    function withDrawAll() public {
        require(owner == msg.sender && !fullyPaid && shopAddress.balance > 0, "Rejected");
        address payable receiver = payable(msg.sender); // берем отправителя мсг сендера и конвертируем его в адрес на который можно переичслять денежные средства.

        receiver.transfer(shopAddress.balance);
    }

    receive() external payable { 
        require(buyers[msg.sender] && msg.value <= price && !fullyPaid , "Rejected"); // что сумма перевода не больше указанной цены.
    
        if(shopAddress.balance == price) {
            fullyPaid = true;// создаем переменную и даем значение что оплата прошла

            emit ItemFullyPaid( price, shopAddress); //порождает событие 
 
    }

} 


}


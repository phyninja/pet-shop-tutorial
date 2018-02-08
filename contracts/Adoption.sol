pragma solidity ^0.4.0;

contract Adoption{

	address[16] public adopters;
	

	//attaches supplied petId with the address of caller
	function adopt(uint petId) public returns(uint){
		require(petId >= 0 && petId <= 15);
		adopters[petId] = msg.sender;
		return petId;
	}
	
	//Retrieves adopters array
	function getAdopters() public view returns (address[16]){
		return adopters;
	}



}

pragma solidity ^0.4.17;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
	Adoption adoption = Adoption(DeployedAddresses.Adoption());

	//Testing the adopt() function
	function testUserCanAdoptPet() public {
		uint returnedId = adoption.adopt(8);
		uint expected = 8;
		Assert.equal(returnedId, expected, "Adoption of pet ID 8 should be recorded.");
	}

	function testGetAdopterAddressByPetId() public {
		address petOwnerAddress = adoption.adopters(8);
		address expected = this;
		Assert.equal(petOwnerAddress, expected, "Owner of petID should be recorded.");
	}

	function testGetAdopterAddressByPetIdInArray() public {
		address[16] memory testAdopters = adoption.getAdopters();
		address expected = this;
		Assert.equal(testAdopters[8], expected, "Onwer of petID should be recorded. Something wrong in retrieving entire array.");
	}
}

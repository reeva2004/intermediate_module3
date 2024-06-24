// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract BollywoodIndustry {
    struct Person {
        string name;
        string role; // Actor, Director, Producer
        bool isActive;
    }

    mapping(uint => Person) private persons; // Mapping of person IDs to Person structs
    uint public personCount; // Counter for person IDs
    address public owner; // Owner of the contract (admin)

    // Set the deployer of the contract as the owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict actions to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Function to add a new person
    function addPerson(string memory _name, string memory _role) public onlyOwner {
        require(bytes(_name).length > 0, "Person name must not be empty");
        require(bytes(_role).length > 0, "Role must not be empty");
        personCount++;
        persons[personCount] = Person(_name, _role, true);
    }

    // Function to get person details
    function getPerson(uint _id) public view returns (string memory, string memory, bool) {
        require(_id > 0 && _id <= personCount, "Person ID does not exist");
        Person memory person = persons[_id];
        return (person.name, person.role, person.isActive);
    }

    // Function to update person role
    function updateRole(uint _id, string memory _newRole) public onlyOwner {
        require(_id > 0 && _id <= personCount, "Person ID does not exist");
        require(bytes(_newRole).length > 0, "New role must not be empty");
        persons[_id].role = _newRole;
    }

    // Function to deactivate a person
    function deactivatePerson(uint _id) public onlyOwner {
        require(_id > 0 && _id <= personCount, "Person ID does not exist");
        persons[_id].isActive = false;
    }

    // Function using assert to check a condition
    function testAssert(uint _id) public view {
        require(_id > 0 && _id <= personCount, "Person ID does not exist");
        Person memory person = persons[_id];
        // Using assert to ensure the person's name is always not empty
        assert(bytes(person.name).length > 0);
    }

    // Function using require to check a condition
    function testRequire(uint _id) public view {
        // Using require to ensure the person ID exists
        require(_id > 0 && _id <= personCount, "Person ID does not exist");
    }

    // Function using revert to check a condition
    function testRevert(uint _id) public view {
        // Using revert to check if the person ID does not exist
        if (_id == 0 || _id > personCount) {
            revert("Person ID does not exist");
        }
    }
}

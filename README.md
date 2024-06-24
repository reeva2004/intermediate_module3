# __BollywoodIndustry Smart Contract__

This is a Solidity smart contract for managing individuals in the Bollywood industry, such as actors, directors, and producers. It allows the contract owner to add new individuals, update their roles, deactivate them, and retrieve their details.
# description

Certainly! Below is a detailed description you can add to the README file for the BollywoodIndustry smart contract:

BollywoodIndustry Smart Contract
Description
The BollywoodIndustry smart contract is designed to manage individuals in the Bollywood industry, such as actors, directors, and producers. This contract allows an authorized owner (typically the contract deployer) to add new individuals, update their roles, deactivate them, and retrieve their details. It serves as a basic example of how decentralized applications can be used to manage and maintain records in the entertainment industry.

Key Features
Add Individuals:

The contract owner can add new individuals to the Bollywood industry, specifying their name and role (e.g., Actor, Director, Producer).
Retrieve Details:

Anyone can retrieve the details of a specific individual by providing their ID. The details include the person's name, role, and active status.
Update Roles:

The contract owner can update the role of an existing individual, allowing for dynamic role changes within the industry.
Deactivate Individuals:

The contract owner can deactivate individuals, which marks them as inactive without removing their records from the contract.

## Getting Started
### Installing
To download the code, you can visit the following file path:-[https://github.com/reeva2004/intermediate_module3/blob/main/module3.sol]

## Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at (https://remix.ethereum.org/.)

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Meta.sol). Copy and paste the following code into the file: contract MyToken
```

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

 

   
```
## Authors
Reeva

## License
This project is licensed under the MIT License - see the LICENSE.md file for details

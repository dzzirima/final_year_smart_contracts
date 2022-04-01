//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "./StructDeclaration.sol";

import "hardhat/console.sol";

contract Main {
    /**List of all users in the system */
    uint256 totalUsers;

    //mapping for users and their role

    mapping(string => User) public userIdMappings;
    mapping(address => Prescription[]) medicalPrescriptions;

    function createUser(
        string memory addr,
        string memory _id,
        string memory _role,
        string memory _firstname,
        string memory _lastname
    ) public {
        // User storage  newUser = users[totalUsers];

        User memory newUser;
        
        newUser.Id = _id;
        newUser.role = _role;
        newUser.firstname = _firstname;
        newUser.lastname = _lastname;

        userIdMappings[addr] = newUser;
    }

    function getAllUsers(string memory userId) public view returns (string memory) {
        return userIdMappings[userId].firstname;
    }

    //function to get the user
    function getUser(string memory userId)
        public
        view
        returns (User memory)
    {
        return userIdMappings[userId];
    }

    /**function to approved the user especially for doctors */
    function approveUser(string memory userId) external {
        /**find  the user in the user array */
        // User  storage foundUser = userIdMappings[_id];
        // foundUser.verified = true;
        userIdMappings[userId].verified = true;

        console.log("finished changing the user");
    }

    /** function to delete the user */

    function removeUser(string memory userId) external {
        delete userIdMappings[userId]; // this  basically resets the index to default value
    }

    /** add accessors to the array of users */

    function addAccessors(string memory userId, address accessor) external {
        userIdMappings[userId].accessors.push(accessor);
    }

    /** 
    Records related functions
    1.create a record
    2.get all user records
    3.
     */

    //1.all user medical records should be stored under one mapping array
    function createRecord(
        string memory _recordId,
        address _patientId,
        string memory _doctorId,
        uint256 _quantityPrescribed,
        string memory _drugDescription
    ) public {
        Prescription memory myPrescription;

        myPrescription.owner = _patientId;
        myPrescription.recordId = _recordId;
        myPrescription.patientId = _patientId;
        myPrescription.doctorId = _doctorId;
        myPrescription.drugDescription = _drugDescription;
        myPrescription.quantityPrescribed = _quantityPrescribed;
        myPrescription.prescibedDate = block.timestamp;
        myPrescription.collectionDate = block.timestamp;

        medicalPrescriptions[_patientId].push(myPrescription);
    }

    function getUserRecords(address userAddr)
        external
        view
        onlyOwnerAccessRecords
        returns (Prescription[] memory)
    {
        
        return medicalPrescriptions[userAddr];
    }

    /*** Helper functions to control access  to the record
1.Only a phamacist
2.only a doctor
3.only owner
4.Only accessor
 */

    modifier onlyAccessors(string  memory userId) {
        address[] memory currentAccessors = userIdMappings[userId].accessors;

        require(
            indexOf(currentAccessors, msg.sender) >= 1,
            "Not allowed to view this users records"
        );
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    modifier onlyOwnerAccessRecords() {
        Prescription[] memory userPrescriptions = medicalPrescriptions[msg.sender];

        //make sure the owner is the sender
        for(uint256 i = 0; i < userPrescriptions.length ; i++){

            require(userPrescriptions[i].owner == msg.sender ,"Your are not the owner");
        }
        _;
    }

    function indexOf(address[] memory arr, address searchFor)
        public
        pure
        returns (uint256)
    {
        for (uint256 i = 0; i < arr.length; i++) {
            if (arr[i] == searchFor) {
                return i;
            }
        }
        return 0; // not found
    }
}

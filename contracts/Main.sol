//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "./StructDeclaration.sol";

import "hardhat/console.sol";

contract Main {
    /**List of all users in the system */
    uint256 totalUsers;

    //mapping for users and their role

    mapping(string => User) public userIdMappings;
    mapping(string => Prescription[]) medicalPrescriptions;
    mapping (string => string []) userRecordsAccessors;
    User[] userArray;

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

        /**add that user to the list of their accesors */
        userRecordsAccessors[_id].push(_id);

        /**Add that user to an array */
        userArray.push(newUser);

    }

    function getAllUsers() public view returns ( User[] memory) {
    return userArray;
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

    function addAccessors(string memory userId, string memory accessor) external {
        userIdMappings[userId].accessors.push("David zirima");
        console.log(accessor);

        userRecordsAccessors[userId].push(accessor);
    }

    function getUserAccessors(string memory userId) public view returns ( string [] memory) {
  
    return userRecordsAccessors[userId];

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
        string memory  _patientId,
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

    function getUserRecords(string memory userAddr)
        external
        view
        onlyOwnerAccessRecords(userAddr)
        returns (Prescription[] memory)
    {
        
        return medicalPrescriptions[userAddr];
    }

    /**Accesor related functions */
    function getAccessors(string memory userAddr) public view  returns (string [] memory){
        return userRecordsAccessors[userAddr];
    }

    /*** Helper functions to control access  to the record
1.Only a phamacist
2.only a doctor
3.only owner
4.Only accessor
 */

    modifier onlyAccessors(string  memory userId) {
        string[] memory currentAccessors = userIdMappings[userId].accessors;

        require(
            indexOf(currentAccessors,userId) >= 1,
            "Not allowed to view this users records"
        );
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    modifier onlyOwnerAccessRecords(string memory accessorId) {
        Prescription[] memory userPrescriptions = medicalPrescriptions[accessorId];

        //make sure the owner is the sender
        for(uint256 i = 0; i < userPrescriptions.length ; i++){

            require( (keccak256(bytes(userPrescriptions[i].owner)) == keccak256(bytes(accessorId))) ,"Your are not the owner");
        }
        _;
    }

    function indexOf(string[] memory arr, string memory searchFor)
        public
        pure
        returns (uint256)
    {
        for (uint256 i = 0; i < arr.length; i++) {
            if ( keccak256(bytes(arr[i])) == keccak256(bytes(searchFor))) {
                return i;
            }
        }
        return 0; // not found
    }
}

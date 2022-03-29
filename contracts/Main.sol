//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "./StructDeclaration.sol";

import "hardhat/console.sol";



contract Main{

    /**List of all users in the system */
    User[] public users;
    uint totalUsers;

    //mapping for users and their role

    /**funtions to do the magic */
    mapping (string =>User) public userIdMappings;

    function createUser(string memory _id ,string memory _role , string memory _firstname , string memory _lastname  ) public {
        // User storage  newUser = users[totalUsers];

        User storage  newUser = users.push();
        newUser.Id = _id;
        newUser.role = _role;
        newUser.firstname = _firstname;
        newUser.lastname = _lastname;


        userIdMappings[_id] = newUser;

       
    }

    function getAllUsers () public view returns(User [] memory){
        return users;

    }

    //function to get the user
    function getUser (string memory id) public view returns(User memory){

        return userIdMappings[id];

    }

    function approveUser (string memory _id) external {

        /**find  the user in the user array */
        User  storage foundUser = userIdMappings[_id];

        bool verified = foundUser.verified;

        console.log(verified);
        
        foundUser.verified = true;

    }



}
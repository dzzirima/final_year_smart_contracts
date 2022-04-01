//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "./StructDeclaration.sol";

import "hardhat/console.sol";



contract Main{

    /**List of all users in the system */
    uint totalUsers;

    //mapping for users and their role

    mapping (string =>User) public userIdMappings;

    function createUser(string memory _id ,string memory _role , string memory _firstname , string memory _lastname  ) public {
        // User storage  newUser = users[totalUsers];

        User memory  newUser;
        newUser.Id = _id;
        newUser.role = _role;
        newUser.firstname = _firstname;
        newUser.lastname = _lastname;


        userIdMappings[_id] = newUser;

    }

    function getAllUsers () public view returns(string memory){
        return userIdMappings["gafa"].firstname;

    }

    //function to get the user
    function getUser (string memory id) public view returns(User memory){

        return userIdMappings[id];

    }
/**function to approved the user especially for doctors */
    function approveUser (string memory _id) external {

        /**find  the user in the user array */
        // User  storage foundUser = userIdMappings[_id];
        // foundUser.verified = true;
        userIdMappings[_id].verified = true;

        console.log("finished changing the user");

    }

    /** function to delete the user */

    function removeUser (string memory _id) external {
         
        delete userIdMappings[_id]; // this  basically resets the index to default value
    }

    /** add accessors to the array of users */

    function addAccessors (address accessor) external{
        /**find  the user in the user array */
    //     User  storage foundUser = userIdMappings["gafa"];

    //    string[] storage  userAccessors  = foundUser.accessors;
    //    userAccessors.push(accessor);
    userIdMappings["gafa"].accessors.push(accessor);

    }


    /** 
    Records related functions
    
     */



}
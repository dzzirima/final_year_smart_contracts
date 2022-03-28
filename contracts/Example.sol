//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

struct MedRecord{
    address owner;
    string recordId ;
    uint256 datecreated;
}

struct User{
    string Id;
    bool verified;
    string role;

    string firstname;
    string lastname;
    address useraddress;

    /**List of  all medical records of a user */
    MedRecord [] records;

    /*** List  of all users who has access to medical records */
    User [] accessors;

    /**If  an address is mapped to true , the user can view 
    the medical records of that paticular user
     */

     mapping(address =>bool) can_access;

}

    


    




//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

struct Prescription{
        string recordId;
        address patientId;
        string phamacistId;
        string doctorId;

        uint quantityPrescribed;
        string drugDescription;

        string [] accessors ;
        

        uint256 prescibedDate;
        uint256    collectionDate;

    }

struct User{
    string Id;
    bool verified;
    string role;

    string firstname;
    string lastname;
    address useraddress;

    /**List of  all medical records of a user */
    // MedRecord [] records;

    /*** List  of all users who has access to medical records */
    address [] accessors;

    /**If  an address is mapped to true , the user can view 
        the medical records of that paticular user
     */

    //mapping(address =>bool) can_access;

}

    


    




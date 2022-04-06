//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

struct Prescription{
        string owner;
        string recordId;
        string patientId;
        string phamacistId;
        string doctorId;

        uint quantityPrescribed;
        string drugDescription;

        // string [] accessors ;  access control based on a record
        
        uint256 prescibedDate;
        uint256    collectionDate;
    }

struct User{
    string Id;
    bool verified;
    string role;
    string email;

    string firstname;
    string lastname;

    /*** List  of all users who has access to medical records */
    string [] accessors;
}





    


    




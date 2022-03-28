//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract MedAcces {

    struct Prescription{
        string recordId;
        string patientId;
        string phamacistId;
        string doctorId;

        uint quantityPrescribed;
        string drugDescription;

        string [] accessors ;
        

        uint256 prescibedDate;
        uint256    collectionDate;

    }
    /**Array of all prescription Records */
    Prescription[] public Prescriptions;


    /**functions to do the manipulation of the prescription */

   function  create(
       string memory  _recordId,
       string memory  _patientId,
       string memory  _doctorId,
        uint  _quantityPrescribed,
       string memory  _drugDescription
       ) public{

           string []  memory initial_accessors = new string[](5);

           // adding it to the  array of prescriptions
           Prescriptions.push(Prescription(
               {
                   recordId:_recordId,
                   patientId:_patientId,
                   doctorId:_doctorId,
                   phamacistId:_patientId,

                   quantityPrescribed:_quantityPrescribed,
                   drugDescription:_drugDescription,

                   prescibedDate:block.timestamp,
                   collectionDate:block.timestamp,

                   accessors: initial_accessors
               }
               ));
   }

}
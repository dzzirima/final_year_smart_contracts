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

        address[] accessors;

        uint256 prescibedDate;
        uint256    collectionDate;

    }

}
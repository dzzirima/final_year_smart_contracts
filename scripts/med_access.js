
const hre = require("hardhat");

async function main() {


  const Main = await hre.ethers.getContractFactory("Main");
  const main = await Main.deploy();

  await main.deployed();
  const [owner, addr1, addr2] = await ethers.getSigners();


  console.log("Main  deployed to:", main.address);

  /** creating a new user */
  const newUser = await main.createUser("gafa","gafa","gafa","admin","Gafa")

  const user2 = await main.createUser("david","gafa","gafa2","admin","Gafa")

  /** getting all the users */
  let usersFound = await main.getAllUsers()


//verify the user
let verification = await main.approveUser(owner)

let user = await main.getUser(addr2)


//deleteing the user
// await main.removeUser("gafa")

// adding accessors 
let addingAccessor = await main.addAccessors("gafa","David")
let addingAccessor2 = await main.addAccessors("gafa2","tafadzwa")
let addingAccessor3 = await main.addAccessors("gafa2","XXXRTGH")

let myAccessors  = await main.getUserAccessors("gafa2")




//remove an accessor
let removeAccess = await main.removeAccessor("gafa2" , "tafadzwa")
let addingAccessor4 = await main.addAccessors("gafa","david")
myAccessors  = await main.getUserAccessors("gafa2")



// //creating a record
const createRecord = await main.createRecord("RecordId1","gafa","Dr Gafa",5,"Gafa surname")
const createRecord2 = await main.createRecord("recordId2","gafa","Dr Gafa",5,"Drug 2")



//get the user records
const getUserRecords = await main.getUserRecords("gafa" , "david")

console.log(getUserRecords)

return;

user = await main.getUser("gafa")

//getting accessors of a record 

let allUserAccessors = await main.getAccessors()
console.log(allUserAccessors)



}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

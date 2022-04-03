
const hre = require("hardhat");

async function main() {


  const Main = await hre.ethers.getContractFactory("Main");
  const main = await Main.deploy();

  await main.deployed();
  const [owner, addr1, addr2] = await ethers.getSigners();


  console.log("Greeter deployed to:", main.address);

  /** creating a new user */
  const newUser = await main.createUser("gafa","gafa","admin","Gafa","Gafa surname")

  const user2 = await main.createUser(addr2,"gafa2","admin","Gafa","New User")

  
  

  /** getting all the users */
  let usersFound = await main.getAllUsers(owner)
   //console.log(usersFound)


//verify the user
let verification = await main.approveUser(owner)

let user = await main.getUser(addr2)






//deleteing the user
// await main.removeUser("gafa")

// adding accessors 
 let addingAccessor = await main.addAccessors("gafa","0x5FbDB2315678afecb367f032d93F642f64180aa3")
let addingAccessor2 = await main.addAccessors("gafa","0x5FbDB2315678afecb367f032d93F642f64180aa3")



// //creating a record
// const createRecord = await main.createRecord("gafa","0x5FbDB2315678afecb367f032d93F642f64180aa3","Dr Gafa",5,"Gafa surname")
// const createRecord2 = await main.createRecord("gafa","0x5FbDB2315678afecb367f032d93F642f64180aa3","Dr Gafa",5,"Drug 2")

//get the user records
//const getUserRecords = await main.getUserRecords("0x5FbDB2315678afecb367f032d93F642f64180aa3")


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

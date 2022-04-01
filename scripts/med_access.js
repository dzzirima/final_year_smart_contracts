
const hre = require("hardhat");

async function main() {


  const Main = await hre.ethers.getContractFactory("Main");
  const main = await Main.deploy();

  await main.deployed();



  console.log("Greeter deployed to:", main.address);

  /** creating a new user */
  const newUser = await main.createUser("gafa","admin","Gafa","Gafa surname")
  const newUser2 = await main.createUser("gafa2","admin","Gafa","Gafa surname")
  

  /** getting all the users */
  // let usersFound = await main.getAllUsers()
  // console.log(usersFound)



//verify the user
let verification = await main.approveUser("gafa")
let user = await main.getUser("gafa")





//deleteing the user
// await main.removeUser("gafa")

// adding accessors 
 let addingAccessor = await main.addAccessors('0x5FbDB2315678afecb367f032d93F642f64180aa3')
 let addingAccessor2 = await main.addAccessors('0x9665170f3789a48616987cc0c2BFFAa8F6e0A3F4')



user = await main.getUser("gafa")

console.log(user)

}


main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

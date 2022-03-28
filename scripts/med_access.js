
const hre = require("hardhat");

async function main() {


  const Main = await hre.ethers.getContractFactory("Main");
  const main = await Main.deploy();

  await main.deployed();

  console.log("Greeter deployed to:", main.address);

  /** creating a new user */
  const newUser = await main.createUser("gafa","admin","Gafa","Gafa surname")
  //const newUser2 = await main.createUser("gafa","admin","Gafa","Gafa surname")



  console.log("getting all the users now")
  let allUsers = await main.getAllUsers()
  console.log("Users found ",allUsers)
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

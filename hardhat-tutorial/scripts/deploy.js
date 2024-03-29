const { ethers }=require("hardhat");
async function main(){
  const whitelistContract= await ethers.getContractFactory("Whitelist");
  //constructor runs with value 10
  const deployedWhitelistContract = await whitelistContract.deploy(10);
  await deployedWhitelistContract.deployed();
  console.log("Whitelist Contract Address",deployedWhitelistContract.address);
}
main()
.then(()=>process.exit(0))
.catch((error) => {
  console.log(error);
  process.exit(1);
})
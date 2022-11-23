import { expect } from "chai";
import hre from "hardhat";
import { ethers, waffle } from 'hardhat'

// import { time } from "@nomicfoundation/hardhat-network-helpers";

describe("Lock", function () {
  it("Should set the right unlockTime", async function () {
    // deploy a lock contract where funds can be withdrawn
    // one year in the future
    const Lock = await hre.ethers.getContractFactory("Lock");
    const lock = await Lock.deploy(unlockTime, { value: lockedAmount });

    // assert that the value is correct
    expect(await lock.unlockTime()).to.equal(unlockTime);
  });
});
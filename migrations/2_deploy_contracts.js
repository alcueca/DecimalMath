const DecimalMath = artifacts.require('./DecimalMath.sol');

module.exports = async (deployer, network, accounts) => {
    await deployer.deploy(DecimalMath);
}

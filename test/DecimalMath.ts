import { should } from 'chai';
import { DecimalMathInstance } from '../types/truffle-contracts';


const DecimalMath: Truffle.Contract<DecimalMathInstance> = artifacts.require('./DecimalMath.sol');
should();

/** @test {DecimalMath} contract */
contract('DecimalMath', (accounts) => {
    /**
     * Test toUFixed
     * @test {DecimalMath#toUFixed}
     */
    it('converts unsigned integers to fixed point structs.', async () => {
        const decimalMathInstance = await DecimalMath.deployed();

        // Set value of 89
        const ufixed = await decimalMathInstance.toUFixed(89, { from: accounts[0] });

        (ufixed.value.toString()).should.be.equal('89');
    });
});

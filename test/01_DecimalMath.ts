const DecimalMath = artifacts.require('DecimalMathMock')

// @ts-ignore
import { expectRevert } from '@openzeppelin/test-helpers'
import { id } from 'ethers/lib/utils'
import { assert } from 'chai'

contract('DecimalMath', async (accounts: string[]) => {
  let [owner, user] = accounts

  let math: any

  const one = '1000000000000000000000000000'
  const two = '2000000000000000000000000000'
  const three = '3000000000000000000000000000'
  const four = '4000000000000000000000000000'
  const five = '5000000000000000000000000000'
  const six = '6000000000000000000000000000'

  beforeEach(async () => {
    math = await DecimalMath.new({ from: owner })
  })

  it('muldc', async () => {
    assert.equal((await math.muldc(two, three)).toString(), six)
  })

  it('muldu', async () => {
    assert.equal((await math.muldu(two, three)).toString(), six)
  })

  it('divdc', async () => {
    assert.equal((await math.divdc(six, three)).toString(), two)
  })

  it('divdu', async () => {
    assert.equal((await math.divdu(six, three)).toString(), two)
  })

  it('divdi', async () => {
    assert.equal((await math.divdu(six, three)).toString(), two)
  })

  it('adddu', async () => {
    assert.equal((await math.adddu(two, three)).toString(), five)
  })

  it('subdu', async () => {
    assert.equal((await math.subdu(three, two)).toString(), one)
  })

  it('divdrup', async () => {
    assert.equal((await math.divdrupc(six, three)).toString(), two)
    assert.equal((await math.divdrupc(one, three)).toString(), '333333333333333333333333334')
  })
})

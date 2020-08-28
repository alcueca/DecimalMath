const DecimalMath = artifacts.require('DecimalMathMock')

// @ts-ignore
import { expectRevert } from '@openzeppelin/test-helpers'
import { id } from 'ethers/lib/utils'
import { assert } from 'chai'

contract('DecimalMath', async (accounts: string[]) => {
  let [owner, user] = accounts

  let math: any

  beforeEach(async () => {
    math = await DecimalMath.new({ from: owner })
  })

  it('muldc', async () => {
    console.log('    ' + (await math.muldc('2000000000000000000000000000', '2000000000000000000000000000')).toString())
  })

  it('muldu', async () => {
    console.log('    ' + (await math.muldu('2000000000000000000000000000', '3000000000000000000000000000')).toString())
  })

  it('divdc', async () => {
    console.log('    ' + (await math.divdc('2000000000000000000000000000', '2000000000000000000000000000')).toString())
  })

  it('divdc(0,1)', async () => {
    console.log('    ' + (await math.divdc(0, 1)).toString())
  })

  it('divdu', async () => {
    console.log('    ' + (await math.divdu('4000000000000000000000000000', '2000000000000000000000000000')).toString())
  })

  it('adddu', async () => {
    console.log('    ' + (await math.adddu('2000000000000000000000000000', '2000000000000000000000000000')).toString())
  })

  it('subdu', async () => {
    console.log('    ' + (await math.subdu('4000000000000000000000000000', '2000000000000000000000000000')).toString())
  })

  it('divdrupc(1,3)', async () => {
    console.log('    ' + (await math.divdrupc(1, 3)).toString())
  })
})

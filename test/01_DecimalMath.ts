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

  it('muld1', async () => {
    assert.equal((await math.muld1(two, three)).toString(), six)
  })

  it('muld2', async () => {
    assert.equal((await math.muld2(two, three)).toString(), six)
  })

  it('muld3', async () => {
    assert.equal((await math.muld3(two, three)).toString(), six)
  })

  it('divd1', async () => {
    assert.equal((await math.divd1(six, three)).toString(), two)
  })

  it('divd1', async () => {
    assert.equal((await math.divd2(six, three)).toString(), two)
  })

  it('divd1', async () => {
    assert.equal((await math.divd3(six, three)).toString(), two)
  })

  it('divd1', async () => {
    assert.equal((await math.divd4(six, three)).toString(), two)
  })

  it('addd1', async () => {
    assert.equal((await math.addd1(two, three)).toString(), five)
  })

  it('addd2', async () => {
    assert.equal((await math.addd2(two, three)).toString(), five)
  })

  it('subd1', async () => {
    assert.equal((await math.subd1(three, two)).toString(), one)
  })
  
  it('subd2', async () => {
    assert.equal((await math.subd2(three, two)).toString(), one)
  })

  it('subd3', async () => {
    assert.equal((await math.subd3(three, two)).toString(), one)
  })

  it('divdrup', async () => {
    assert.equal((await math.divdrup(six, three)).toString(), two)
    assert.equal((await math.divdrup(one, three)).toString(), '333333333333333333333333334')
  })

  it('muldrup', async () => {
    assert.equal((await math.muldrup(two, three)).toString(), six)
    assert.equal((await math.muldrup('6666666666666666666666666666', '300000000000000000000000000')).toString(), two)
  })

  it('powd', async () => {
    assert.equal((await math.powd(0, 0)).toString(), 0)
    assert.equal((await math.powd(1, 0)).toString(), one)
    assert.equal((await math.powd(one, 1)).toString(), one)
    assert.equal((await math.powd(two, 2)).toString(), four)
  })
})

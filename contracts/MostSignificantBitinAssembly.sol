// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MostSignificantBitinAssembly{

    uint public  constant MAX_UINT = type(uint).max;

    function Code(uint256 x) external pure returns(uint8 r)
    {
        // if (x>=2**128){
        //     x>>=128;
        //     r+=128;
        // }
        assembly{
        let f := gt(x,0xffffffffffffffffffffffffffffffff)
        f := shl(7,f)
        x := shr(f,x)
        r := or(r,f)
        }

        // if (x>=2**64){
        //     x>>=64;
        //     r+=64;
        // }

        assembly{
        let f := gt(x,0xffffffffffffffff)
        f := shl(6,f)
        x := shr(f,x)
        r := or(r,f)
        }

        // if (x>=2**32){
        //     x>>=32;
        //     r+=32;
        // }
        assembly{
        let f := gt(x,0xffffffff)
        f := shl(5,f)
        x := shr(f,x)
        r := or(r,f)
        }

        // if (x>=2**16){
        //     x>>=16;
        //     r+=16;
        // }
        assembly{
        let f := gt(x,0xffff)
        f := shl(4,f)
        x := shr(f,x)
        r := or(r,f)
            }

        // if (x>=2**8){
        //     x>>=8;
        //     r+=8;
        // }
        assembly{
        let f := gt(x,0xff)
        f := shl(3,f)
        x := shr(f,x)
        r := or(r,f)
            }
        // if (x>=2**4){
        //     x>>=4;
        //     r+=4;
        // }
        assembly{
        let f := gt(x,0xf)
        f := shl(2,f)
        x := shr(f,x)
        r := or(r,f)
            }

        // if (x>=2**2){
        //     x>>=2;
        //     r+=2;
        // }
        assembly{
        let f := gt(x,0x3)
        f := shl(1,f)
        x := shr(f,x)
        r := or(r,f)
            }

        //if (x>=2){
            //x>>2;
            //r+=1;
        //}
        assembly{
        let f := gt(x,0x1)
        r := or(r,f)
            }

        return r;
    
    }
}
//SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.5.0 <0.9.0;


contract crowdSale{
    mapping(address=>uint256) public TokenPrice;
    function addToken(address tokenAddress,uint value)public{
        TokenPrice[tokenAddress]=value;
    }

    function buyToken(address tokenAddress,uint numTokens)public payable{
        require(numTokens>0,"Not sufficient Tokens");
        uint256 etherAmount=numTokens* TokenPrice[tokenAddress] / 1e18;
        payable(msg.sender).transfer(numTokens* TokenPrice[tokenAddress] / 1e18);
    }
}
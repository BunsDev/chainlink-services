// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract Register {
    string private s_info;

    function getInfo() public view returns (string memory) {
        return s_info;
    }

    function setInfo(string memory _info) public {
        s_info = _info;
    }
}
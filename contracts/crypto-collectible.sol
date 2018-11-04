pragma solidity^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Token.sol';

contract Collectible is ERC721Token {
  constructor() ERC721("Collectible", "COL") public {}

  struct Color {
    uint8 red;
    uint8 green;
    uint8 blue;
  }

  Color[] colors;

  function mint() public {
    Color memory _color = Color(uint8(now), uint8(now-1000), uint8(now-5500));
    uint _id = colors.push(_color) - 1;
    _mint(msg.sender, _id);
  }

  function getColorFromId(uint id) public view returns(uint8, uint8, uint8) {
    return (colors[id].red, colors[id].green, colors[id].blue);
  }
}

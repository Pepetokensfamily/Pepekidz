// SPDX-License-Identifier: MIT

/**
██████╗ ███████╗██████╗ ██╗       ██╗       ██████╗ ███████╗██████╗ ██╗████████╗ █████╗ ███████╗    ██╗  ██╗██╗██████╗ ███████╗
██╔══██╗██╔════╝██╔══██╗██║       ██║       ██╔══██╗██╔════╝██╔══██╗██║╚══██╔══╝██╔══██╗██╔════╝    ██║ ██╔╝██║██╔══██╗╚══███╔╝
██████╔╝█████╗  ██████╔╝██║    ████████╗    ██████╔╝█████╗  ██████╔╝██║   ██║   ███████║███████╗    █████╔╝ ██║██║  ██║  ███╔╝ 
██╔═══╝ ██╔══╝  ██╔═══╝ ██║    ██╔═██╔═╝    ██╔═══╝ ██╔══╝  ██╔═══╝ ██║   ██║   ██╔══██║╚════██║    ██╔═██╗ ██║██║  ██║ ███╔╝  
██║     ███████╗██║     ██║    ██████║      ██║     ███████╗██║     ██║   ██║   ██║  ██║███████║    ██║  ██╗██║██████╔╝███████╗
╚═╝     ╚══════╝╚═╝     ╚═╝    ╚═════╝      ╚═╝     ╚══════╝╚═╝     ╚═╝   ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚═╝  ╚═╝╚═╝╚═════╝ ╚══════╝                                                                                                                           
*/
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Base64.sol";
import "./IUniswapV2ERC20.sol";

contract PepeKidz is ERC721Enumerable, Ownable {
  using Strings for uint256;
    string[] public kidzValues = ["Pepetino","Pepper","Peppy","Pepito","Peppa","Peppermint","Pepin","Pepijn","Peponi","Pepeka","Peppi","Peppino","Pepelea","Pepita","Peperina","Peppinella","Pepona","Peperita","Peppina","Peppone","Peperoncino","Pepsi","Peptalk","Peppertop","Pepperspray","Peptastic","Peplum","Peppertree","Pepstone","Pepstream","Pepstorm","Pepshire","Peppersmith","Pepwagon","Pepville","Pepwave","Peppurr","Peporama","Peppery","Pepopolis","Pepnova","Pepridge","Peptopia","Pepalicious","Peppadew","Pepperminty","Peppersnap","Pepbox","Pepwise","Peplush","Pepvibe","Peppermintz","Peponis","Peperico","Pepchilla","Pepfinity","Pepluxe","Peppobella","Pepster","Peppurrito","Peppercorn","Pepmazing","Pepdelight","Pepblend","Pepella","Peppaberry","Peppurrific","Peponita","Pepshine","Pepzest","Pepperswirl","Peppabloom","Peppaville","Pepopop","Pepelina","Peppercake","Peppermintine","Pepdazzle","Pepperaffle","Pepfusion","Peplume","Pepparmint","Pepeluca","Peppabella","Peppita","Pepsterella","Peppalina","Peptacular","Peppagail","Peppalicious","Pepstella","Pepida","Pepnificent","Pepessa","Peptastic","Peppilly","Peppolino","Pepella","Pepellina","Pepette","Pepana","Pepadee","Pepzara","Peppamela","Pepamina","Peppabelle","Pepedora","Pepolina","Pepolina","Pepolito","Peparella","Pepetta","Peppolina","Pepolene","Pepizza","Peppetal","Pepperna","Pepolito","Pepolina","Peppika","Peppalia","Peppabina","Pepalina","Peppando","Pepesta","Pepareta","Pepima","Pepancake","Peppessa","Peppinity","Pepinia","Peppopolis","Pepentress","Pepadora","Peppony","Pepella","Pepinette","Pepilina","Peprika","Pepalee","Pepicasso","Pepelina","Pepparelle","Pepalicious","Peppylee","Peppitude","Pepina","Pepareena","Pepp"];
    string[] public petsValues = ["Dog","Cat","Fish","Hamster","Rabbit","Guinea pig","Bird","Turtle","Snake","Lizard","Ferret","Mouse","Rat","Parrot","Donkey","Canary","Gerbil","Hermit crab","Hedgehog","Chinchilla","Tarantula","Horse","Pony","Goat","Sheep","Cow","Pig","Chicken","Rooster","Duck","Turkey","Geese","Pigeon","Goldfish","Betta fish","Guppy","Iguana","Leopard gecko","Bearded dragon","Axolotl","Scorpion","Crow","Frog","Octopus","Jellyfish","Seahorse","Starfish","Dolphin","Orca","","","Koala","Kangaroo","Giraffe","Elephant","Lion","Tiger","Cheetah","Zebra","Gorilla","Chimpanzee","Panda","Polar bear","Sloth","Crocodile","Alligator","Snail","Butterfly","Ladybug","Spider","Ant","Bee","Grasshopper","Cricket","Lobster","Crab","Shrimp","","Shark","Whale","Otter","Seal","Penguin","Flamingo","Peacock","Toucan","Owl","Eagle","Fox","Raccoon","Squirrel","","","Hamster","","","Rat","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""];
      struct Kidz { 
      string mint;
      string description;
      string bgHue;
      string textHue;
      string name;
      string pet;
   }
  
  mapping (uint256 => Kidz) public kidz;

  
  address public contractOwner;
  IUniswapV2ERC20 private token;
  

  constructor(address _tokenAddress) ERC721("PepeKidz", "PEPZ") {
    contractOwner = msg.sender; 
    token = IUniswapV2ERC20(_tokenAddress);}

  // public mint function
  function mint(uint256 amount) external {
    uint256 supply = totalSupply();
    require(supply + 1 <= 4200);
    
    Kidz memory newKidz = Kidz(
        string(abi.encodePacked('PEPZ #', uint256(supply + 1).toString())), 
        "PepeKidz are the youngest members of the crazy PepeTokensFamily. Pepe & Pepita are so proud of them.",
        randomNum(361, block.difficulty, supply).toString(),
        randomNum(361, block.timestamp, supply).toString(),
        kidzValues[randomNum(kidzValues.length, block.difficulty, supply)],
        petsValues[randomNum(petsValues.length, block.difficulty, supply)]
        );
    
    if (msg.sender != owner()) {
       uint256 paymentAmount = calculatePaymentAmount(amount);  // Payment calculation logic
    require(token.transferFrom(msg.sender, address(this), paymentAmount), "Payment failed");  // Transfer tokens from the sender to the contract

    }
    
    kidz[supply + 1] = newKidz;
    _safeMint(msg.sender, supply + 1);
  }

  function calculatePaymentAmount(uint256 amount) internal pure returns (uint256) {
    // Payment calculation logic
    uint256 paymentAmount = amount * 1000000000000000000000;  // 1000 PEPI-PEPE LP tokens
    return paymentAmount;
}

  function randomNum(uint256 _mod, uint256 _seed, uint _salt) public view returns(uint256) {
      uint256 num = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, _seed, _salt))) % _mod;
      return num;
  }
  
  function buildImage(uint256 _tokenId) public view returns(string memory) {
      Kidz memory currentKidz = kidz[_tokenId];
      return Base64.encode(bytes(
          abi.encodePacked(
              '<svg width="500" height="500" xmlns="http://www.w3.org/2000/svg">',
              '<rect height="500" width="500" fill="hsl(',currentKidz.bgHue,', 50%, 25%)"/>',
              '<text x="50%" y="50%" dominant-baseline="middle" fill="hsl(',currentKidz.textHue,', 100%, 80%)" text-anchor="middle" font-size="72">',currentKidz.name,'</text>',
              '</svg>'
          )
      ));
  }
  
  function buildMetadata(uint256 _tokenId) public view returns(string memory) {
      Kidz memory currentKidz = kidz[_tokenId];
      return string(abi.encodePacked(
              'data:application/json;base64,', Base64.encode(bytes(abi.encodePacked(
                          '{"mint":"', 
                          currentKidz.mint,
                          '", "description":"', 
                          currentKidz.description,
                          '", "Kid name":"', 
                          currentKidz.name,
                          '", "Pet":"', 
                          currentKidz.pet,
                          '", "image": "', 
                          'data:image/svg+xml;base64,', 
                          buildImage(_tokenId),
                          '"}')))));
  }

  function tokenURI(uint256 _tokenId) public view virtual override returns (string memory) {
      require(_exists(_tokenId),"ERC721Metadata: URI query for nonexistent token");
      return buildMetadata(_tokenId);
  }

  function withdraw() public payable onlyOwner {

    (bool os, ) = payable(owner()).call{value: address(this).balance}("");
    require(os);
  }



function withdrawTokens() public onlyOwner {
    uint256 balance = token.balanceOf(address(this));
    require(balance > 0, "No tokens to withdraw");

    uint256 ownerShare = (balance * 31) / 100;
    uint256 recipientShare = balance - ownerShare;

    bool successOwner = token.transfer(contractOwner, ownerShare);
    require(successOwner, "Token transfer to owner failed");

    bool successRecipient = token.transfer(0x000000000000000000000000000000000000dEaD, recipientShare);
    require(successRecipient, "Token transfer to recipient failed");
}

}

# Pepekidz
PepeKidz are 100% onchain NFTs! They are generated when you mint - RARITY is unknown until all 4200 are minted! Some of the Kids may also have Pets.

https://mint.pepetokens.lol/ 

https://discord.gg/PT2tDQpRe4


Connect the PepeKidz_w_Pets.sol contract via https://remix.ethereum.org/ to PEPZ contract addresses.
Connect the IUniswapV2ERC20.sol contract to PEPI-PEPE LP contract addresses.

ALT:	  PEPZ: `0xAdCd78D962190764A2ea703e7072cbF222197F47` 	 PEPI-PEPE LP: `0x284f01a8ab6542e8e257f289a2c4e851c7ebc82e`

GRAMS:  PEPZ: `0xbB1f8B3a73a0B5084aF9a95e748f9d84DdBA6E88`  PEPI-PEPE LP: `0x63AA618d2C433593ccC34bD47A75c4c4a095D079`

ETHO:   PEPZ: `tba`  PEPI-PEPE LP: `0x59c8Bc25474aC63371b5999FaE44b6c6eA1bb0E9`

Use the `balanceOf` function to find how many NFTs you have. You can then insert address and index number to the function `tokenOfOwnerByIndex` to find your actual PEPZ # numbers. Index count from 0, so if you have 5 NFTs, your index range is 0-4.

You can import your NFTs to Metamask using contract address and PEPZ #.

You can also insert PEPZ # into the `kidz` function to find its metadata. 
You can also insert PEPZ # into the `tokenURI` function, then copy the result string into a browser, ie: `data:application/json;base64,*`. There you will find a `data:image/svg+xml;base64,*` string, which is your actual NFT image. 

You can also use the functions `buildImage` and `buildMetadata`.

**Ether Transfer**: Accept Ether and withdraw it.

**Concept**: **payable** functions.

note:Need to practice it.

(bool success, ) = payable(owner).call{value: address(this).balance}("");

    require(success, "Ether transfer failed");

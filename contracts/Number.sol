pragma solidity ^0.4.8;

import './zeppelin/ownership/Ownable.sol';

contract Number is Ownable {

	uint private number;
	address public winner;

	modifier noWinner(){
		if (winner == address(0))
			_;
		else
			throw;
	}

	function Number(uint testNumber) {
		number = testNumber;
	}

	function changeNumber(uint newNumber) onlyOwner() {
		number = newNumber;
		winner = address(0);
	}

	function guessNUmber(uint _number) noWinner() {
		if (number == _number) {
			winner = msg.sender;
		}
	}

}
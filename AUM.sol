// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IERC20 {
    // yeah function declare keya ha is mey humy btye ga ky token ki supply kitni ha 
    // is function sey get ho ga jub yeah call ho ga to pata chaly ga ky kitni supply ha maximum token kitny ha  
    function totalSupply() external view returns (uint256);
    //yeah btye ga ky user ky pass kitny tokens ha 
    function balanceOf(address account) external view returns (uint256);
    // transfer karny ha token aur kitny token transfer karny ha 
    function transfer(address recipient, uint256 amount) external returns (bool);
    //main ney kisi user ko kitny token transfer karny ki authrity di ha 
    function allowance(address owner, address spender) external view returns (uint256);
    // main kisi user ko authority do ga mery token tum kisi user ko transfer ker sakta ha  
    function approve(address spender , uint amount) external returns (bool);
    // jis ko approve keya ha ky tume token transfer ky sakty ho 
    function transferFrom(address sender , address recpient , uint amount) external returns(bool);

// data manage karny ky leye use ho ga , btye ga ky transaction hoya ha ya nahi 
    event Transfer(address indexed from, address indexed to, uint256 value );
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
//name
contract AUM is IERC20{
// create variables
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public _totalSupply ;
    mapping (address =>uint256) private _balance;
    mapping (address=> mapping (address =>uint256)) private _allowances ;
    //set variables using constructor
    constructor(string memory _name , string memory _symbol , uint8 _decimals , uint256 _initialSupply){
        name=_name;
        symbol=_symbol;
        decimals=_decimals;
        _totalSupply=_initialSupply*10**decimals;
        // jo contract ko deploy ker raha ha us ky address mey tokens send ho gy 
        _balance[msg.sender]=_totalSupply;
    }
    // function create for totalSupply
    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }
    //function create for balanceOf
    function balanceOf(address account) external override view  returns(uint256){
        return _balance[account];
    }
    // function for transfer token 
    function transfer(address recipient, uint256 amount )public  override returns (bool ){
        require(recipient!=address(0),"recepient cant be address zero");
        require(_balance[msg.sender]>=amount,"not enough tokens");
        _balance[msg.sender]-=amount;
        _balance[recipient]+=amount;
        //call event 
        emit Transfer(msg.sender, recipient, amount);
        return true ;
    }
    // function create for approve  
    function allowance(address owner , address spender) public  override view returns (uint256){
        return _allowances[owner][spender];
    }
    // function for approve
    function approve(address spender,uint256 amount) public override returns (bool ){
        _allowances[msg.sender][spender]=amount;
        emit Approval(msg.sender,spender , amount);
        return true;
    }
    // function for transfer which is used for spender
    function transferFrom(address sender , address recpient , uint amount) public override returns (bool ){
        require(sender != address(0),"ERC:20 Invalid sender address");
        require(recpient != address(0),"ERC:20 Invalid recpient address");
        require(_balance[sender]>=amount,"ERC not enough tokens");
        require(_allowances[sender][msg.sender]>=amount,"ERC Unsufficient allowance balance");

        _balance[sender]-=amount;
        _balance[recpient]+=amount;
        _allowances[sender][msg.sender]-=amount;
        emit Transfer( sender, recpient , amount);
        return true ;

    }
}

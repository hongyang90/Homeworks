import React from 'react';

class Calculator extends React.Component{
  constructor(props){
    super(props);
    //your code here
    this.state = {result: 0, num1: "", num2: ""};
    this.setNum1 = this.setNum1.bind(this);
    this.add = this.add.bind(this);
    this.clear = this.clear.bind(this);
  }

  //your code here
  setNum1(event) {
    event.preventDefault();
    this.setState({num1: event.target.value });
  }
  

  setNum2(event) {
    event.preventDefault();
    this.setState({ num2: event.target.value });
  }

  add(e) {
    event.preventDefault();
    this.setState({result: this.state.num1 + this.state.num2})
  }
  
  clear(e) {
    event.preventDefault();
    this.setState({num1: "", num2: "", result: 0});
  }

  render(){
    return (
      <div>
        <h1>Hello World</h1>
        //your code will replace this
        <h1>{this.state.result}</h1>
        <input onChange={this.setNum1} type="text" value={this.state.num1}/>
        <input onChange={this.setNum2} type="text" value={this.state.num2}/>
        <button onClick={this.add}>+</button>
        <button onClick={this.clear}>Clear</button>
      </div>
    );
  }
}

export default Calculator;

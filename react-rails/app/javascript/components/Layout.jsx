import React from "react";

import Header from "./Header";

export default class Layout extends React.Component {
  constructor() {
    super();
    this.state = {    // set initial state
      title: "welcome ayy",
    };
  }

  changeTitle(title) {
    this.setState({title});
  }

  render() {
    setTimeout( () => {
      this.setState({title : Date().split(' ')[4]});
    }, 1000)
    return (
      <div>
        {this.state.title}
        <Header changeTitle={this.changeTitle.bind(this)} title={this.state.title} />
      </div>
    );
  }
}

// changeTitle.BIND(THIS) - important!!! Without it the callee would run the method on itself
// instead of the actual target component
// so we need Layout to run the method, not the Header
import React from "react";

import Title from "./Header/Title";

export default class Header extends React.Component { // Header is _this_
  handleChange(e) { // function receives a plain old event
    // e.target is an element that is receiving the onChange (the input - is changed)
    const title = e.target.value;
    this.props.changeTitle(title);
  }

  render() {
    return (
      <header>
        <Title title={this.props.title} />
        <input value={this.props.title} onChange={this.handleChange.bind(this)} />
      </header>
    );
  }
}


/* 
1. input field is changed 
2. handleChange is fired
3. handleChange takes title from input (e.target.value)
4. handleChange runs changeTitle property (method) using obtained title
5. changeTitle can be used here because it is injected as a prop in Layout.js
*/
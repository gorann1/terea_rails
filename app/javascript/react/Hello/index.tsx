// @ts-ignore
import React from "react";

// @ts-ignore
const Hello = ({ name }: { name: string }) => <span>Hello {name}!</span>;

Hello.defaultProps = { name: "World" }

export default Hello;

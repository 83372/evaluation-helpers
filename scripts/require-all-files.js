const fs = require('fs');
const assert = require('assert');

let path = process.argv[2]
let list_of_js_files = fs.readdirSync(path).filter(x => x.includes(".js"));

let solutions = list_of_js_files.reduce((prev, cur) => {
  let file = `../${path}/${cur}`;
  try {
    prev[cur.slice(0, -3)] = require(file).toString();
  } catch (e) {
    prev[cur.slice(0, -3)] = `Looks like some problems with ${file}`;
  }
  return prev;
}, {})



// // Running test cases
// let tests = {}
//
// let runTestCases = function(tests,solutions) {
//   let functions = Object.keys(solutions)
//   let foo = functions.map(s=>tests[s].map(t=>t(solutions[s])))
//   foo.forEach((r,i)=>r.forEach((s,j)=>{
//     if(!s){
//       console.log(j,functions[i], tests[functions[i]][j], "has failed");
//     }
//
//   }))
// }

console.log(JSON.stringify(solutions,null,2));

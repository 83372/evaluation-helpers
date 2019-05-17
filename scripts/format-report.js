const fs = require('fs');
let transformField = function(fieldSet){
  return fieldSet.reduce((prev,cur)=>{
    let suiteName = cur['suite'];
    prev[suiteName]= !(prev[suiteName])?[]:prev[suiteName];
     prev[suiteName].push(cur);
     return prev
   } ,{})
}

function toMarkDown(reportJSON){
  let columns = ['failed','passed','pending'];
  let transformedJSON = {};
  let marker = "\n```"
  columns.forEach(col=>transformedJSON[col]=transformField(reportJSON[col]));
  return `
  ${suiteFormatter('Failed',transformedJSON['failed'],failedFormatter)}
  ${suiteFormatter('Pending',transformedJSON['pending'],simpleFormatter,marker)}
  ${suiteFormatter('Passed',transformedJSON['passed'],simpleFormatter,marker)}
  `;
}

function simpleFormatter(_case) {
  let formatted = _case.title;
  return formatted + "\t";
}

function suiteFormatter(heading,suites,formatter=simpleFormatter,marker='') {
  let formatted = Object.keys(suites).map(s=>
    `**${s}:**\n ${marker}\n${suites[s].map(suite => formatter(suite)).join('\n')}${marker}`
  ).join('\n');
  return `### ${heading}:  \n <details><summary> Click here </summary>\n<p> \n${formatted}\n</p>\n</details> \n`;
}

function failedFormatter(_case) {
  let formatted = `
  case: ${_case.title}
  errMessage: ${_case.errMessage}
  actual: ${_case.actual}
  expected: ${_case.expected}
  `
  return "````json\n" + formatted+ "\n````"
}


let main = function(heading,reportsFile){
  let reportJSON = JSON.parse(fs.readFileSync(reportsFile,"utf8"));
  return `# Testing report for ${heading}:\n ${toMarkDown(reportJSON)}`;
}

console.log(main(process.argv[2],process.argv[3]));

const readline = require("readline");


const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function addNumbers(sum, numsLeft, completionCallback) {
  
  reader.question("Whatever number", function (number) {
    console.log(number + "test");
  });  


}

addNumbers(0,1,0);
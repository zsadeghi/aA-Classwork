// function Array(arr) {
//   this.arr = arr;
//   this.length = arr.length;
// }

Array.prototype.uniq = function() {
  let uniq_vals = [];
  for (let i = 0; i < this.length; i++) {
    if (!uniq_vals.includes(this[i])) {  
      uniq_vals.push(this[i]);
    }
  }
  return uniq_vals;
};

// console.log([1,1,1,2,2,3,3,3].uniq());

Array.prototype.twosum = function() {
  let pos = [];
  for (let i = 0; i < this.length-1; i++) {
    for (let j = 1; j < this.length; j++) {
      if (this[i]+this[j]===0) {
        pos.push([i, j]);
      }
    }
  }
  return pos;
};

Array.prototype.transpose = function() {
  let column = this.length; 
  let row = this[0].length;
  transposed = [];
  for (let i=0; i < row; i++) {
    let sub = []; 
    for (let j = 0; j < column; j++) {
      sub.push(this[j][i]); 
    }
    transposed.push(sub);
  }
  return transposed;
};
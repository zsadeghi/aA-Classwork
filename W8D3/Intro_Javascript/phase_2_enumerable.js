Array.prototype.myEach = function(callback) {

  for (let i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};


Array.prototype.myMap = function(callback) {
  let arr = [];
  for (let i = 0; i < this.length; i++) {
    arr.push(callback(this[i]));
  }
  return arr;
};

Array.prototype.myReduce = function(callback, acc) {
  let arr = this;
  if (acc === undefined) {
    acc = arr[0];
    arr.slice(1);
  }
  result = acc; 
  arr.myEach ((result) => result + callback(ele,acc));
  return result;
};

// [1, 2, 3].myReduce(function (acc, el) {
//   return acc + el;
// });
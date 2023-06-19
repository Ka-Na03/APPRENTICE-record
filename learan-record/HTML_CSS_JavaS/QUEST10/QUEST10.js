function hasOdd(numbers) {
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 !== 0) {
      console.log("true");
    } else {
      console.log("false");
    }
}
};
hasOdd([11, 2, 5, 8, 7, 4]);

function odd(numbers) {
  const result = []
  for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 !== 0){
      result.push(numbers[i]);
    }
  }
  console.log(result);
}

odd([11, 2, 5, 8, 7, 4]);

// (3) [11, 5, 7]
//      0: 11
//      1: 5
//      2: 7
//      length: 3


function square(numbers) {
  const result = []
  for (let i = 0; i < numbers.length; i++){
    const squared = numbers[i] ** 2;
    result.push(squared)
  }
  console.log(result)
}

square([2, 3, 4]);
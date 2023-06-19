function checkTemperature(t) {
  if (t >= 30) {
    console.log("Hot");
  } else if (t < 30 && 15 <= t) {
    console.log("Warm");
  } else
    console.log("Cold")
};

checkTemperature(30);

checkTemperature(14);

checkTemperature(15);

function checkOddOrEven(n) {
  if (n % 2 === 0) {
    console.log("Even");
  } else {
    console.log("Odd");
  }
};

checkOddOrEven(4);
checkOddOrEven(11);
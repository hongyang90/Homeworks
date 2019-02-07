//madlib function
function madLib(verb, adjective, noun) {
    console.log(`We shall ${verb} the ${adjective} ${noun}`);
};


// issubstring function

function isSubstring(searchstring, substring) {
    let words = searchstring.split(' ');
    return words.includes(substring);
};

// fizzbuzz function

function fizzbuzz(array) {
    let result = [];
    for (let i = 0; i < array.length; i++) {
        if ((array[i] % 3 === 0 || array[i] % 5 === 0) && !(array[i] % 3 === 0 && array[i] % 5 === 0)) {
            result.push(array[i]);
        }
    }
    return result;
};

// isprime

function isPrime(num) {
   if (num < 2) {
       return false;
   }

    for (let i = 2; i < num; i++) {
        if (num % i === 0) {
            return false;
        }
    }
    return true;
}

// sumofNprimes

function sumOfNPrimes(num) {
    let sum = 0;
    let array = firstNprimes(num);
    for (let i = 0; i < array.length; i++) {
        sum += array[i];
        
    }
    return sum;
}

function firstNprimes(num) {
    let primes = [];
    for (let i = 2; i < primes.length; i++) {
        if (isPrime(i)) {
            primes.push(i);
        }
        
    }
    return primes;
}
// titleize

function titleize(names, callback) {
    let titleized = names.map(name => `Mx. ${name} Jingleheimer Schmidt`);
    callback(titleized);
}

// elephants

function Elephant(name, height, tricks) {
    this.name = name;
    this.height = height;
    this.tricks = tricks;
    function trumpet() {
        console.log(`${this.name} the elephant goes phrrr`);
    }

    function grow( {
        this.height += 12;
    }

    function addTrick(trick) {
        this.tricks.push(trick)
    }

    function play(params) {
        trickIndex = Math.floor(Math.random() * this.tricks.length);
        console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
    }
    // parade helper
    
    function paradeHelper(elephant) {
        console.log(`${elephant.name} is trotting by`);
    }
}

function dinerBreakfast() {
    
}

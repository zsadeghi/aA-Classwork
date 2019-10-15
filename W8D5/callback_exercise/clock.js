class Clock {
  constructor() {
    const date = new Date();
    this.hours = date.getHours();
    this.minutes = date.getMinutes();
    this.seconds = date.getSeconds();
    this.printTime();

    setInterval(this._tick.bind(this), 1000);
  }
  printTime() {
    const print = [this.hours,this.minutes, this.seconds].join(":"); 
    console.log(print);
  }

  _tick() {
    this._addSeconds();
    this.printTime();
  }

  _addSeconds() {
    if (this.seconds + 1 === 60) {
      this.seconds = 0;
      this._addMinutes();
    }
    else {
      this.seconds += 1;
    }
  }

  _addMinutes() {
    if (this.minutes + 1 === 60) {
      this.minutes = 0;
      this.hours += 1;
    }
    else {
      this.minutes += 1;
    }
  }
}

const clock = new Clock();








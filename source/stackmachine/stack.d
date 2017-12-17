module stackmachine.stack;

class Stack {
    ulong[65536] data;
    int head;

    this () {
        this.head = 0;
    }

    int push(ulong x) {
        this.head++;
        this.data[this.head] = x;
        return this.head;
    }

    ulong pop() {
        auto x = this.data[this.head];
        this.head--;
        return x;
    }

    ulong peek() {
        return this.data[this.head];        
    }

    
}
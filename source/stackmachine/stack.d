module stackmachine.stack;

class Stack {
    ulong[256] data;
    ubyte ptr;

    this() {
        this.ptr = 0;
    }

    ubyte push(ulong x) {
        this.ptr++;
        this.data[this.ptr] = x;
        return this.ptr;
    }

    ulong pop() {
        auto x = this.data[this.ptr];
        this.ptr--;
        return x;
    }

    ulong peek() {
        return this.data[this.ptr];        
    }

    
}
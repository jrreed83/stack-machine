module stackmachine.lexer;
import stackmachine.tokens; 

class Lexer {
    string input;
    uint   ptr;

    this (string input) {
        this.input = input;
        this.ptr   = 0;
    }

    bool match(string x) {
        uint n = x.length;
        uint a = this.ptr;
        bool matched = x == this.input[a..a+n];
        if (matched) {
            this.ptr += n;
        }
        return matched; 
    }

    Token nextToken() {
        // Go through until we get the next Token
    }
}


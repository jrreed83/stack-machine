module stackmachine.lexer;
import stackmachine.tokens; 
import std.ascii; 
import std.string;
import std.stdio;

enum State {
    Keyword,
    Constant
}

class Lexer {
    string input;
    uint   curr_pos;
    State  curr_state;

    this (string input) {
        this.input    = input;
        this.curr_pos = 0;
        this.curr_state = State.Keyword;
    }

    char currChar() {
        return this.input[this.curr_pos];
    }

    char look(uint i) {
        return this.input[this.curr_pos+i];
    }

    void consume() {
        this.curr_pos++;
    }

    void reverse() {
        this.curr_pos--;
    }

    Token nextToken() {
        Token tok; 

        auto curr = this.currChar();

        // Skip non-important characters 
        if (isWhite(curr)) {
            int stride = 0;
            do {
                stride++;
            } while (isWhite(this.look(stride)));
            this.curr_pos += stride;            
        }

        curr = this.currChar();
        switch (curr) {      
            case 'a': .. case 'z':
                int stride = 0;
                do {
                    stride++;
                } while (isAlpha(this.look(stride)) && (this.curr_pos + stride) < input.length);

                auto txt = this.input[this.curr_pos .. this.curr_pos + stride];
                tok = Token(txt, Tag.NUMBER);
                this.curr_pos += stride;                
                break;
            case '0': .. case '9':
                int stride = 0;
                do {
                    stride++;
                } while (isDigit(this.look(stride)) && (this.curr_pos + stride) < input.length);

                auto txt = this.input[this.curr_pos .. this.curr_pos + stride];
                tok = Token(txt, Tag.NUMBER);  
                this.curr_pos += stride;                             
                break;            
            default:
                auto txt = " ";
                tok = Token(txt, Tag.NUMBER);              
                break;
        }
        return tok;
    }

}




module stackmachine.lexer;
import stackmachine.tokens; 
import std.ascii; 
import std.string;
import std.stdio;

class Lexer {
    string        input;
    uint          ptr;
    Token[string] keyWords;

    this (string input) {
        this.input = input;
        this.ptr   = 0;

        // Add keywords
        this.keyWords["iconst"] = Token("iconst", Tag.ICONST);
        this.keyWords["iadd"  ] = Token("iadd",   Tag.IADD);
        this.keyWords["isub"  ] = Token("isub",   Tag.ISUB);        
        this.keyWords["print" ] = Token("print",  Tag.PRINT);
        this.keyWords["halt"  ] = Token("halt",   Tag.HALT);
    }

    Token nextToken() {
        Token tok;

        bool found = false;

        if (this.ptr == this.input.length) {
            return Token("", Tag.NIL);
        }   
        while (!found && this.ptr < this.input.length) {
            // Go through until we get the next Token
            char peek = this.input[this.ptr];

            if (isDigit (peek)) {
                tok = numberTok(this.input[this.ptr .. $]);       
                found = true; 
                this.ptr += tok.text.length;
            } else if (isWhite (peek)) {
                this.ptr += 1;
            } else if (isAlpha (peek)) {
                tok = wordToken(this.input[this.ptr .. $], this.keyWords);
                found = true;
                this.ptr += tok.text.length;
            }
        }
        return tok;
    }

}

Token wordToken(string input, Token[string] keyWords) {
    auto stop = 0;
    char peek = input[0];
    while (isAlpha(peek) && stop < input.length) {
        peek = input[stop++];
    }      
    string word = input[0 .. stop-1];

    if (word in keyWords) {
        return keyWords[word];
    } else {
        return Token(word, Tag.WORD);
    }
    
}

Token numberTok(string input) {
    // Extract the number portion of the input string
    auto stop = 0;
    char peek = input[0];
    while (isDigit(peek) && stop < input.length) {
        peek = input[stop++];
    }  
    return Token(input[0 .. stop-1], Tag.NUMBER);    
}


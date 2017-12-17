module stackmachine.lexer;
import stackmachine.tokens; 

struct Lexer {
    string input;
    char peek;
    int ptr;    

}

Lexer startLexer (string input) {
    Lexer l = {input: input, peek: input[0], ptr: 0};
    return l;
}

Token step(ref Lexer l) {
    l.ptr = l.ptr + 1;
    l.peek = l.input[l.ptr];
    Token tok = {value: "3", tag: Tag.NUMBER};
    return tok;
}


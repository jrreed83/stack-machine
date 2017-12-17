module stackmachine.tokens;

enum Tag {
    ICONST,
    IADD, 
    ISUB,
    IMUL,
    FCONST,
    FADD,
    FSUB,
    FMUL,
    HALT,
    PRINT,
    NUMBER,
    WORD,
    NIL,
};

struct Token {
    string text; 
    Tag    tag;  
}



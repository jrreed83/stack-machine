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
    HALT
};

struct Token {
    string text; 
    Tag    tag;   
}

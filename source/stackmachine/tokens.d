module stackmachine.tokens;

enum Tag: string {
    I_ADD   = "iadd", 
    I_SUB   = "isub",
    I_MUL   = "imul",
    F_ADD   = "fadd",
    F_SUB   = "fsub",
    F_MUL   = "fmul",
    I_CONST = "iconst",
    HALT    = "halt",
    NULL    = "null",
    NUMBER  = "number"

};

struct Token {
    string value; 
    Tag    tag;   
}

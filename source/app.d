import std.stdio;
import stackmachine.tokens;
import stackmachine.lexer;
import stackmachine.stack;

enum Code: ulong {
    I_ADD   = 0, 
    I_SUB   = 1,
    I_MUL   = 2,
    F_ADD   = 3,
    F_SUB   = 4,
    F_MUL   = 5,
    I_CONST = 6,
    HALT    = 7,
    NULL    = 8,
    NUMBER  = 9,
	NO_OP   = 10,
};

void execute(Stack stack, ulong[] code) {
	int ip = 0;
	bool run = true;
	while (run) {

		ulong x = code[ip];

		switch (x) {
			case Code.NO_OP:
				ip++;
				writeln("NO_OP");
				break;
			case Code.I_CONST:
				ip++;
				stack.push(code[ip]);
				break;
			case Code.HALT:
				writeln("HALT");
				run = false;
				break;
			default:
				run = false;
				break;
			
		}
	}	
}

void main()
{

	Stack s = new Stack();
	ulong[] i = [Code.NO_OP,Code.NO_OP,Code.HALT];

	execute(s, i);

//	s.push(3);
//	s.push(8);
//	auto x = s.pop();
//	auto y = s.pop();
//	auto z = x + y;	
  //  s.push(z);

//	writeln(s.data);
	Lexer l = startLexer("Hello");
	writeln(l);
	writeln(step(l));
	writeln(l);
}

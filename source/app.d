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
	PRINT   = 9,
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
				writeln("CONST");				
				stack.push(code[ip]);
				ip++;
				break;
			case Code.I_ADD:
				auto a = stack.pop();
				auto b = stack.pop();
				auto c = a + b;
				stack.push(c);
				ip++;
				break;
			case Code.HALT:
				ip++;
				writeln("HALT");
				run = false;
				break;
			case Code.PRINT:
				ip++;
				writeln(stack.peek());
				break;
			default:
				writeln("OH NO");
				run = false;
				break;
			
		}
	}	
}

void main()
{

	Stack s = new Stack();
	ulong[] i = [
		cast(ulong) Code.NO_OP, 
		cast(ulong) Code.NO_OP,
		cast(ulong) Code.I_CONST,
		10,
		cast(ulong) Code.I_CONST,
		20,
		cast(ulong) Code.I_ADD,
		cast(ulong) Code.PRINT,
		cast(ulong) Code.HALT];

	execute(s, i);

}

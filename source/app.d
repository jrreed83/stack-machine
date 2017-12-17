import std.stdio;
import stackmachine.tokens;
import stackmachine.lexer;
import stackmachine.stack;
import std.ascii; 

enum Code: ubyte {
    IADD    = 0, 
    ISUB    = 1,
    IMUL    = 2,
	ICONST  = 3,
	ICONST0 = 4,
	ICONST1 = 5,
	ICONST2 = 6,
    FADD    = 7,
    FSUB    = 8,
    FMUL    = 9,
	FCONST  = 10,
	SCONST  = 11,
    HALT    = 12,
    NULL    = 13,
	PRINT   = 14,
	NO_OP   = 15,
};


void execute(Stack stack, ubyte[] code) {
	int ip = 0;
	bool run = true;
	
	auto byte_code = code[ip];

	while (ip < code.length && byte_code != Code.HALT) {
		ip += 1;
		switch (byte_code) {
			case Code.NO_OP:
				break;
			case Code.ICONST:
				ulong x = (code[ip] << 24) | (code[ip+1] << 16) | (code [ip+2] << 8) | code[ip+3];				
				stack.push(x);
				ip += 4;
				break;
			case Code.ICONST0:			
				stack.push(0);
				break;	
			case Code.ICONST1:			
				stack.push(1);
				break;	
			case Code.ICONST2:			
				stack.push(2);
				break;												
			case Code.IADD:
				auto a = stack.pop();
				auto b = stack.pop();
				auto c = a + b;
				stack.push(c);
				break;
			case Code.IMUL:
				auto a = stack.pop();
				auto b = stack.pop();
				auto c = a * b;
				stack.push(c);
				break;				
			case Code.PRINT:
				writeln(stack.peek());
				break;
			default:
				break;
		}
		// Get next byte code
		byte_code = code[ip];
	}	
}

void main()
{

	Stack s = new Stack();
	ubyte[] i = [
		cast(ubyte) Code.ICONST2,
		cast(ubyte) Code.ICONST2,
		cast(ubyte) Code.IADD,
		cast(ubyte) Code.PRINT,
		cast(ubyte) Code.HALT];

	execute(s, i);


	Lexer lex = new Lexer("iconst 43 \n iconst 40 \n iadd \n print ");
	writeln(lex.nextToken());
	writeln(lex.nextToken());
	writeln(lex.nextToken());
	writeln(lex.nextToken());
	writeln(lex.nextToken());
	writeln(lex.nextToken());
	writeln(lex.nextToken());
	writeln(lex.nextToken());	

}

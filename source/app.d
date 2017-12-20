import std.stdio;
import stackmachine.tokens;
import stackmachine.lexer;
import stackmachine.stack;
import std.ascii; 

enum OpCode: ubyte {
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

	while (ip < code.length && byte_code != OpCode.HALT) {
		ip += 1;
		switch (byte_code) {
			case OpCode.NO_OP:
				break;
			case OpCode.ICONST:
				ulong x = (code[ip] << 24) | (code[ip+1] << 16) | (code [ip+2] << 8) | code[ip+3];				
				stack.push(x);
				ip += 4;
				break;
			case OpCode.ICONST0:			
				stack.push(0);
				break;	
			case OpCode.ICONST1:			
				stack.push(1);
				break;	
			case OpCode.ICONST2:			
				stack.push(2);
				break;												
			case OpCode.IADD:
				auto a = stack.pop();
				auto b = stack.pop();
				auto c = a + b;
				stack.push(c);
				break;
			case OpCode.IMUL:
				auto a = stack.pop();
				auto b = stack.pop();
				auto c = a * b;
				stack.push(c);
				break;				
			case OpCode.PRINT:
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
		cast(ubyte) OpCode.ICONST2,
		cast(ubyte) OpCode.ICONST2,
		cast(ubyte) OpCode.IADD,
		cast(ubyte) OpCode.PRINT,
		cast(ubyte) OpCode.HALT];

	execute(s, i);


	string line ="iconst          64467;"; 
	Lexer lex = new Lexer(line);
	writeln(lex.nextToken());
	writeln(lex.nextToken());

}

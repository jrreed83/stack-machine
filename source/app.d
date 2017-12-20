import std.stdio;
import stackmachine.tokens;
//import stackmachine.lexer;
import stackmachine.cpu;
import std.ascii; 

void main()
{
	ubyte[] instructions = [
		cast(ubyte) OpCode.ICONST2,
		cast(ubyte) OpCode.ICONST2,
		cast(ubyte) OpCode.IADD,
		cast(ubyte) OpCode.ICONST1,
		cast(ubyte) OpCode.IADD,		 
		cast(ubyte) OpCode.PRINT,
		cast(ubyte) OpCode.HALT];

	CPU cpu = new CPU();
	cpu.execute(instructions);



//	string line ="iconst 64467\n"; 
//	Lexer lex = new Lexer(line);
//	writeln(lex.nextToken());
//	writeln(lex.nextToken());
//	writeln(lex.nextToken());	

}

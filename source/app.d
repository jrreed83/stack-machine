import std.stdio;
import stackmachine.tokens;
import stackmachine.lexer;
import stackmachine.stack;

void main()
{

	Stack s = new Stack();

	s.push(3);
	s.push(8);

	writeln(s.pop());
	writeln(s.pop());
	Lexer l = startLexer("Hello");
	writeln(l);
	writeln(step(l));
	writeln(l);
}

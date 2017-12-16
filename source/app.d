import std.stdio;
import stackmachine.tokens;

void main()
{
	Token t = Token.I_ADD;
	writeln("Let's try it out ", t, 0x55 << 1);
}

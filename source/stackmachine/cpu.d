module stackmachine.cpu;
import stackmachine.stack;
import std.ascii; 
import std.stdio;

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

class CPU {

    Stack opStack;
    int   ip;

    this() {
        this.opStack = new Stack();
        this.ip      = 0;
    }
    
    void execute(ubyte[] code) {
        bool  run    = true;
	    ubyte opcode = code[0];

	    while (this.ip < code.length && opcode != OpCode.HALT) {
		    this.ip += 1;
		    switch (opcode) {
			    case OpCode.NO_OP:
				    break;
			    case OpCode.ICONST:
				    ulong x = (code[this.ip  ] << 24) | 
                              (code[this.ip+1] << 16) | 
                              (code[this.ip+2] << 8 ) | 
                              (code[this.ip+3] << 0 ) ;				
				    this.opStack.push(x);
				    this.ip += 4;
				    break;
			    case OpCode.ICONST0:			
				    this.opStack.push(0);
				    break;	
			    case OpCode.ICONST1:			
				    this.opStack.push(1);
				    break;	
			    case OpCode.ICONST2:			
				    this.opStack.push(2);
				    break;												
			    case OpCode.IADD:
				    this.opStack.push(this.opStack.pop()+this.opStack.pop());
				    break;
			    case OpCode.IMUL:
				    this.opStack.push(this.opStack.pop()*this.opStack.pop());
				    break;		
			    case OpCode.ISUB:
				    this.opStack.push(this.opStack.pop()-this.opStack.pop());
				    break;						
			    case OpCode.PRINT:
				    writeln(this.opStack.pop());
				    break;
			    default:
				    break;
		    }
		    // Get next byte code
		    opcode = code[this.ip];
	    }	
    }
}

void execute(CPU cpu, ubyte[] code) {
	int ip = 0;
	
    
}
module stackmachine.lexer;
import stackmachine.tokens; 
import std.ascii; 
import std.string;
import std.stdio;

// enum State {
//     Keyword,
//     Constant
// }

// class Lexer {
//     string input;
//     uint   curr_pos;
//     State  curr_state;

//     this (string input) {
//         this.input    = input;
//         this.curr_pos = 0;
//         this.curr_state = State.Keyword;
//     }

//     char currChar() {
//         return this.input[this.curr_pos];
//     }

//     char look(uint i) {
//         return this.input[this.curr_pos+i];
//     }

//     void consume() {
//         this.curr_pos++;
//     }

//     void reverse() {
//         this.curr_pos--;
//     }

//     Token nextToken() {

//         int idx = this.curr_pos;
//         while (idx < this.input.length) {
//             char curr_char = this.input[idx];
//             if (isWhite(curr_char)) {
//                 idx++;
//             } else {
//                 break;
//             }
//         }
//         this.curr_pos = idx;
//         if (this.curr_pos == this.input.length) {
//             Token tok = {text:"EOL", tag: Tag.EOL};
//         } else {

//             auto curr = this.currChar();
//             switch (curr) {      
//                 case 'a': .. case 'z':
//                     int stride = 0;
//                     do {
//                         stride++;
//                     } while (isAlpha(this.look(stride)));

//                     auto txt = this.input[this.curr_pos .. this.curr_pos + stride];
//                     Token tok = {text:txt, tag:Tag.NUMBER};
//                     this.curr_pos += stride;                
//                     break;
//                 case '0': .. case '9':
//                     int stride = 0;
//                     do {
//                         stride++;
//                     } while (isDigit(this.look(stride)));

//                     auto txt = this.input[this.curr_pos .. this.curr_pos + stride];
//                     Token tok = {text:txt, tag:Tag.NUMBER};  
//                     this.curr_pos += stride;                             
//                     break;            
//                 default:
//                     auto txt = " ";
//                     Token tok = {text:txt, tag:Tag.NUMBER};             
//                     break;
//             }
//         }
//         return tok;
//     }

// }




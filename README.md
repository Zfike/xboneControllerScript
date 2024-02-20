Here is my esoteric language

Here's the rules:
| Instruction  | Function of Instruction |
| ------------- | ------------- |
| A BUTTON  | Push 0 onto the stack  |
| X BUTTON 	|	Duplicate the top value of the stack |
| RIGHT TRIGGER |	Add 1 to the top value of the stack |
| LEFT TRIGGER | Pops A and then B from the stack and pushes B - A to the stack |
| Y BUTTON	|	Takes one character of input and pushes it's ascii code to the stack |
| RIGHT BUMPER | Pop the top value of the stack and print it as an ascii character |
| LEFT BUMPER	|	Pop the top value of the stack and print it as an integer |
| DPAD UP n	|	Pop the top of the stack. If it is zero, jump to the nth line |
| B BUTTON	|	Pop the top of the stack and push it to the bottom |
| DPAD DOWN	|	Remove the bottom value of the stack and push it to the top |
| START BUTTON | Terminate program execution and prints buffer to screen |
| DPAD LEFT  | Cheats and takes an input string and reverses it (no stack) |
| TURBO BUTTON  |  Pops A and then B from the stack and pushes B * A to the stack |


Now my repeater.xbos does not work entirely right (probably due to my quickly depleting brain power). <br>
To test it I inputed the character '/' and then 3 for the count <br>
I have proof that the correct count was used: <br>
![Code_6rcYtZpxoJ](https://github.com/Zfike/xboneControllerScript/assets/97480418/b104aca7-e1ec-4aaf-9fa4-5f2b1507e818) <br>
<br>
Love, Zane

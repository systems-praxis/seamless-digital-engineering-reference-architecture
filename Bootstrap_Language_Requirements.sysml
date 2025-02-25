package Bootstrap_Language_Requirements {
	doc /*
		 * Computer programming language specifications that are only used for bootstrapping to higher-level
		 * and more useful computer programming languages
		 */
		 
	private import SDE_Profile::*;
	private import 'Model-Based_Structured_Requirement'::*;
	private import DE_Stakeholders::*;
	
	//////////
	#'requirement set' requirement POWER9_ISA {
		doc /* The OpenPower POWER9 instruction set architecture. */
	}
	
	#'requirement set' requirement Hex0_Monitor_Language {
		doc /*
		 	 * Hexadecimal values of machine instructions encoded in ASCII (0-9 and a-f). Whitespace is not meaningful.
		 	 * 
	    		 * It provides two functions:
	    		 * - It assembles hex0 programs manually typed in
	    		 * - It writes the characters, providing minimal text input functionality.
		 	 */
		
		#'requirement expression' requirement <'HEX0M.1'> 'Human-Auditable' {
			doc /* The Translator shall be less than 500 bytes as implemented. */
			rationale = "If the binary is less than 500 bytes, it is reasonably human-auditable, but the smaller the better.";
		}
	}
	
	#'requirement set' requirement Hex0_Language {
		doc /* Extends Hex0_Monitor_Language to include ; and # line comments. */
	}
	
	dependency Hex0_Language to Hex0_Monitor_Language;
	
	#'requirement set' requirement Hex1_Language {
		doc /* Hex1 extends Hex0 functionality to support single-character labels (starting with :) and relative displacements using a prefix (@). */
	}
	
	dependency Hex1_Language to Hex0_Language;
	
	#'requirement set' requirement Hex2_Language {
		doc /*
			 * Extends Hex1 to support long labels, absolute addressing, and alternative pointer sizes.
			 * 
			 * It may optionally support !label (8-bit relative addressing) and ?label (architecture-specific size/properties)
			 * and/or @label1>label2 %label1>label2 displacements should the specific ISA require it for human-readable hex2 source files
			 */
	}
	
	dependency Hex2_Language to Hex1_Language;
	
	#'requirement set' requirement M0_Language {
		doc /*
			 * "M0 or M0-macro or M1-macro is the minimal string replacement program with string processing functionality required
			 *  to convert an Assembly like syntax into Hex2 programs that can be compiled. Its rules are merely an extension of Hex2
			 *  with the goal of reducing the amount of hex that one would need to write.
			 * 
			 * 	The 3 essential pieces are:
			 * 
			 *     DEFINE STRING1 HEX_CHARACTERS (No extra whitespace nor \t or \n inside definition)
			 * 
			 *     “Raw strings” allow every character except ” as there is no support for string escapes, including NULL;
			 *     which are converted to Hex chars for Hex2 To convert back to the chars inside of the “quotes” with the addition
			 *     of a trailing NULL character or the number desired (Must be at least 1, no upper bound) and restrictions such as
			 *     padding to word boundaries are acceptable.
			 * 
			 *     ‘Raw char strings’ will be passing anything inside of them (except ’ which terminates the string).
			 * 
			 *  Thus by combining :label, @label, DEFINE SYSCALL 0F05, Raw strings and chars; one has created a rather flexible
			 *  and powerful Assembler capable of building far more ambitious pieces in “Macro Assembly”."
			 * 
			 * - https://github.com/oriansj/stage0/blob/master/README.org
			 */
	}
	
	#'requirement set' requirement WebAssembly_Language {
		doc /* A formally-specified stack programming language, portable binary-code format, and corresponding text format for executable programs. */
		comment /* See https://webassembly.org/ */
	}
	
	#'requirement set' requirement preForth_Language {
		doc /*
			 * "preForth feels like Forth - it's mainly a sublanguage of ANS-Forth - but is significantly reduced in its capabilities.
			 * 
			 * Features: minimal control structures, no immediate words, strings on stack, few primitives
			 * 
			 * just
			 * 	 - Stack
			 *   - Returnstack
			 *   - Only ?exit and recursion as control structures
			 *   - :-definitions
			 *   - optional tail call optimization
			 *   - IO via KEY/EMIT
			 *   - signed single cell decimal numbers (0-9)+
			 *   - character constants via 'c'-notation
			 *   - output single cell decimal numbers
			 * 
			 * and
			 * 
			 *   - no immediate words, i.e.
			 *   - no control structures IF ELSE THEN BEGIN WHILE REPEAT UNTIL
			 *   - no defining words
			 *   - no DOES>
			 *   - no memory @ ! CMOVE ALLOT ,
			 *   - no pictured numeric output
			 *   - no input stream
			 *   - no state
			 *   - no base
			 *   - no dictionary, no EXECUTE, not EVALUATE
			 *   - no CATCH and THROW
			 *   - no error handling
			 *
			 * Prerequisites:
			 *   Just 13 primitives: emit key dup swap drop 0< ?exit >r r> - nest unnest lit
			 * "
			 * 
			 * - https://github.com/uho/preforth
			 */
	}
	
	#'requirement set' requirement seedForth_Language {
		doc /*
		 	 * "seedForth is an extended system with random access memory, control structures, compiling and defining words.
		 	 *  Its kernel the so called seedForth bed is built using preForth. Seed Forth bed has about 30 primitives as well as a compiler and interpreter.
		 	 * 
		 	 * seedForth accepts source code in tokenized source code form (.seed files). the seedForth tokenizer reads text source code (.seedsource files) and converts them to token form.
		 	 * 
		 	 * You can create applications by writing the appropriate seedForth text source code, tokenize it using the tokenizer (make xxx.seed)
		 	 * and then feed the token source code into the seedForth bet (cat xxx.seed | ./seedForth) in order to let the application grow.
		 	 * 
		 	 * One of these applications is seedForth/interactive."
		 	 * 
		 	 * - https://github.com/uho/preforth
		 	 */
	}
	
	dependency seedForth_Language to preForth_Language;
	
	#'requirement set' requirement seedForth_Interactive_Language {
		doc /*
		 	 * "seedForth/interactive extends seedForth to become a full featured interactive Forth system.
		 	 *  For this it defines a searchable dictionary of (text based) headers and a text based interpreter and compiler.
		 	 * On startup seedForth/interactive accepts Forth source code in text form."
		 	 * 
		 	 * - https://github.com/uho/preforth
		 	 */
	}
	
	dependency seedForth_Interactive_Language to seedForth_Language;
	
	#'requirement set' requirement ANS_Forth_Language {
		doc /* The ANS Forth stack programming language, standardized by ANSI in 1994, specified by the standard X3.215-1994. */
		comment /* https://www.taygeta.com/forth/dpans.html */
	}
	
	#'requirement set' requirement Kernel_LISP_Language {
		doc /*
		 	 * A Scheme-like functional programming language with basic LISP syntax, but which
		 	 * lacks a macro facility in favor of explicit evaluation, based on the vau calculus by John Shutt.
			 * 
			 * Specified in the Kernel Revised Report @ https://web.cs.wpi.edu/~jshutt/kernel.html
			 */
	}
	
	#'requirement set' requirement Milawa_FOL_Theorem_Prover {
		doc /* The self-verifying FOL theorem prover, Milawa. See: https://doi.org/10.1007/978-3-642-22863-6_20 */
	}
	
	dependency Milawa_FOL_Theorem_Prover to Kernel_LISP_Language;
	
	#'requirement set' requirement microKanren {
		doc /* The minimized constraint logic solver */
	}
	
	#'requirement set' requirement miniKanren {
		doc /* The constraint logic solver */
	}
	
	dependency miniKanren to microKanren;
	
	#'requirement set' requirement egglog {
		doc /* The fixpoint reasoning system that unifies Datalog and equality saturation (EqSat). See: https://doi.org/10.1145/3591239 */
	}
	
	#'requirement set' requirement Cubical_Type_Theory {
		doc /* A dependent type theory based on MLTT, actualized by Cubical Agda. See: https://doi.org/10.1017/S0956796821000034  */
	}
	
	#'requirement set' requirement 'Gradually-Typed Vau Calculi' {
		doc /* A theoretical formalization of vau calculus with gradual typing. See John Shutt's dissertation, "Fexprs as the basis of Lisp function application or $ vau: the ultimate abstraction" (https://digital.wpi.edu/concern/etds/ht24wj541?locale=en) and (e.g.) https://doi.org/10.1145/2914770.2837670 and https://doi.org/10.1007/978-3-540-73589-2_2 */
	}
	
	#'requirement set' requirement Ada83 {
		doc /* The original revised Ada programming language published in 1983 as MIL-STD-1815A (ISO/IEC 8652:1987). */
	}
	
	#'requirement set' requirement Ada95 {
		doc /* The Ada programming language, 1995 revision (ISO/IEC 8652:1995) */
	}
	
	dependency from Ada95 to Ada83;
	
	#'requirement set' requirement Ada2005 {
		doc /* The Ada programming language, 2005 revision (ISO/IEC 8652:1995/Amd 1:2007) */
	}
	
	dependency from Ada2005 to Ada95;
	
	#'requirement set' requirement Ada2012 {
		doc /* The Ada programming language, 2012 revision (ISO/IEC 8652:2012) */
	}
	
	dependency from Ada2012 to Ada2005;
	
	#'requirement set' requirement Ada2022 {
		doc /* The Ada programming language, 2022 revision (ISO/IEC 8652:2023) */
	}
	
	dependency from Ada2022 to Ada2012;
	
	#'requirement set' requirement SPARK2014 {
		doc /* SPARK, the formally-defined computer programming language based on Ada 2012. See: https://docs.adacore.com/spark2014-docs/html/lrm/ */
	}
	
	dependency from SPARK2014 to Ada2012;
}
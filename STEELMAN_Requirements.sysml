package STEELMAN_Requirements {
	doc /*
		 * The famous STEELMAN requirements for a high-level programming language targeting
		 * embedded computer systems, converted to SysML v2 requirement expressions/sets
		 */
	
	private import SDE_Profile::*;
	private import SDE_Parts::CL;
	private import SDE_Parts::Translator;

	abstract part def <HLL> 'High-Level Language' specializes CL {
		doc /* Generic high-level programming language. */
		comment /*
				 * It is meaningless to implement a language without implementing a Translator. 
				 * Therefore this part exists for now to serve as the subject of the STEELMAN requirements.
				 */
	}
	part def <'HLL-T'> 'High-Level Language Translator' specializes Translator {
		doc /* The HLL translator translates the high-level language source code down to machine code to be executed. */
		comment /* It's a compiler. */
	}
	
	comment about 'SKR-STEELMAN'
		/*
		 * The "technical requirements" that were published in the June 1978 report by the US Department of Defense (DoD),
		 * "Requirements for High Order Computer Programming Languages 'STEELMAN'" are stakeholder requirements that will
		 * be transformed into a corresponding nested requirement set containing well-formed system requirement expressions
		 * traced to original statements from the report.
		 */
	
    	comment about 'SKR-STEELMAN'
    		/*
    		 * The STEELMAN Requirements specify an agreed-upon "set of constraints on the design of [programming] languages
    		 * that are appropriate for embedded computer applications" whose primary stakeholder was the US DoD.
    		 */
	
	comment /* TODO: Move goals to other set. */
	    		
    #'requirement set' requirement def
    <'SKR-STEELMAN'> 'STEELMAN Requirements' {
	    	doc /* The High-Order_Programming_Language shall target Embedded_Computer_Systems. */
	    	
	    	type = 'Model-Based_Structured_Requirement'::RequirementType::Stakeholder;
	    	
	    	#'requirement set' requirement def <'SKR-STEELMAN-1GDC'> 'STEELMAN: General Design Criteria' {
	    		doc /* The Language shall meet the STEELMAN General Design Criteria. */
	    		subject HLL;
	    		
	    		#'requirement expression' requirement def <'SKR-STEELMAN-1GDC.1A'> 'Generality' {
	    			doc /* The Language shall provide generality only to the extent necessary to satisfy the needs of embedded computer applications. */
	    			subject HLL;
	    			source = "STEELMAN";
	    			comment /*
			    			 * Such applications involve real time control, self diagnostics, input-output to nonstandard peripheral devices,
			    			 * parallel processing, numeric computation, and file processing.
			    			 */
	    		}
	    		
	    		#MGO_goal requirement def <'SKR-STEELMAN-1GDC.1B.G1'> 'Reliability Goal' {
	    			doc /* The Language should aid the design and development of reliable programs. */
	    			subject HLL;
	    			source = "STEELMAN";
	    		}
	    		#'requirement expression' requirement def <'SKR-STEELMAN-1GDC.1B.R1'> 'Detect Errors' {
	    			doc /* The Language shall be designed to avoid error prone features and to maximize automatic detection of programming errors. */
	    			subject HLL;
	    			source = "STEELMAN";
	    		}
	    		#'requirement expression' requirement def <'SKR-STEELMAN-1GDC.1B.R2'> 'Redundant Specification' {
	    			doc /* The Language shall require some redundant, but not duplicative, specifications in programs. */
	    			subject HLL;
	    			source = "STEELMAN";
	    		}
	    		#'requirement expression' requirement def <'SKR-STEELMAN-1GDC.1B.R3'> 'Explanatory Diagnostics' {
	    			doc /* The Translator shall produce explanatory diagnostic and warning messages, but shall not attempt to correct programming errors. */
	    			subject 'HLL-T';
	    			source = "STEELMAN";
	    		}
	    		
	    		#MGO_goal requirement def <'SKR-STEELMAN-1GDC.1C.G1'> 'Maintainability Goal' {
	    			doc /* The Language should promote ease of program maintenance. */
	    			subject HLL;
	    			source = "STEELMAN";
	    		}
	    		#MGO_goal requirement def <'SKR-STEELMAN-1GDC.1C.G2'> 'Readability Goal' {
	    			doc /* The Language should emphasize program readability (i.e., clarity, understandability, and modifiability of programs). */
	    			subject HLL;
	    			source = "STEELMAN";
	    		}
	    		#MGO_goal requirement def <'SKR-STEELMAN-1GDC.1C.G3'> 'User Documentation Goal' {
	    			doc /* The Language should encourage user documentation of programs. */
	    			subject HLL;
	    			source = "STEELMAN";
	    		}
	    		#'requirement expression' requirement def <'SKR-STEELMAN-1GDC.1C.R1'> 'Explicit Specification' {
	    			doc /*
	    			 	 * The Language shall require explicit specification of programmer decisions and
	    			 	 * shall provide defaults only for instances where the default is stated in the language definition,
	    			 	 * is always meaningful, reflects the most frequent usage in programs, and may be explicitly overridden.
	    			 	 */
	    			subject HLL;
	    			source = "STEELMAN";
	    		}
	    		
	    		#MGO_goal requirement def <'SKR-STEELMAN-1GDC.1D.G1'> 'Efficiency Goal' {
	    			doc /* The Language design should aid the production of efficient object programs. */
	    			subject HLL;
	    			source = "STEELMAN";
	    		}
	    		comment /* TODO: (1D. Efficiency.) Constructs that have unexpectedly expensive implementations
			    		 * should be easily recognizable by translators and by users. Features should
			    		 * be chosen to have a simple and efficient implementation in many object
			    		 * machines, to avoid execution costs for available generality where it is not
			    		 * needed, to maximize the number of safe optimizations available to
			    		 * translators, and to ensure that unused and constant portions of programs
			    		 * will not add to execution costs. Execution time support packages of the
			    		 * language shall not be included in object code unless they are called.
			    		 */
			    		 

			comment /* TODO: (1E. Simplicity.) The language should not contain unnecessary complexity.
			 		 * It should have a consistent semantic structure that minimizes the number of
			 		 * underlying concepts. It should be as small as possible consistent with the
			 		 * needs of the intended applications. It should have few special cases and
			 		 * should be composed from features that are individually simple in their
			 		 * semantics. The language should have uniform syntactic conventions and should
			 		 * not provide several notations for the same concept. No arbitrary restriction
			 		 * should be imposed on a language feature.
			 		 */
			
			comment /* TODO: (1F. Implementability.) The language shall be composed from features that are
			 		 * understood and can be implemented. The semantics of each feature should be
			 		 * sufficiently well specified and understandable that it will be possible to
			 		 * predict its interaction with other features. To the extent that it does not
			 		 * interfere with other requirements, the language shall facilitate the
			 		 * production of translators that are easy to implement and are efficient
			 		 * during translation. There shall be no language restrictions that are not
			 		 * enforceable by translators.
			 		 */
			
			comment /* TODO: (1G. Machine Independence.) The design of the language should strive for
			 		 * machine independence. It shall not dictate the characteristics of object
			 		 * machines or operating systems except to the extent that such characteristics
			 		 * are implied by the semantics of control structures and built-in operations.
			 		 * It shall attempt to avoid features whose semantics depend on characteristics
			 		 * of the object machine or of the object machine operating system.
			 		 * Nevertheless, there shall be a facility for defining those portions of
			 		 * programs that are dependent on the object machine configuration and for
			 		 * conditionally compiling programs depending on the actual configuration.
			 		 */
			
			comment /* TODO: (1H. Complete Definition.) The language shall be completely and unambiguously defined.
			 		 * To the extent that a formal definition assists in achieving the
					 * above goals (i.e., all of section 1), the language shall be formally defined. */
	    	}
	    	#'requirement set' requirement def <'SKR-STEELMAN-2SYNTX'> 'STEELMAN: General Syntax';
	    	#'requirement set' requirement def <'SKR-STEELMAN-3TYP'> 'STEELMAN: Types';
	    	#'requirement set' requirement def <'SKR-STEELMAN-4EXP'> 'STEELMAN: Expressions';
	    	#'requirement set' requirement def <'SKR-STEELMAN-5CVS'> 'STEELMAN: Constants, Variables, and Scopes';
	    	#'requirement set' requirement def <'SKR-STEELMAN-6CCS'> 'STEELMAN: Classical Control Structures';
	    	#'requirement set' requirement def <'SKR-STEELMAN-7FP'> 'STEELMAN: Functions and Procedures';
	    	#'requirement set' requirement def <'SKR-STEELMAN-8IOFCC'> 'STEELMAN Input-Output, Formatting and Configuration Control';
	    	#'requirement set' requirement def <'SKR-STEELMAN-9PP'> 'STEELMAN: Parallel Processing';
	    	#'requirement set' requirement def <'SKR-STEELMAN-10EH'> 'STEELMAN: Exception Handling';
	    	#'requirement set' requirement def <'SKR-STEELMAN-11ROTTF'> 'STEELMAN: Representation and Other Translation Time Facilities';
	    	#'requirement set' requirement def <'SKR-STEELMAN-12TLF'> 'STEELMAN: Translation and Library Facilities';
	    	#'requirement set' requirement def <'SKR-STEELMAN-13LS'> 'STEELMAN: Language Support';
    }
}
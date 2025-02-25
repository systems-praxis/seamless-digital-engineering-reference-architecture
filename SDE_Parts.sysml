package SDE_Parts {
	doc /* The parts that comprise a Seamless Digital Engineering Appliance */
	
    private import SDE_Profile::*;
	private import SDE_Requirements::*;
	private import Bootstrap_Language_Requirements::*;
    private import 'SDE Meta-Language Specification'::**;
    private import DE_Solutions_Space;
    
    ////
    
    part def <HW> 'Computing Hardware';
    part def <FW> 'Computing Firmware';
    part def <SW> 'Computing Software';
    abstract part def <CL> 'Computing Language';
    part def <VM> 'Virtual Machine';
    abstract part def <DSL> 'Domain-Specific Language';
    
    part def Computer specializes HW {
    		doc /* A generic computer system based on a CPU architecture. */
    }
    part def ASIC specializes HW {
    		doc /* Application-Specific Integrated Circuit */
    }
    part def FPGA specializes HW {
    		doc /* Field-Programmable Gate Array */
    }
    part def GPU specializes ASIC {
    		doc /* Graphics Processing Unit */
    }
    part def CPU specializes ASIC {
    		doc /* Central Processing Unit */
    }
    part def NPU specializes ASIC {
    		doc /* Neural Processing Unit (Artificial Intelligence Accelerator) */
    }
    part def SAT_Solver specializes ASIC {
    		doc /* Boolean satisfiability problem solver, taking inputs in Conjunctive Normal Form (CNF) */
    }
    part def SMT_Solver specializes SAT_Solver {
    		doc /* Satisfiability Modulo Theories solver, which extends an SAT solver with additional mathematical theories that it can support, such as integers. */
    }
    part def Interaction_Nets_ASIC specializes ASIC {
    		doc /* ASIC which performs computations using Interaction Nets */
    }
    
    part def <SW_Library> 'Software Library' {
    		doc /* Software functionality designed to be usable by other software */
    }
    part def Translator specializes SW {
    		doc /* Specializes software that translates strictly-formatted input into output conforming to a lower-level language such as the machine code. */
    }
    part def Interpreter specializes Translator {
    		doc /* A Translator that executes the programming code input directly or does an amount of translation before executing the output. */
    }
    part def Proof_Assistant specializes SW {
    		doc /*
	    		 * A proof assistant or interactive theorem prover is a software tool to assist with the development of formal proofs by human-machine collaboration.
	    		 * 
	    		 * See: https://en.wikipedia.org/wiki/Proof_assistant
	    		 */
    }
    
    package Bootstrap1 {
    		doc /* Specification of a trustworthy full-source bootstrap path to a Seamless DE Appliance. */
    		
    		package Stage0 {
    			doc /*
	    			 * "The stage0 is the ultimate lowest level of bootstrap that is useful for systems without
	    			 * firmware, operating systems nor any other provided software functionality. Those
	    			 * with such capabilities can skip this stage as it requires human input."
	    			 * 
	    			 * - https://github.com/oriansj/stage0/blob/master/README.org
	    			 */
    			
		    part def POWER9_PC specializes Computer {
		    		doc /*
			    		 * A Computer using the OpenPower POWER9 instruction set architecture, which provides
			    		 * open-source firmware, therefore increasing its trustworthiness factor.
			    		 */
			    
			    satisfy Bootstrap_Language_Requirements::POWER9_ISA;
		    }
		    
		    part def Hex0_Monitor specializes Translator {
		    		doc /*
			    		 * The most minimal software to run in Ring 0, the human-auditable hex seed implemented in raw machine code,
			    		 * whose function is to translate hexadecimal data encoding machine instructions typed in ASCII to machine code.
			    		 */
			    	
			    satisfy Bootstrap_Language_Requirements::Hex0_Monitor_Language;
		    }
		    
		    dependency stage0 from Hex0_Monitor to POWER9_PC;
	    }
	    
	    package Stage1 {
	    		doc /*
	    		 	 * "The stage1 is dependent on the availability of text source files and at least a hex0 monitor or assembler.
	    		 	 *  The steps in this stage can be fully automated should one trust their automation or performed manually on any hardware they trust.
	    		 	 * 
	    		 	 *  Regardless of which method selected, the resulting binaries MUST be identical."
	    			 * 
	    			 * - https://github.com/oriansj/stage0/blob/master/README.org
	    		 	 */
	    		
		    part def Hex0 specializes Translator {
		    		doc /* Assembler which generates machine-executable binaries from hex0 source files. */
			    	
			    satisfy Bootstrap_Language_Requirements::Hex0_Language;
		    }
		    
		    dependency 'stage1.1' from Hex0 to Stage0::Hex0_Monitor;
		    
		    part def Hex1 specializes Translator {
		    		satisfy Bootstrap_Language_Requirements::Hex1_Language;
		    }
		    
		    dependency 'stage1.2' from Hex1 to Hex0;
		    
		    part def Hex2 specializes Translator {
		    		satisfy Bootstrap_Language_Requirements::Hex2_Language;
		    }
		    
		    dependency 'stage1.3' from Hex2 to Hex1;
		    
		    part def M0 specializes Translator {
		    		satisfy Bootstrap_Language_Requirements::M0_Language;
		    }
		    
		    dependency 'stage1.4' from M0 to Hex2;
	    }
	    
	    package Stage2 {
	    		doc /*
		    		 * "The stage2 is dependent on the availability of text source files and at least a functional
		    		 *  macro assembler and can be used to build operating systems or other “Bootstrap”
		    		 *  functionality that might be required to enable functional binaries; such as programs that set
		    		 *  execute bits or generate dwarf stubs."
		    		 * 
		    		 * - https://github.com/oriansj/stage0/blob/master/README.org
		    		 */
		    		 
		    part def preForth specializes Interpreter {
		    		doc /*
			    		 * "preForth is a minimal non-interactive Forth kernel that can bootstrap itself and can be used as an easy-to-port basis for a full Forth implementation"
			    		 * 
			    		 * - https://github.com/uho/preforth
			    		 */
			    	
			    	satisfy Bootstrap_Language_Requirements::preForth_Language;
		    }
		    
		    dependency 'stage2.1' from preForth to Stage1::M0;
		    
		    part def seedForth specializes Interpreter {
			    	satisfy Bootstrap_Language_Requirements::seedForth_Language;
		    }
		    
		    dependency 'stage2.2' from seedForth to preForth;
		    
		    part def seedForth_Interactive specializes Interpreter {
			    	satisfy Bootstrap_Language_Requirements::seedForth_Interactive_Language;
		    }
		    
		    dependency 'stage2.3' from seedForth_Interactive to seedForth;
		    
		    part def ANS_Forth specializes Interpreter {
			    	satisfy Bootstrap_Language_Requirements::ANS_Forth_Language;
		    }
		    
		    dependency 'stage2.4' from ANS_Forth to seedForth_Interactive;
	    }
	    
	    package Stage3 {
	    		doc /*
		    		 * At this bootstrap stage, we go from the Forth stack programming language - which although powerful and generally useful, is unsafe and
		    		 * esoteric - to the Kernel LISP programming language - which is an elegant, garbage-collected, functional programming language.
		    		 */
		    
		    comment /*
				     * There could be another sub-stage here to first create a LISP with linear types, which does not require the implementation of a garbage collector.
				     * 
				     * See https://doi.org/10.1145/142137.142162
				     */
	    		
	    		part def Kernel_LISP specializes Interpreter {
	    			satisfy Bootstrap_Language_Requirements::Kernel_LISP_Language;
	    		}
	    		
	    		dependency 'stage3.1' from Kernel_LISP to Stage2::ANS_Forth;
	    }
	    
	    package Stage4 {
	    		doc /* This bootstrap stage develops a powerful type system on top of Kernel LISP. */
	    		
	    		part def Milawa specializes Proof_Assistant {
	    			satisfy Bootstrap_Language_Requirements::Milawa_FOL_Theorem_Prover;
	    		}
	    		
	    		dependency 'stage4.1' from Milawa to Stage3::Kernel_LISP;
	    		
	    		part def microKanren specializes SW_Library {
	    			satisfy Bootstrap_Language_Requirements::microKanren;
	    		}
	    		
	    		dependency 'stage4.2' from microKanren to Stage3::Kernel_LISP;
	    		
	    		part def miniKanren specializes SW_Library {
	    			satisfy Bootstrap_Language_Requirements::miniKanren;
	    		}
	    		
	    		dependency 'stage4.3' from miniKanren to microKanren;
	    		
	    		part def egglog specializes SW_Library {
	    			satisfy Bootstrap_Language_Requirements::egglog;
	    		}
	    		
	    		dependency 'stage4.4' from egglog to miniKanren;
	    		
	    		part def CTT specializes Proof_Assistant {
	    			satisfy Bootstrap_Language_Requirements::Cubical_Type_Theory;
	    		}
	    		
	    		dependency 'stage4.5' from CTT to egglog;
	    		dependency 'stage4.6' from CTT to Milawa;
	    		
	    		part def <GTVC> 'Gradually-Typed Vau Calculi' specializes Proof_Assistant {
	    			satisfy Bootstrap_Language_Requirements::'Gradually-Typed Vau Calculi';
	    		}
	    		
	    		dependency 'stage4.7' from GTVC to CTT;
	    }
    }
    
    package Bootstrap2 {
    		doc /* Alternate bootstrap path to HILISP_VM */
    		
    		package Stage0 {
    			part def <Wasm> WebAssembly_Computer specializes ASIC {
    				doc /* WebAssembly machine implemented as an ASIC */
    				satisfy Bootstrap_Language_Requirements::WebAssembly_Language;
    			}
			comment about Wasm /* Obviously this could be a Wasm VM, but we do not trust the host machine. */
			comment about Wasm /* Alternatively, this could be Wasm VM bootstrapped from Bootstrap1::Stage1 */
    			
    			part def WAForth specializes Translator {
    				doc /* Complete ANS Forth written in WebAssembly text format */
    				satisfy Bootstrap_Language_Requirements::ANS_Forth_Language;
    			}
    			
    			dependency 'stage0.1' from WAForth to Wasm;
    		}
    		
    		package Stage1 {
    			doc /* Kernel LISP can be implemented directly in WAForth */
    			dependency 'stage1.1a' from Bootstrap1::Stage3::Kernel_LISP to Stage0::WAForth;
    			dependency 'stage1.1b' from Bootstrap1::Stage3::Kernel_LISP to Stage0::Wasm;
    			
    			comment about 'stage1.1a', 'stage1.1b' /* Kernel LISP can be implemented in Wasm or WAForth */
    		}
    		
    		package Stage2 {
    			doc /* The remaining bootstrap stages are the same */
    			public import Bootstrap1::Stage4::*;
    		}
    		
    		comment /* Stages 3 and 4 are unnecessary in the bootstrap path. */
    }
    
    package Bootstrap3 {
    		doc /* An alternate bootstrap uses existing programming languages supporting formal verification, but currently they are not bootstrapped. Therefore, this bootstrap is proposed. */
    		
    		part def Ada2012 specializes Translator {
    			satisfy Bootstrap_Language_Requirements::Ada2012;
    		}
    		part def SPARK2014 specializes Translator, Proof_Assistant {
    			satisfy Bootstrap_Language_Requirements::SPARK2014;
    		}
    		
    		dependency 'stage5.1' from Ada2012 to Bootstrap1::Stage4::egglog;
    		comment about 'stage5.1' /* Conceivably, with Kernel LISP and egglog you could implement an Ada2012 compiler. */
    		dependency 'stage5.2' from SPARK2014 to Ada2012;
    		dependency 'stage5.3' from SPARK2014 to SMT_Solver;
    		comment about 'stage5.3' /* SPARK needs an SMT solver, whether in software or, even better, in hardware. */
    }
	    
    package HILISP_Stage {
    		doc /* At this stage, we have a complete high-level programming meta-language with dependent types. */
    		
    		part def HILISP_VM specializes VM {
    			doc /* The virtual machine targeted by High-Integrity LISP, the high-level programming language for developing cyber-systems that are correct-by-construction. */
    			
    			//satisfy 'SDE Meta-Language Specification'::'SDE Meta-Language'.VM_Spec;
    		}
    		
    		dependency 'stage5.1a' from HILISP_VM to Bootstrap1::Stage4::CTT;
    		dependency 'stage5.2a' from HILISP_VM to Bootstrap1::Stage4::GTVC;
    		
    		dependency 'stage5.1b' from HILISP_VM to Bootstrap2::Stage2::CTT;
    		dependency 'stage5.2b' from HILISP_VM to Bootstrap2::Stage2::GTVC;
    		
    		dependency 'stage5.1c' from HILISP_VM to Bootstrap3::SPARK2014;
    		
    		dependency 'stage5.3a' from HILISP_VM to SMT_Solver;
    		dependency 'stage5.3b' from HILISP_VM to SMT_Solver;
    		comment about 'stage5.3a', 'stage5.3b' /* HILISP_VM would greatly benefit from a SMT-solver ASIC. */
    		
    		comment about 'stage5.2a', 'stage5.2b' /* To support prototyping and exploratory programming, HILISP_VM notionally provides gradually typing. */
    		comment about 'stage5.1a', 'stage5.1b' /* HILISP_VM is bootstrappable from many different paths - the more the better. */
    		comment about 'stage5.1c' /* Theoretically, with a bootstrapped SPARK2014, we would benefit from a formally-specified programming language oriented to program verification. */
    }
   
    
    package Seamless_DE_Appliance {
	    part def DE_Appliance specializes DE_Solutions_Space::DE_Enterprise::DES_Part {
		    	doc /*
			    	 * An appliance specializing in information: knowledge, facts, graphics, images, video, or sound.
			    	 * An information appliance is designed to perform a specific activity, such as music, photography, or writing.
			    	 * A distinguishing feature of information appliances is the ability to share information among themselves.
			    	 */
	    }
	    
	    dependency from SDEA to HILISP_Stage::HILISP_VM;
	        
	    part def <SDEA> Seamless_DE_Appliance specializes DE_Appliance {
	        doc /* The computer hardware and software needed to host the Knowledge-base and Meta-language, forming the primary functional component of the DEE */
	        
	    		//satisfy : SDE.'SDE-FR'.'SDE-FR-CS';
    		
	    		part def <TASM> Timed_Abstract_State_Machines specializes SW_Library;
	    		part def Quadstore specializes SW;
	    		part def KerML specializes DSL, SW_Library;
	    		part def SysML specializes KerML;
	    		comment about SysML /* Actually, HILISP embeds SysML into the language. So this may be a FIXME. */
	    		
	    		dependency from TASM to HILISP_Stage::HILISP_VM;
	    		dependency from Quadstore to HILISP_Stage::HILISP_VM;
	    		dependency from KerML to HILISP_Stage::HILISP_VM;
	    		dependency from SysML to KerML;
	    		
		    part def 'Knowledge-base' {
		        doc /* The provided database of common DE knowledge, including ontologies, standards, templates, and model libraries */
		        
			    part def Ontologies {
			    		part def Seamless_DE_Ontology {
			    			doc /* https://github.com/systems-praxis/Seamless_DE_Ontology */
			    		}
			    }
			    part def Knols {
			    		doc /* Knowledge elements that range from individual notes with metadata, to complete documents and books. */
			    }
			    part def 'Standards Documents';
			    part def 'DE Document Templates';
			    part def 'DE Model Libraries';
		    }
		    
		    dependency from 'Knowledge-base' to Quadstore;
		    
		    part def Engineering_eDSLs specializes SW_Library {
		    		doc /* Engineering embedded domain-specific languages */
		    		
		    		part def Array_Processing;
		    		comment about Array_Processing /* e.g. FORTRAN is a DSL for numerical array processing */
		    		
		    		part def Control_Systems;
		    }
		    
		    part def SDEA_Standard_Library specializes SW_Library {
		    		doc /* The algorithms, data structures, and programming interfaces for accomplishing common tasks in a programming language */
		    }
		    
		    part def <HCI> 'Human-Computer Interface' {
		    		doc /* Activity-Based Computing HCI */
		    }
	    }
    }
    
}
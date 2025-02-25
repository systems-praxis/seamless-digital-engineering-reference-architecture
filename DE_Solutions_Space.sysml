package DE_Solutions_Space {
	doc /* Description of the solutions space for digital engineering environments */

    private import SDE_Profile::*;
    
    //////////////////////////////

	abstract part def <DE_Enterprise> 'Digital Engineering Enterprise' {
		doc /* The enterprise system that implements digital engineering to achieve its mission */
	
		abstract part def <DEE_Part> 'Digital Engineering Environment' {
			doc /*
				 * The networked IT systems including hardware, firmware, and software, that constititute
				 * the digital environment for performing digital engineering activities
				 */
		}
		
		abstract part def <DES_Part> 'Digital Engineering System' specializes DEE_Part {
			doc /*
				 * A theoretical engineered system-of-systems that provides the networked computing resources
				 * and human-computer interfaces for an enterprise to accomplish all digital engineering activities
				 * for successful realization of engineered systems
				 */
				 
			comment /*
					 * While a DEE_Part is more common in today's enterprises, applying the ISO/IEC/IEEE 15288 system life cycle processes
					 * where the DES is the system-of-interest will result in different outcome than applying basic IT management processes.
					 */
		}
	}
	
	package Ten_Usability_Heuristics {
		doc /* Jakob Nielsen's 10 Usability Heuristics for User Interface Design. Source: https://www.nngroup.com/articles/ten-usability-heuristics/ */
		
		#heuristic concern def <'JN-UI.1'>  'Visability of System Status' {
			doc /* The design should always keep users informed about what is going on, through appropriate feedback within a reasonable amount of time. */
		}
		
		#heuristic concern def <'JN-UI.2'>  'Match Between the System and the Real World' {
			doc /* The design should speak the users' language. Use words, phrases, and concepts familiar to the user, rather than internal jargon. Follow real-world conventions, making information appear in a natural and logical order. */
		}
		
		#heuristic concern def <'JN-UI.3'>  'User Control and Freedom' {
			doc /* Users often perform actions by mistake. They need a clearly marked "emergency exit" to leave the unwanted action without having to go through an extended process. */
		}
		
		#heuristic concern def <'JN-UI.4'>  'Consistency and Standards' {
			doc /* Users should not have to wonder whether different words, situations, or actions mean the same thing. Follow platform and industry conventions. */
		}
		
		#heuristic concern def <'JN-UI.5'>  'Error Prevention' {
			doc /* Good error messages are important, but the best designs carefully prevent problems from occurring in the first place. Either eliminate error-prone conditions, or check for them and present users with a confirmation option before they commit to the action. */
		}
		
		#heuristic concern def <'JN-UI.6'>  'Recognition Rather than Recall' {
			doc /* Minimize the user's memory load by making elements, actions, and options visible. The user should not have to remember information from one part of the interface to another. Information required to use the design (e.g. field labels or menu items) should be visible or easily retrievable when needed. */
		}
		
		#heuristic concern def <'JN-UI.7'>  'Flexibility and Efficiency of Use' {
			doc /* Shortcuts — hidden from novice users — may speed up the interaction for the expert user so that the design can cater to both inexperienced and experienced users. Allow users to tailor frequent actions. */
		}
		
		#heuristic concern def <'JN-UI.8'>  'Aesthetic and Minimalist Design' {
			doc /* Interfaces should not contain information that is irrelevant or rarely needed. Every extra unit of information in an interface competes with the relevant units of information and diminishes their relative visibility. */
		}
		
		#heuristic concern def <'JN-UI.9'>  'Help Users Recognize, Diagnose, and Recover from Errors' {
			doc /* Error messages should be expressed in plain language (no error codes), precisely indicate the problem, and constructively suggest a solution. */
		}
		
		#heuristic concern def <'JN-UI.10'>  'Help and Documentation' {
			doc /* It’s best if the system doesn’t need any additional explanation. However, it may be necessary to provide documentation to help users understand how to complete their tasks. */
		}
	}
}
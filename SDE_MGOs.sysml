package <SDE_MGOs> 'SDE Mission, Goals, Objectives' {
	doc /* Seamless DE mission, goals, and objectives. These expressions flow down into need expressions. */
	
    private import SDE_Profile::*;
    private import DE_Problem_Space::*[@SDE_Profile::MGO_mission];
    private import DE_Stakeholders::*[@SDE_Profile::'stakeholder'];
    private import SDE_Parts::Seamless_DE_Appliance::DE_Appliance;
    //////////////////////////////
    
    #MGO_mission requirement def <'SDE-M.1'> 'Seamless DE Mission' specializes DE_Problem_Space::'DE-M.1' {
	    	doc /*
		    	 * The mission of Seamless Digital Engineering is to develop systems that are correct-by-construction
		    	 * by employing a DE Appliance that is itself correct-by-construction.
		    	 */
	    	 
	    comment /*
	    		 	 * Seamless Digital Engineering is a digital engineering tooling paradigm that guarantees model
			     * coherence and integrity by affording an elegant human-computer interface for systems modeling
			     * that is end-to-end formally verified down thru the computer hardware.
			     */
    }
    
    #MGO_goal requirement def <'SDE-G.1'> 'Seamless DE Appliance' specializes 'SDE-M.1' {
	    	doc /* The DE Appliance should be seamless. */
	    	subject DE_Appliance;
	    	
	    	#MGO_goal requirement def <'SDE-G.1.1'> 'Seamless Interaction Capability' {
	    		doc /* The DE Appliance should have the quality of seamless interaction capability. */
	    		
			#MGO_objective requirement def <'SDE-G.1.1-O.1'> 'Compatibility' {
				doc /*
					 * The DE Appliance should exchange information with other products,
					 * and/or to perform its required functions while sharing the same common environment and resources
					 */
			}
    		
			#MGO_objective requirement def <'SDE-G.1.1-O.2'> 'Functional Appropriateness' {
				doc /* The DE Appliance should provide functions that facilitate the accomplishment of specified tasks and objectives. */
			}
    		
			#MGO_objective requirement def <'SDE-G.1.1-O.3'> 'Faultlessness' {
				doc /* The DE Appliance should provide a set of functions that covers all the specified tasks and intended users’ objectives. */
			}
	    	}
	    	
	    	#MGO_goal requirement def <'SDE-G.1.2'> 'Seamless Integration' {
	    		doc /* The DE Appliance should have the quality of seamless integration. */
    		
			#MGO_objective requirement def <'SDE-G.1.2-O.1'> 'Faultlessness' {
				doc /* The DE Appliance should perform specified functions without fault under normal operation. */
			}
    		
			#MGO_objective requirement def <'SDE-G.1.2-O.2'> 'Analyzability' {
				doc /*
					 * The DE Appliance should be effectively and efficiently assessed regarding the impact of
					 * an intended change to one or more of its parts, to diagnose it for deficiencies or causes
					 * of failures, or to identify parts to be modified.
					 */
			}
    		
			#MGO_objective requirement def <'SDE-G.1.2-O.3'> 'Functional Correctness' {
				doc /* The DE Appliance should provide accurate results when used by intended users. */
			}
    		
			#MGO_objective requirement def <'SDE-G.1.2-O.4'> 'Integrity' {
				doc /*
					 * The DE Appliance should ensure that the state of its system and data are protected from
					 * unauthorized modification or deletion either by malicious action or computer error.
				 	 */
			}
    		
			#MGO_objective requirement def <'SDE-G.1.2-O.5'> 'Safe Integration' {
				doc /* The DE Appliance maintain product safety during and after integration with one or more components. */
			}
	    	}
	    	
	    	#MGO_goal requirement def <'SDE-G.1.3'> 'Seamless Quality-in-Use' {
	    		doc /* The DE Appliance should have seamless quality-in-use. */
	    		
			#MGO_objective requirement def <'SDE-G.1.3-O.1'> 'Experience' {
				doc /* 
					 * The DE Appliance should support the user's accumulation of knowledge
					 * or skill acquired over time, especially that gained in a particular profession.
					 */
			}
    		
			#MGO_objective requirement def <'SDE-G.1.3-O.2'> Suitability {
				doc /* The DE Appliance should exhibit behaviors and outcomes that satisfy its specified quality requirements when used. */
			}
    		
			#MGO_objective requirement def <'SDE-G.1.3-O.3'> 'Trustworthiness' {
				doc /* The DE Appliance should support user confidence that their expectations are met in a verifiable way. */
			}
    		
			#MGO_objective requirement def <'SDE-G.1.3-O.4'> 'Usability' {
				doc /* 
					 * The DE Appliance should be used by specified users to achieve specified goals
					 * with effectiveness, efficiency, and satisfaction in a specified context of use.
					 */
			}
	    	}
    	
		comment SQuaRE about
			'SDE-G.1.1'::'SDE-G.1.1-O.1',
			'SDE-G.1.1'::'SDE-G.1.1-O.2',
			'SDE-G.1.1'::'SDE-G.1.1-O.3',
			'SDE-G.1.2'::'SDE-G.1.2-O.1',
			'SDE-G.1.2'::'SDE-G.1.2-O.2',
			'SDE-G.1.2'::'SDE-G.1.2-O.3',
			'SDE-G.1.2'::'SDE-G.1.2-O.4',
			'SDE-G.1.2'::'SDE-G.1.2-O.5',
			'SDE-G.1.3'::'SDE-G.1.3-O.1'
			/* ISO/IEC 25010\:2023 SQuaRE product quality. */
    }
    
    #MGO_goal requirement def <'SDE-G.2'> 'Elegant DE Appliance' specializes 'SDE-M.1' {
	    	doc /* The DE Appliance should be elegant. */
	    	comment /*
	    			 * An elegant system is "a system that is robust in application, fully meeting
			    	 * specified and adumbrated intent, is well-structured, and is graceful in operation."
			    	 */
		subject DE_Appliance;
		    	 
		#MGO_objective requirement def <'SDE-G.2-O.1'> 'System efficacy' {
			doc /* The DE Appliance should have the quality of efficacy. */
		}
		    	 
		#MGO_objective requirement def <'SDE-G.2-O.2'> 'System efficiency' {
			doc /* The DE Appliance should have the quality of efficiency. */
		}
		    	 
		#MGO_objective requirement def <'SDE-G.2-O.3'> 'System robustness' {
			doc /* The DE Appliance should have the quality of robustness. */
		}
		    	 
		#MGO_objective requirement def <'SDE-G.2-O.4'> 'Minimizing unintended consequences' {
			doc /* The DE Appliance should minimize unintended consequences. */
		}
    }
    
    #MGO_goal requirement def <'SDE-G.3'> 'Trustworthy DE Appliance' specializes 'SDE-M.1' {
	    	doc /* The DE Appliance should be trustworthy. */
		subject DE_Appliance;
	    	
	    	#MGO_objective requirement def <'SDE-G.3-O.1'> 'Correct-by-Construction' {
	    		doc /* The DE Appliance should be correct-by-construction. */
	    	}
	    	
	    	#MGO_objective requirement def <'SDE-G.3-O.2'> 'Bootstrappable' {
	    		doc /* The DE Appliance should be full-source bootstrappable. */
	    	}
	    	
	    	#MGO_objective requirement def <'SDE-G.3-O.3'> 'Auditable' {
	    		doc /* The DE Appliance should be independently auditable. */
	    	}
	    	
	    	#MGO_objective requirement def <'SDE-G.3-O.4'> 'Secure' {
	    		doc /* The DE Appliance should be secure. */
	    	}
	    	
	    	#MGO_objective requirement def <'SDE-G.3-O.5'> 'Safe' {
	    		doc /* The DE Appliance should be safe. */
	    	}
    }
    
    #MGO_goal requirement def <'SDE-G.4'> 'Convivial DE Appliance' specializes 'SDE-M.1' {
	    	doc /* The DE Appliance should be convivial. */
	    	comment /*
			    	 * TODO: decompose these further along the four lifecycle levels according
			    	 * to the Matrix of Convivial Technology: materials, production, use, infrastructure.
			    	 */
		subject DE_Appliance;
	    	
	    	#MGO_objective requirement def <'SDE-G.4-O.1'> 'Relatedness' {
	    		doc /* The DE Appliance should support relatedness. */
	    	}
	    	
	    	#MGO_objective requirement def <'SDE-G.4-O.2'> 'Adaptability' {
	    		doc /* The DE Appliance should support adaptability. */
	    	}
	    	
	    	#MGO_objective requirement def <'SDE-G.4-O.3'> 'Accessibility' {
	    		doc /* The DE Appliance should be accessible. */
	    	}
	    	
	    	#MGO_objective requirement def <'SDE-G.4-O.4'> 'Bio-interaction' {
	    		doc /* The DE Appliance should protect bio-interaction. */
	    	}
	    	
	    	#MGO_objective requirement def <'SDE-G.4-O.5'> 'Appropriateness' {
	    		doc /* The DE Appliance should be appropriate. */
	    	}
    }
}
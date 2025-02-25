package DE_Problem_Space {
	doc /* Description of the general digital engineering problem space */
	
    private import SDE_Profile::*;
    private import DE_Stakeholders::*;
    //////////////////////////////
    
    #MGO_mission requirement def <'DE-M.1'> 'DE Mission' {
    	doc /*
	    	 * The mission of digital engineering is to use authoritative sources of systems’ data and models as
	    	 * a continuum across disciplines to support lifecycle activities from concept stage through retirement stage.
	    	 */
    }

    //////////////////////////////

    package <DE_Goals> 'Digital Engineering Goals' {
        doc /* Digital Engineering goals according to the original 2018 DoD DE Strategy document */
        
        package DE_Supergoals {
	        #MGO_goal requirement def <'SG-DE-A'> 'Inform decision-making' specializes 'DE-M.1' {
		        	doc /* The DE Enterprise should inform decision-making. */
		        	
		        	#MGO_goal requirement def <'SG-DE-A.1'> 'Inform enterprise decision-making' {
		        		doc /* The DE Enterprise should inform enterprise decision-making. */
		        	}
		        	
		        	#MGO_goal requirement def <'SG-DE-A.2'> 'Inform program decision-making' {
		        		doc /* The DE Enterprise should inform program decision-making. */
		        	}
		        	
		        	#MGO_goal requirement def <'SG-DE-A.3'> 'Inform project decision-making' {
		        		doc /* The DE Enterprise should inform project decision-making. */
		        	}
	        }
	        
	        #MGO_goal requirement def <'SG-DE-B'> 'Support engineering activities' specializes 'DE-M.1' {
		        	doc /* The DE Enterprise should support engineering activities. */
		        	
		        	#MGO_goal requirement def <'SG-DE-B.1'> 'Support model-driven lifecycle activities' {
		        		doc /* The DE Enterprise should support model-driven lifecycle activities */
		        	}
		        	
		        	#MGO_goal requirement def <'SG-DE-B.2'> 'Support cohesion of lifecycle activities' {
		        		doc /* The DE Enterprise should support cohesion of complete system lifecycle activities. */
		        	}
		        	
		        	#MGO_goal requirement def <'SG-DE-B.3'> 'Support complete lifecycle' {
		        		doc /* The DE Enterprise should support the complete system lifecycle. */
		        	}
	        }
	        #MGO_goal requirement def <'SG-DE-C'> 'Improve engineering practice' specializes 'DE-M.1' {
		        	doc /* The DE Enterprise should improve engineering practice. */
		        	
		        	#MGO_goal requirement def <'SG-DE-C.1'> 'Improve awareness' {
		        		doc /* The DE Enterprise should improve awareness during engineering activities. */
		        	}
		        	
		        	#MGO_goal requirement def <'SG-DE-C.2'> 'Improve insights' {
		        		doc /* The DE Enterprise should improve insights during engineering activities. */
		        	}
		        	
		        	#MGO_goal requirement def <'SG-DE-C.3'> 'Improve digital engineering practice' {
		        		doc /* The DE Enterprise should improve digital engineering practice. */
		        	}
	        	}
	        #MGO_goal requirement def <'SG-DE-D'> 'Enable end-to-end digital enterprise' specializes 'DE-M.1' {
		        	doc /* The DE Enterprise should enable the end-to-end digital enterprise. */
		        	
		        	#MGO_goal requirement def <'SG-DE-D.1'> 'Adopt digital engineering across the lifecycle' {
		        		doc /* The DE Enterprise should adopt digital engineering across the system lifecycle. */
		        	}
		        	
		        	#MGO_goal requirement def <'SG-DE-D.2'> 'Support digital engineering across the lifecycle' {
		        		doc /* The DE Enterprise should support digital engineering across the system lifecycle. */
		        	}
	        }
        }
        
        #MGO_goal requirement def <'G-DE-1'> 'Formalize model lifecycles'
        	specializes DE_Supergoals::'SG-DE-A', DE_Supergoals::'SG-DE-B', DE_Supergoals::'SG-DE-C' {
            doc /* The DE Enterprise should formalize the development, integration, and use of models. */
                
            authors[1] = "DoD Office of the Deputy Assistant Secretary of Defense for Systems Engineering";
            priority = 1;
            source = "DoD Digital Engineering Strategy (2018)";
                
            frame concern : DE_Stakeholders::DE_Concerns::'C-DE-1';
            frame concern : DE_Stakeholders::DE_Concerns::'C-DE-2';
            
            #MGO_goal requirement def <'G-DE-1.1'> 'Formalize model planning' {
	            	doc /* The DE Enterprise should formalize model planning. */
	            	
	            	#MGO_objective requirement def <'G-DE-1.1.1'> 'Formally develop plans to digitally represent SoI' {
	            		doc /* The DE Enterprise should formalize plans to digitally represent the SoI. */
	            	}
            }
            
            #MGO_goal requirement def <'G-DE-1.2'> 'Formally develop, integrate, and curate models' {
            		doc /* The DE Enterprise should formally develop, integrate, and curate models. */
            	
            		#MGO_goal requirement def <'G-DE-1.2.1'> 'Formally develop models' {
	            		doc /* The DE Enterprise should formally develop models. */
	            		
	            		#MGO_objective requirement def <'G-DE-1.2.1.1'> 'Ensure model accuracy' {
	            			doc /* The DE Enterprise should ensure model accuracy. */
	            		}
	            		
	            		#MGO_objective requirement def <'G-DE-1.2.1.2'> 'Ensure model completeness' {
	            			doc /* The DE Enterprise should ensure model completeness. */
	            		}
	            	}
            	
	            	#MGO_goal requirement def <'G-DE-1.2.2'> 'Formally integrate models' {
	            		doc /* The DE Enterprise should formally integrate models. */
	            	}
	            	
	            	#MGO_goal requirement def <'G-DE-1.2.3'> 'Formally curate models' {
	            		doc /* The DE Enterprise should formally curate models. */
	            		
	            		#MGO_objective requirement def <'G-DE-1.2.3.1'> 'Ensure model reusability' {
	            			doc /* The DE Enterprise should ensure model reusability. */
	            		}
	            		
	            		#MGO_objective requirement def <'G-DE-1.2.3.2'> 'Ensure model trustworthiness' {
	            			doc /* The DE Enterprise should ensure model trustworthiness. */
	            		}
	            	}
            }
            
            #MGO_goal requirement def <'G-DE-1.3'> 'Formalize model use' {
	            	doc /* The DE Enterprise should formalize model use. */
	            		
	        		#MGO_objective requirement def <'G-DE-1.3.1'> 'Use models to communicate' {
	        			doc /* The DE Enterprise should use models to communicate. */
	        		}
	        		
	        		#MGO_objective requirement def <'G-DE-1.3.2'> 'Use models to collaborate' {
	        			doc /* The DE Enterprise should use models to collaborate. */
	        		}
	        		
	        		#MGO_objective requirement def <'G-DE-1.3.3'> 'Use models to perform lifecycle activities' {
	        			doc /* The DE Enterprise should use models to perform lifecycle activities. */
	        		}
            }
        }
        
        // #goal requirement <'G-DE-1.1'> 'Something' specializes 'G-DE-1' {
        //     doc /* Help */
        // }
        
        #MGO_goal requirement def <'G-DE-2'> 'Provide enduring ASoT'
        	specializes DE_Supergoals::'SG-DE-B', DE_Supergoals::'SG-DE-C' {
            doc /* The DE Enterprise should provide an enduring, authoritative source of truth. */
                
            frame concern : DE_Stakeholders::DE_Concerns::'C-DE-1';
            frame concern : DE_Stakeholders::DE_Concerns::'C-DE-2';
            frame concern : DE_Stakeholders::DE_Concerns::'C-DE-3';
            frame concern : DE_Stakeholders::DE_Concerns::'C-DE-4';
            
            #MGO_goal requirement def <'G-DE-2.1'> 'Define the ASoT' {
	            	doc /* The DE Enterprise should define the ASoT. */
	            	
	            	#MGO_objective requirement def <'G-DE-2.1.1'> 'Plan the ASoT' {
	            		doc /* The DE Enterprise should plan the ASoT. */
	            	}
	            	
	            	#MGO_objective requirement def <'G-DE-2.1.2'> 'Develop the ASoT' {
	            		doc /* The DE Enterprise should develop the ASoT. */
	            	}
            }
            
            #MGO_goal requirement def <'G-DE-2.2'> 'Govern the ASoT' {
	            	doc /* The DE Enterprise should govern the ASoT. */
	            	
	            	#MGO_objective requirement def <'G-DE-2.2.1'> 'Establish access to the ASoT' {
	            		doc /* The DE Enterprise should establish access to the ASoT. */
	            	}
	            	
	            	#MGO_objective requirement def <'G-DE-2.2.2'> 'Establish controls for the ASoT' {
	            		doc /* The DE Enterprise should establish controls for the ASoT. */
	            	}
	            	
	            	#MGO_objective requirement def <'G-DE-2.2.3'> 'Execute governance of the ASoT' {
	            		doc /* The DE Enterprise should execute governance of the ASoT. */
	            	}
            }
            
            #MGO_goal requirement def <'G-DE-2.3'> 'Use the ASoT' {
	            	doc /* The DE Enterprise should use the ASoT. */
	            	
	            	#MGO_objective requirement def <'G-DE-2.3.1'> 'Use the ASoT as the technical baseline' {
	            		doc /* The DE Enterprise should use the ASoT as the technical baseline. */
	            	}
	            	
	            	#MGO_objective requirement def <'G-DE-2.3.2'> 'Use the ASoT to produce digital artifacts' {
	            		doc /* The DE Enterprise should use the ASoT to produce digital artifacts. */
	            	}
	            	
	            	#MGO_objective requirement def <'G-DE-2.3.3'> 'Collaborate using the ASoT' {
	            		doc /* The DE Enterprise should collaborate using the ASoT. */
	            	}
            }
        }
        
        #MGO_goal requirement def <'G-DE-3'> 'Incorporate technological innovation'
        	specializes DE_Supergoals::'SG-DE-D' {
            doc /* The DE Enterprise should incorporate technological innovation into DE practice. */
                
            frame concern : DE_Stakeholders::DE_Concerns::'C-DE-5';
            
            #MGO_goal requirement def <'G-DE-3.1'> 'Establish an end-to-end DE enterprise' {
	            	doc /* The DE Enterprise should establish an end-to-end DE enterprise. */
	            	
	            	#MGO_goal requirement def <'G-DE-3.1.1'> 'Infuse technological innovations' {
	            		doc /* The DE Enterprise should infuse technological innovations. */
	            	}
            }
            
            #MGO_goal requirement def <'G-DE-3.2'> 'Use technological innovations' {
	            	doc /* The DE Enterprise should use technological innovations. */
	            	
	            	#MGO_goal requirement def <'G-DE-3.2.1'> 'Make use of data' {
	            		doc /* The DE Enterprise should make use of data. */
	            	}
	            	
	            	#MGO_goal requirement def <'G-DE-3.2.2'> 'Advance human-machine interactions' {
	            		doc /* The DE Enterprise should advance human-machine interactions. */
	            	}
            }
        }
        
        #MGO_goal requirement def <'G-DE-4'> 'Establish infrastructure & environment'
        	specializes DE_Supergoals::'SG-DE-C', DE_Supergoals::'SG-DE-D' {
            doc /* The DE Enterprise should establish supporting DE infrastructure and environment. */
                
            frame concern : DE_Stakeholders::DE_Concerns::'C-DE-5';
            
            #MGO_goal requirement def <'G-DE-4.1'> 'Establish DE IT infrastructure' {
	            	doc /* The DE Enterprise should establish DE IT infrastructure. */
	            	
	            	#MGO_objective requirement def <'G-DE-4.1.1'> 'Develop DE IT infrastructure' {
	            		doc /* The DE Enterprise should develop DE IT infrastructure. */
	            	}
	            	
	            	#MGO_objective requirement def <'G-DE-4.1.2'> 'Use DE IT infrastructure' {
	            		doc /* The DE Enterprise should use DE IT infrastructure. */
	            	}
	            	
	            	#MGO_objective requirement def <'G-DE-4.1.3'> 'Mature DE IT infrastructure' {
	            		doc /* The DE Enterprise should mature DE IT infrastructure. */
	            	}
            }
            
            #MGO_goal requirement def <'G-DE-4.2'> 'Establish DE methodologies' {
	            	doc /* The DE Enterprise should establish DE methodologies. */
	            	
	            	#MGO_objective requirement def <'G-DE-4.2.1'> 'Develop DE methodologies' {
	            		doc /* The DE Enterprise should develop DE methodologies. */
	            	}
	            	
	            	#MGO_objective requirement def <'G-DE-4.2.2'> 'Use DE methodologies' {
	            		doc /* The DE Enterprise should use DE methodologies. */
	            	}
	            	
	            	#MGO_objective requirement def <'G-DE-4.2.3'> 'Mature DE methodologies' {
	            		doc /* The DE Enterprise should mature DE methodologies. */
	            	}
            }
            
            #MGO_goal requirement def <'G-DE-4.3'> 'Protect intellectual property' {
	            	doc /* The DE Enterprise should protect intellectual property. */
	            	
	            	#MGO_objective requirement def <'G-DE-4.3.1'> 'Secure IT infrastructure' {
	            		doc /* The DE Enterprise should secure IT infrastructure. */
	            	}
	            	
	            	#MGO_objective requirement def <'G-DE-4.3.2'> 'Protect IP during model use' {
	            		doc /* The DE Enterprise should protect IP during model use. */
	            	}
            }
        }
        
        #MGO_goal requirement def <'G-DE-5'> 'Transform culture & workforce'
        	specializes DE_Supergoals::'SG-DE-D' {
            doc /* The DE Enterprise should transform the culture and workforce. */
                
            frame concern : DE_Stakeholders::DE_Concerns::'C-DE-5';
            
            comment /* TODO */
        }
    }
    
}
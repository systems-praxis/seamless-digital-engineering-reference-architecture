package SDE_Requirements {
	doc /* Seamless Digital Engineering Appliance design input requirements */
	
	private import SDE_Profile::*;
	private import DE_Stakeholders::*;
	private import SDE_Parts::*;
	
	///////////////////////////////
	comment about SDE /* The root requirement that defines the scope and intent of the Seamless Digital Engineering Appliance */
	
    #'requirement set' requirement def
    <SDE> SDE_Root_Requirement {

	    #'requirement set' requirement def
	    <'SDE-FR'> SDE_Functional_Requirements {
	
	        #'requirement set' requirement def
	        <'SDE-FR-KB'> 'Knowledge-base Requirements' {
	            #'requirement set' requirement def
	            'Database';
	            #'requirement set' requirement def
	            'Publisher';
	            #'requirement set' requirement def
	            'Hypermedia Library';
	        }
	        
	        comment /* TODO: Import meta-language requirements */
	
	        #'requirement set' requirement def
	        <'SDE-FR-CS'> 'Computing System Requirements' {
		        	doc /* The Computing System shall provide digital engineering capabilities to the Operator. */
		        	//subject cs : SDE_Parts::Seamless_DE_Appliance;
		        	actor op : DE_Stakeholders::Operator;
		        	
		        	
	        }
	
	    }
	
	    #'requirement set' requirement def
	    <'SDE-QR'> SDE_Quality_Requirements {
	    }
	
	}
}
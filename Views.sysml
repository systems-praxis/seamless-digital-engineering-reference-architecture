package SDE_RA_Views {
	doc /* View Usages that are used to render particular diagrams in the Seamless DE Reference Architecture description */
	
	// standard imports
	private import StandardViewDefinitions::gv;
	
	// Seamless Digital Engineering imports
	private import 'SDE Mission, Goals, Objectives'::**;
	private import SDE_Requirements;
	private import SDE_Parts;
	
	// General digital engineering imports
	private import DE_Stakeholders::*;
	private import DE_Problem_Space::*;
	
	// Seamless Digital Engineering views
	view 'Seamless DE Goals' : gv {
    	doc /* Show the Seamless DE goals in relation to general DE goals */
	    expose SDE_MGOs::*;
	}
	
	view 'Seamless DE Requirements' : gv {
    	doc /* Show the Seamless Digital Engineering requirements tree */
	    expose SDE_Requirements::*;
	}
	
	// General digital engineering views
	view 'DE Goals Decomposition' : gv {
    	doc /* Show all the Digital Engineering goals */
	    expose DE_Problem_Space::DE_Goals;
	}
	
	//view 'DE Benefits View' : gv {
    	//doc /* Show all the Digital Engineering expected benefits */
	//    expose DE_Problem_Space::DE_Benefits;
	    // render asTextualNotation; // unsupported by PlantUML renderer
	//}
    
    view 'DE Stakeholders View' : gv {
    	doc /* Show all the Digital Engineering stakeholders */
        expose DE_Stakeholders::*[@SDE_Profile::'stakeholder'];
        // render asTextualNotation; // unsupported by PlantUML renderer
    }
    
    view 'DE Problem Space View' : gv {
        expose DE_Problem_Space::*[@SysML::Package];
    }
    

    view <SDE_PBS> 'Seamless DE Product Breakdown Structure' : gv {
        expose SDE_Parts::*;
    }

    view 'SDE Requirements Satisfaction' : gv {
        expose SDE_Parts::**[@SysML::SatisfyRequirementUsage];
    }

}
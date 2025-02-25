package DE_Stakeholders {
	doc /* Standard stakeholders in digital engineering processes */
	
	private import SDE_Profile::'stakeholder';
    private import StandardViewDefinitions::gv;
	
    #'stakeholder' item def Engineer;
    #'stakeholder' item def Scientist;
    #'stakeholder' item def Customer;
    #'stakeholder' item def <Customer_Representative> 'Customer (Representative)';
    #'stakeholder' item def 'Technician';
    #'stakeholder' item def 'Program Manager' {
        doc /* Person appointed with the accountability and responsibility of a program to realize identified benefits and deliverables */
        'definition source' = "ISO 21506:2024(en) — Project, programme and portfolio management — Vocabulary";
    }
    #'stakeholder' item def 'Project Manager' specializes 'Program Manager';
    #'stakeholder' item def 'Regulation Authority';
    #'stakeholder' item def <DEE_Developer> 'DE Environment Developer';
    #'stakeholder' item def 'Safety Engineer' specializes Engineer;
    #'stakeholder' item def 'Security Engineer' specializes Engineer;
    #'stakeholder' item def 'Software Engineer' specializes Engineer;
    #'stakeholder' item def 'Systems Engineer' specializes Engineer;
    #'stakeholder' item def 'Mechanical Engineer' specializes Engineer;
    #'stakeholder' item def 'Electrical Engineer' specializes Engineer;
    #'stakeholder' item def 'Robotics Engineer' specializes 'Mechanical Engineer', 'Electrical Engineer';
    #'stakeholder' item def 'IV&V Engineer' specializes Engineer;
    #'stakeholder' item def 'Systems Architect' specializes 'Systems Engineer';
    #'stakeholder' item def 'Requirements Engineer' specializes 'Systems Engineer';
    #'stakeholder' item def Auditor;
    #'stakeholder' item def Evaluator specializes Auditor;
    #'stakeholder' item def Acquirer;
    #'stakeholder' item def Supplier;
    #'stakeholder' item def Contractor specializes Supplier;
    #'stakeholder' item def Accountant;
    #'stakeholder' item def Operator;
    #'stakeholder' item def Maintainer;
    
    
    package <DE_Concerns> 'Digital Engineering Concerns' {
        doc /* Stakeholder concerns derived from the Digital Engineering expected benefits from the original 2018 DoD DE Strategy document */

        concern def <'C-DE-1'> 'Informed decision-making' {
        		doc /* How does the system support better informed decision-making? */
            comment /* Informed decision-making and/or greater insight thru increased transparency */
            stakeholder pm : DE_Stakeholders::'Program Manager';
        }

        concern def <'C-DE-2'> 'Enhanced communication' {
        		doc /* How does the system enhance communication of engineering processes? */
            comment /* Enhanced communication in engineering processes */
            stakeholder pm : DE_Stakeholders::'Program Manager';
        }

        concern def <'C-DE-3'> 'Increased understanding' {
        		doc /* How does the system increase understanding during design? */
            comment /* Increased understanding for greater flexibility and/or adaptability in design */
            stakeholder pm : DE_Stakeholders::'Program Manager';
        }

        concern def <'C-DE-4'> 'Increased confidence' {
        		doc /* Will the capability perform as expected? */
            comment /* Increased confidence that the capability will perform as expected */
            stakeholder pm : DE_Stakeholders::'Program Manager';
        }

        concern def <'C-DE-5'> 'Increased efficiency' {
        		doc /* How does the system increase efficiency in engineering and acquisition practices? */
            comment /* Increased efficiency in engineering and acquisition practices */
            stakeholder pm : DE_Stakeholders::'Program Manager';
        }

    }
}
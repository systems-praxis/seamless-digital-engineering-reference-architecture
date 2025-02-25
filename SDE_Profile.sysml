library package SDE_Profile {
    private import SysML::RequirementDefinition;
    private import SysML::RequirementUsage;
    private import SysML::ConcernDefinition;
    private import SysML::ConcernUsage;
    private import SysML::PartDefinition;
    private import SysML::PartUsage;
    private import SysML::ItemDefinition;
    private import SysML::ItemUsage;
    private import Views::*;
    public import StandardViewDefinitions::*;
    private import Metaobjects::SemanticMetadata;
    private import ScalarValues::String;
    private import ScalarValues::Positive;
    // private import Associations::**;
    
    public import 'Model-Based_Structured_Requirement'::*;
    
    /////////////////////////////////////////

    requirement def Mission;
    requirement missions : Mission [*];

    metadata def <MGO_mission> MissionMetadata :> SemanticMetadata {
        redefines baseType = missions meta SysML::RequirementUsage;
        
        attribute authors : String [1..*] ordered;
        attribute version : String [1];
        attribute changeHistory : String [1..*] ordered;
        attribute source : String [1..*];
        attribute info : String [0..*];
        
        subsets annotatedElement : SysML::RequirementDefinition;
	    subsets annotatedElement : SysML::RequirementUsage;
    }
    
    
    requirement def Goal;
    requirement goals : Goal [*];

    metadata def <MGO_goal> GoalMetadata :> SemanticMetadata {
        redefines baseType = goals meta SysML::RequirementUsage;
        
        attribute authors : String [1..*] ordered;
        attribute version : String [1];
        attribute changeHistory : String [1..*] ordered;
        attribute priority : Positive [1];
        attribute criticality : Positive [1];
        attribute source : String [1..*];
        attribute info : String [0..*];
        
        subsets annotatedElement : SysML::RequirementDefinition;
	    subsets annotatedElement : SysML::RequirementUsage;
    }
    
    
    requirement def Objective;
    requirement objectives : Objective [*];

    metadata def <MGO_objective> ObjectiveMetadata :> SemanticMetadata {
        redefines baseType = objectives meta SysML::RequirementUsage;
        
        attribute authors : String [1..*] ordered;
        attribute version : String [1];
        attribute changeHistory : String [1..*] ordered;
        attribute priority : Positive [1];
        attribute criticality : Positive [1];
        attribute source : String [1..*];
        attribute info : String [0..*];
        
        subsets annotatedElement : SysML::RequirementDefinition;
	    subsets annotatedElement : SysML::RequirementUsage;
    }
    
    // connection def <goalContribution> SoftgoalContribution {
    //    end supergoal : MGO_goal;
    //    end subgoal   : MGO_goal;
    // }
    
    concern def <Expectation> 'Stakeholder Expectation';
    concern expectations : Expectation [*];
    
    metadata def <expectation> StakeholderExpectationMetadata :> SemanticMetadata {
    		doc /* A statement of needs, desires, capabilities, and wants that are not expressed as a requirement (not expressed as a “shall” statement) is referred to as an “expectation.” Once the set of expectations from applicable stakeholders is collected, analyzed, and converted into a “shall” statement, the expectation becomes a requirement. Expectations can be stated in either qualitative (non-measurable) or quantitative (measurable) terms. Requirements are always stated in quantitative terms. Expectations can be stated in terms of functions, behaviors, or constraints with respect to the product being engineered or the process used to engineer the product. Source: NASA Systems Engineering Handbook Glossary */
    	
        redefines baseType = expectations meta SysML::RequirementUsage;
        
        subsets annotatedElement : SysML::RequirementDefinition;
	    subsets annotatedElement : SysML::RequirementUsage;
    }
    
    
    concern def <Heuristic> 'Design Heuristic';
    concern heuristics : Heuristic [*];
    
    metadata def <heuristic> DesignHeuristicMetadata :> SemanticMetadata {
    		doc /* The designers of the system-of-interest have these types of concerns. */
    	
        redefines baseType = heuristics meta SysML::ConcernUsage;
        
        subsets annotatedElement : SysML::ConcernDefinition;
	    subsets annotatedElement : SysML::ConcernUsage;
    }
    
    ////
    
    constraint def Claim;
    constraint Claims : Claim [*];
    
    metadata def <claim> ClaimMetadata :> SemanticMetadata {
    		doc
    		/*
    		 * A true-false statement about the limitations on the values of an unambiguously defined
    		 * Property - called the Claim's Property - and limitations on the Uncertainty of the
    		 * Property's values falling within these limitations during the Claim's duration of
    		 * applicability under stated Conditions
    		 */
    		 
        redefines baseType = Claims meta SysML::ConstraintUsage;
        
        subsets annotatedElement : SysML::ConstraintDefinition;
	    subsets annotatedElement : SysML::ConstraintUsage;
    }
    
    ////
    
    constraint def 'Quality Attribute';
    constraint QAts : 'Quality Attribute' [*];
    
    metadata def <QAt> QualityAttributeMetadata :> SemanticMetadata {
        redefines baseType = QAts meta SysML::ConstraintUsage;
        
        subsets annotatedElement : SysML::ConstraintDefinition;
	    subsets annotatedElement : SysML::ConstraintUsage;
    }
    
    ////
    
    part def 'System-of-Interest';
    part 'systems-of-interest' : 'System-of-Interest' [*];
    
    metadata def <'system-of-interest'> SystemOfInterestMetadata :> SemanticMetadata {
        redefines baseType = 'systems-of-interest' meta SysML::PartUsage;
        
        subsets annotatedElement : SysML::PartDefinition;
	    subsets annotatedElement : SysML::PartUsage;
    }
    
    ////
    
    item def Stakeholder;
    item stakeholders : Stakeholder [*];
    
    metadata def <'stakeholder'> StakeholderMetadata :> SemanticMetadata {
        redefines baseType = stakeholders meta SysML::ItemUsage;
        
        attribute 'definition source' : String [1];
        
        subsets annotatedElement : SysML::ItemDefinition;
	    subsets annotatedElement : SysML::ItemUsage;
    }
    
}

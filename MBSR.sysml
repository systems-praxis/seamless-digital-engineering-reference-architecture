library package <MBSR> 'Model-Based_Structured_Requirement' {
	doc /* Model-Based Structured Requirement - SysML v2 Profile */
	
	private import SysML::RequirementDefinition;
	private import SysML::RequirementUsage;
    private import Metaobjects::SemanticMetadata;
    private import ScalarValues::String;
    private import ScalarValues::Positive;
    private import Attributes::AttributeValue;
    
    enum def RequirementType {
	    	Stakeholder { doc /* Stakeholder Requirements are requirement statements owned by the stakeholders, primarily those requirements levied on the system-of-interest by the customer and acquirer parties. */ }
	    	Science;
	    	Functional;
	    	Performance;
	    	Quality;
	    	Security;
	    	Safety;
	    	Design;
	    	Physical;
	    	Suitability;
	    	Operational;
	    	Disposal;
	    	Compliance;
    }
    
    ////////
	
    requirement def MBSR_Requirement;
    requirement MBSR_Requirements : MBSR_Requirement [*];

    metadata def <'requirement expression'> MBSR_RequirementMetadata :> SemanticMetadata {
        redefines baseType = MBSR_Requirements meta SysML::RequirementUsage;
        
        attribute authors : String [1..*] ordered;
        attribute version : String [1];
        attribute changeHistory : String [1..*] ordered;
        attribute priority : Positive [1];
        attribute criticality : Positive [1];
        attribute source : String [1..*];
        attribute info : String [0..*];
        attribute type : RequirementType [1];
        attribute rationale : String [1];
        
        subsets annotatedElement : SysML::RequirementDefinition;
	    subsets annotatedElement : SysML::RequirementUsage;
    }
    
    ///////
	
    requirement def MBSR_Requirement_Set;
    requirement MBSR_Requirement_Sets : MBSR_Requirement_Set [*];

    metadata def <'requirement set'> MBSR_RequirementSetMetadata :> SemanticMetadata {
    	doc /* Requirement Sets contain Requirement Expressions and other Requirement Sets, and themselves have a textual statement and other Requirement Set attributes. (TODO) */
    	
        redefines baseType = MBSR_Requirement_Sets meta SysML::RequirementUsage;
        
        attribute authors : String [1..*] ordered;
        attribute version : String [1];
        attribute changeHistory : String [1..*] ordered;
        attribute priority : Positive [1];
        attribute criticality : Positive [1];
        attribute source : String [1..*];
        attribute type : RequirementType [1];
        
        subsets annotatedElement : SysML::RequirementDefinition;
	    subsets annotatedElement : SysML::RequirementUsage;
    }
    
    ///////
	
    requirement def MBSR_Need;
    requirement MBSR_Needs : MBSR_Need [*];

    metadata def <'need expression'> MBSR_NeedMetadata :> SemanticMetadata {
        redefines baseType = MBSR_Needs meta SysML::RequirementUsage;
        
        // NOTE: SN1-Stakeholder: use the 'stakeholder' attribute built into SysML v2
        // NOTE: SN2-Entity: use the 'subject' attribute built into SysML v2
        attribute 'SN3-Entity Response' : Attributes::AttributeValue {
        	doc /* The response of the entity/subject */
        	comment /* Only use attribute SN3-Entity Reponse when SN4, SN5, and SN6 are not in use. */
        	comment /* Part of the need statement pattern: The [stakeholder] needs the [Entity] [Entity Response]. */
        }
        attribute 'SN4-Action Verb' : Attributes::AttributeValue {
        	comment /* The entity *does* something. What is the action verb in this statement? */
        }
        attribute 'SN5-Object' : Attributes::AttributeValue {
        	doc /* The entity or object targeted by the subject's action */
        }
        attribute 'SN6-Measurable Outcome' : Attributes::AttributeValue {
        	doc /* The measurable outcome of the subject acting on the object, preferably with units defined */
        }
        
        attribute version : String [1];
        attribute changeHistory : String [1..*] ordered;
        attribute priority : Positive [1];
        attribute criticality : Positive [1];
        attribute source : String [1..*];
        
        
        
        subsets annotatedElement : SysML::RequirementDefinition;
	    subsets annotatedElement : SysML::RequirementUsage;
    }
    
    ///////
    
    
    requirement def MBSR_Need_Set;
    requirement MBSR_Need_Sets : MBSR_Need_Set [*];

    metadata def <'need set'> MBSR_NeedSetMetadata :> SemanticMetadata {
    	doc /* Need Sets contain Need Expressions and other Need Sets, and themselves have a textual statement and other Need Set attributes. (TODO) */
    	
        redefines baseType = MBSR_Need_Sets meta SysML::RequirementUsage;
        
        attribute authors : String [1..*] ordered;
        attribute version : String [1];
        attribute changeHistory : String [1..*] ordered;
        attribute priority : Positive [1];
        attribute criticality : Positive [1];
        attribute source : String [1..*];
        attribute type : RequirementType [1];
        
        subsets annotatedElement : SysML::RequirementDefinition;
	    subsets annotatedElement : SysML::RequirementUsage;
    }
}
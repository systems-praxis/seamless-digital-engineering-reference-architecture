package <SDE_Lang_Spec> 'SDE Meta-Language Specification' {
	doc /* Design input requirements of the Seamless Digital Engineering Meta-Language */
	
	private import SDE_Profile::*;
	private import 'Model-Based_Structured_Requirement'::*;
	
	abstract part def 'meta-language' {
		doc /* A meta-language supports language-oriented programming including general-purpose programming languages, domain-specific languages, declarative languages, and abstract syntax trees. */
	}
	
	
	#'requirement set' requirement def 'SDE Meta-Language' {
	    doc /* The digital engineering meta-language which enables language-oriented programming using domain-specific languages */
	    subject 'meta-language';
	    
	    #'requirement set' requirement def VM_Spec {
	    		doc /* Specification of the SDE Meta-Language virtual machine */
	    }
	    
	    #'requirement set' requirement def Core {
	        doc /* The core language definition */
	    }
	    
	    #'requirement set' requirement def Prelude {
	        doc /* The Prelude includes all the standard packages and functions for general-purpose programming */
	    }
	    
	    #'requirement set' requirement def 'Engineering Languages' {
	        #'requirement set' requirement def <SysML> 'Systems Modeling Language';
	        #'requirement set' requirement def <CAD> 'Computer-Aided Design Language';
	        #'requirement set' requirement def <FEA> 'Finite Element Analysis Language';
	        #'requirement set' requirement def <CAM> 'Computer-Aided Manufacturing Language';
	    }
	    
	    #'requirement set' requirement def 'Science Languages';
	    
	    #'requirement set' requirement def 'Mathematics Languages' {
	        #'requirement set' requirement def 'Computational Logic';
	        #'requirement set' requirement def 'Computational Type Theory';
	        #'requirement set' requirement def 'Category Theory';
	    }
	}

}
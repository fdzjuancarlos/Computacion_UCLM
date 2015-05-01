

;;; ***************************
;;; * DEFTEMPLATES & DEFFACTS *
;;; ***************************

(deftemplate UI-state
   (slot id (default-dynamic (gensym*)))
   (slot display)
   (slot relation-asserted (default none))
   (slot response (default none))
   (multislot valid-answers)
   (slot state (default middle)))
   
(deftemplate state-list
   (slot current)
   (multislot sequence))
  
(deffacts startup
   (state-list))
   
;;;****************
;;;* STARTUP RULE *
;;;****************

(defrule system-banner ""

  =>
  
  (assert (UI-state (display WelcomeMessage)
                    (relation-asserted start)
                    (state initial)
                    (valid-answers))))

;;;***************
;;;* My Code *
;;;***************

(defrule determine-engine-state ""

   (logical (start))

   =>

   (assert (UI-state (display StartQuestion)
                     (relation-asserted Finalidad)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-learning ""

   (logical (Finalidad No))

   =>

   (assert (UI-state (display Fundaments)
                     (relation-asserted Aprender)
                     (response Yes)
                     (valid-answers No Yes))))


(defrule determine-specific ""

   (logical (Finalidad No))

   =>

   (assert (UI-state (display Specific)
                     (relation-asserted Especifico)
                     (response Yes)
                     (valid-answers No Yes))))



(defrule determine-easy-learn ""

   (logical (Aprender Yes))

   =>

   (assert (UI-state (display EasyLearn)
                     (relation-asserted MuyFacil)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-python-learn ""

   (logical (Aprender Yes))

   =>

   (assert (UI-state (display PythonLearn)
                     (relation-asserted Facil)
                     (response Yes)
                     (valid-answers No Yes))))


(defrule determine-hard-learn ""

   (logical (Aprender Yes))

   =>

   (assert (UI-state (display CLearn)
                     (relation-asserted Dificil)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-hobbie ""

   (or (logical (Finalidad Yes))
	(logical (Especifico Yes)))

   =>

   (assert (UI-state (display Hobbie)
                     (relation-asserted Complementaria)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-paradigm ""

   (logical (Complementaria Yes))

   =>

   (assert (UI-state (display Paradigm)
                     (relation-asserted Paradigma)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-poo ""

   (logical (Paradigma Yes))

   =>

   (assert (UI-state (display Poo)
                     (relation-asserted Poo)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-logic ""

   (logical (Paradigma Yes))

   =>

   (assert (UI-state (display Logic)
                     (relation-asserted Logic)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-functional ""

   (logical (Paradigma Yes))

   =>

   (assert (UI-state (display Functional)
                     (relation-asserted Functional)
                     (response No)
                     (valid-answers No Yes))))

(defrule determine-application ""

   (logical (Complementaria Yes))

   =>

   (assert (UI-state (display Aplicacion)
                     (relation-asserted Aplicacion)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-pweb ""

   (logical (Aplicacion Yes))

   =>

   (assert (UI-state (display Pweb)
                     (relation-asserted Pweb)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-client ""

   (logical (Pweb Yes))

   =>

   (assert (UI-state (display Client)
                     (relation-asserted Client)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-games ""

   (logical (Aplicacion Yes))

   =>

   (assert (UI-state (display Games)
                     (relation-asserted Games)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-mobile ""

   (logical (Aplicacion Yes))

   =>

   (assert (UI-state (display Mobile)
                     (relation-asserted Mobile)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-platform ""

   (logical (Aplicacion Yes))

   =>

   (assert (UI-state (display Platform)
                     (relation-asserted Platform)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-scientific ""

   (logical (Aplicacion Yes))

   =>

   (assert (UI-state (display Scientific)
                     (relation-asserted Scientific)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-expert ""

   (logical (Aplicacion Yes))

   =>

   (assert (UI-state (display Expert)
                     (relation-asserted Expert)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-embeded ""

   (logical (Aplicacion Yes))

   =>

   (assert (UI-state (display Embedded)
                     (relation-asserted Embedded)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-natural ""

   (logical (Aplicacion Yes))

   =>

   (assert (UI-state (display Natural)
                     (relation-asserted Natural)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-basedata ""

   (logical (Aplicacion Yes))

   =>

   (assert (UI-state (display DataBase)
                     (relation-asserted DataBase)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-economic ""

   (logical (Finalidad Yes))

   =>

   (assert (UI-state (display Economic)
                     (relation-asserted WellP)
                     (response Yes)
                     (valid-answers No Yes))))

(defrule determine-high ""

   (logical (Finalidad Yes))

   =>

   (assert (UI-state (display HighDemand)
                     (relation-asserted HighDemand)
                     (response Yes)
                     (valid-answers No Yes))))








;;;***************
;;;* Conclusiones *
;;;***************
   

(defrule easy-learn-conclusion ""

   (logical (Aprender Yes)
	    (MuyFacil     Yes))

   
   =>

   (assert (UI-state (display AppInventor)
                     (state final))))

(defrule python-learn-conclusion ""

   (logical (Aprender Yes)
	    (Facil     Yes))

   
   =>

   (assert (UI-state (display Python)
                     (state final))))

(defrule c-learn-conclusion ""

   (logical (Aprender Yes)
	    (Dificil     Yes))

   
   =>

   (assert (UI-state (display C)
                     (state final))))

(defrule java-learn-conclusion ""

   (logical (Aprender Yes)
	    (Dificil     No)
	    (Facil       No))

   
   =>

   (assert (UI-state (display Java)
                     (state final))))

(defrule javaOnly-learn-conclusion ""

   (logical (Poo No))

   
   =>

   (assert (UI-state (display JavaOnly)
                     (state final))))

(defrule prolog-learn-conclusion ""

   (logical (Logic No))

   
   =>

   (assert (UI-state (display Prolog)
                     (state final))))

(defrule haskell-learn-conclusion ""

   (logical (Functional No))

   
   =>

   (assert (UI-state (display Haskell)
                     (state final))))

(defrule Client-learn-conclusion ""

   (logical (Client Yes))

   
   =>

   (assert (UI-state (display ClientSide)
                     (state final))))

(defrule Sercer-learn-conclusion ""

   (logical (Client No))

   
   =>

   (assert (UI-state (display ServerSide)
                     (state final))))

(defrule games-learn-conclusion ""

   (logical (Games Yes))

   
   =>

   (assert (UI-state (display CGames)
                     (state final))))

(defrule mobile-learn-conclusion ""

   (logical (Mobile Yes))

   
   =>

   (assert (UI-state (display JOMobile)
                     (state final))))

(defrule platform-learn-conclusion ""

   (logical (Platform Yes))

   
   =>

   (assert (UI-state (display JavaPlatform)
                     (state final))))

(defrule scientific-learn-conclusion ""

   (logical (Scientific Yes))

   
   =>

   (assert (UI-state (display MPython)
                     (state final))))

(defrule expert-learn-conclusion ""

   (logical (Expert Yes))

   
   =>

   (assert (UI-state (display BestExpert)
                     (state final))))


(defrule embedded-learn-conclusion ""

   (logical (Embedded Yes))

   
   =>

   (assert (UI-state (display CEmbedded)
                     (state final))))

(defrule pnatural-learn-conclusion ""

   (logical (Natural Yes))

   
   =>

   (assert (UI-state (display PNatural)
                     (state final))))

(defrule data-learn-conclusion ""

   (logical (DataBase Yes))

   
   =>

   (assert (UI-state (display SData)
                     (state final))))

(defrule plsql-learn-conclusion ""

   (logical (WellP Yes))

   
   =>

   (assert (UI-state (display Plsql)
                     (state final))))

(defrule demand-learn-conclusion ""

   (logical (HighDemand Yes))

   
   =>

   (assert (UI-state (display Demand)
                     (state final))))


;;;***************
;;;* FINAL RULES *
;;;***************
   
                     
(defrule no-repairs ""

   (declare (salience -10))
  
   (logical (UI-state (id ?id)))
   
   (state-list (current ?id))
     
   =>
  
   (assert (UI-state (display MechanicRepair)
                     (state final))))
                     
;;;*************************
;;;* GUI INTERACTION RULES *
;;;*************************

(defrule ask-question

   (declare (salience 5))
   
   (UI-state (id ?id))
   
   ?f <- (state-list (sequence $?s&:(not (member$ ?id ?s))))
             
   =>
   
   (modify ?f (current ?id)
              (sequence ?id ?s))
   
   (halt))

(defrule handle-next-no-change-none-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
                      
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-response-none-end-of-chain

   (declare (salience 10))
   
   ?f <- (next ?id)

   (state-list (sequence ?id $?))
   
   (UI-state (id ?id)
             (relation-asserted ?relation))
                   
   =>
      
   (retract ?f)

   (assert (add-response ?id)))   

(defrule handle-next-no-change-middle-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)

   ?f2 <- (state-list (current ?id) (sequence $? ?nid ?id $?))
     
   (UI-state (id ?id) (response ?response))
   
   =>
      
   (retract ?f1)
   
   (modify ?f2 (current ?nid))
   
   (halt))

(defrule handle-next-change-middle-of-chain

   (declare (salience 10))
   
   (next ?id ?response)

   ?f1 <- (state-list (current ?id) (sequence ?nid $?b ?id $?e))
     
   (UI-state (id ?id) (response ~?response))
   
   ?f2 <- (UI-state (id ?nid))
   
   =>
         
   (modify ?f1 (sequence ?b ?id ?e))
   
   (retract ?f2))
   
(defrule handle-next-response-end-of-chain

   (declare (salience 10))
   
   ?f1 <- (next ?id ?response)
   
   (state-list (sequence ?id $?))
   
   ?f2 <- (UI-state (id ?id)
                    (response ?expected)
                    (relation-asserted ?relation))
                
   =>
      
   (retract ?f1)

   (if (neq ?response ?expected)
      then
      (modify ?f2 (response ?response)))
      
   (assert (add-response ?id ?response)))   

(defrule handle-add-response

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id ?response)
                
   =>
      
   (str-assert (str-cat "(" ?relation " " ?response ")"))
   
   (retract ?f1))   

(defrule handle-add-response-none

   (declare (salience 10))
   
   (logical (UI-state (id ?id)
                      (relation-asserted ?relation)))
   
   ?f1 <- (add-response ?id)
                
   =>
      
   (str-assert (str-cat "(" ?relation ")"))
   
   (retract ?f1))   

(defrule handle-prev

   (declare (salience 10))
      
   ?f1 <- (prev ?id)
   
   ?f2 <- (state-list (sequence $?b ?id ?p $?e))
                
   =>
   
   (retract ?f1)
   
   (modify ?f2 (current ?p))
   
   (halt))
   

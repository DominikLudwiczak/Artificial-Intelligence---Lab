(define
	(domain world-of-blocks)
	(:requirements :adl)
	(:predicates
		(on-top ?x ?y)
		(on-floor ?x)
		(clear ?x)
		(any-pickedup)
		(pickedup ?x)
	)
	
	; pickup the block ?x from the block ?y
	(:action pickup-from-block
		:parameters (?x ?y)
		:precondition
		(and
			(clear ?x)
			(on-top ?x ?y)
			(not (any-pickedup))
		)
		:effect
		(and
			(not (on-top ?x ?y))
			(clear ?y)
			(any-pickedup)
			(pickedup ?x)
		)
	)
	
	; pickup the block ?x from the floor
	(:action pickup-from-floor
		:parameters (?x)
		:precondition
		(and
			(clear ?x)
			(on-floor ?x)
			(not (any-pickedup))
		)
		:effect
		(and
			(not (on-floor ?x))
			(any-pickedup)
			(pickedup ?x)
		)
	)
	
	; putdown the block ?x to the block ?y
	(:action putdown-to-block
		:parameters (?y ?x)
		:precondition
		(and
			(clear ?x)
			(clear ?y)
			(pickedup ?x)
		)
		:effect
		(and
			(on-top ?x ?y)
			(not (clear ?y))
			(not (on-floor ?x))
			(not (any-pickedup))
			(not (pickedup ?x))
		)
	)
	
	; putdown the block ?x to the floor
	(:action putdown-to-floor
		:parameters (?x)
		:precondition
		(and
			(clear ?x)
			(pickedup ?x)
		)
		:effect
		(and
			(on-floor ?x)
			(not (any-pickedup))
			(not (pickedup ?x))
		)
	)
)
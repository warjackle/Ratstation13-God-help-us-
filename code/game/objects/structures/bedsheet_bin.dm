/*
CONTAINS:
BEDSHEETS
LINEN BINS
*/

/obj/item/bedsheet
	name = "Fur bedsheet"
	desc = "A makeshift bedsheet from animal hide, or other hides. It smells weird."
	icon = 'icons/obj/bedsheets.dmi'
	lefthand_file = 'icons/mob/inhands/misc/bedsheet_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/bedsheet_righthand.dmi'
	icon_state = "sheetwhite"
	inhand_icon_state = "sheetwhite"
	slot_flags = ITEM_SLOT_NECK
	layer = MOB_LAYER
	throwforce = 0
	throw_speed = 1
	throw_range = 2
	w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE
	dying_key = DYE_REGISTRY_BEDSHEET

	dog_fashion = /datum/dog_fashion/head/ghost
	var/list/dream_messages = list("white")

/obj/item/bedsheet/attack(mob/living/M, mob/user)
	if(!attempt_initiate_surgery(src, M, user))
		..()

/obj/item/bedsheet/attack_self(mob/user)
	if(!user.CanReach(src))		//No telekenetic grabbing.
		return
	if(!user.dropItemToGround(src))
		return
	if(layer == initial(layer))
		layer = ABOVE_MOB_LAYER
		to_chat(user, "<span class='notice'>You cover yourself with [src].</span>")
		pixel_x = 0
		pixel_y = 0
	else
		layer = initial(layer)
		to_chat(user, "<span class='notice'>You smooth [src] out beneath you.</span>")
	add_fingerprint(user)
	return

/obj/item/bedsheet/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_WIRECUTTER || I.get_sharpness())
		var/obj/item/stack/sheet/cloth/C = new (get_turf(src), 3)
		transfer_fingerprints_to(C)
		C.add_fingerprint(user)
		qdel(src)
		to_chat(user, "<span class='notice'>You tear [src] up.</span>")
	else
		return ..()

/obj/item/bedsheet/blue
	icon_state = "sheetblue"
	inhand_icon_state = "sheetblue"
	dream_messages = list("blue")

/obj/item/bedsheet/green
	icon_state = "sheetgreen"
	inhand_icon_state = "sheetgreen"
	dream_messages = list("green")

/obj/item/bedsheet/grey
	icon_state = "sheetgrey"
	inhand_icon_state = "sheetgrey"
	dream_messages = list("grey")

/obj/item/bedsheet/orange
	icon_state = "sheetorange"
	inhand_icon_state = "sheetorange"
	dream_messages = list("orange")

/obj/item/bedsheet/purple
	icon_state = "sheetpurple"
	inhand_icon_state = "sheetpurple"
	dream_messages = list("purple")

/obj/item/bedsheet/patriot
	name = "patriotic bedsheet"
	desc = "For some reason you feel safe with it over you. A false safety to be sure."
	icon_state = "sheetUSA"
	inhand_icon_state = "sheetUSA"
	dream_messages = list("THIS ACTION DOES NOT HAVE MY CONSENT", "SUMMON THE ELECTOR COUNTS", "HE SHALL MARSHAL THE MEN", "Gryphons.")

/obj/item/bedsheet/rainbow
	name = "Norscan Bedsheet"
	desc = "A multicolored blanket. It's actually several different sheets cut up and sewn together. Bearing the colors of Red, Green, Pink, and Blue."
	icon_state = "sheetrainbow"
	inhand_icon_state = "sheetrainbow"
	dream_messages = list("Bloody battles", "Burning villages", "Pillaging Villages", "Vomiting on Villages", "Tricking Villages", "Overruning villages", "A beautiful dream of Death")

/obj/item/bedsheet/red
	icon_state = "sheetred"
	inhand_icon_state = "sheetred"
	dream_messages = list("red")

/obj/item/bedsheet/yellow
	icon_state = "sheetyellow"
	inhand_icon_state = "sheetyellow"
	dream_messages = list("yellow")

/obj/item/bedsheet/mime
	name = "Grey Seer's blanket"
	desc = "You don't feel safe being in the same room as this blanket, much less looking at it."
	icon_state = "sheetmime"
	inhand_icon_state = "sheetmime"
	dream_messages = list("Victory", "Many plans", "Hate for all", "Betrayal", "The Horned Rat")

/obj/item/bedsheet/clown
	name = "Goblin's blanket"
	desc = "A crude attempt to mimic other blankets, made out of boar and stitched together while blackout drunk"
	icon_state = "sheetclown"
	inhand_icon_state = "sheetrainbow"
	dream_messages = list("*snicker*", "laughter", "Stupid rats", "Squigs", "Gobbos best", "Biggest and da best")

/obj/item/bedsheet/captain
	name = "Clan Head's bedsheet"
	desc = "Made from the fur of only the finest of dead slaves, interwoven by blind plague monks, technologically advanced by Skrye engineers, Mutated into shape by expert Moulder mutators, and then guarded by Morr stormvermin to reach your petty claws."
	icon_state = "sheetcaptain"
	inhand_icon_state = "sheetcaptain"
	dream_messages = list("All of them are yours", "Dead no-furs", "Endless Food", "Great Plague", "A warpfire thrower", "The horned rat")

/obj/item/bedsheet/rd
	name = "Clan Skrye's bedsheet"
	desc = "It appears to be imbuded with warp-stone conduits for. Some reason you cannot possibly fathom."
	icon_state = "sheetrd"
	inhand_icon_state = "sheetrd"
	dream_messages = list("A green fabricated sun", "Crashing this moon, with no survivors", "a bomb", "Power armor", "Warp-stone, yes-yes", "maniacal laughter", "IT'S LOST CONTAINMENT")

// for Free Golems.
/obj/item/bedsheet/rd/royal_cape
	name = "Royal Cape of the Emperor"
	desc = "Majestic."
	dream_messages = list("Nuln", "Sigmar", "Marienburg", "Gryphons", "Dawi")

/obj/item/bedsheet/medical
	name = "Clan Pestilence blanket"
	desc = "Woven by blind plague monks after they vomit up the substence and dipped into fur."
	icon_state = "sheetmedical"
	inhand_icon_state = "sheetmedical"
	dream_messages = list("Great plague", "Sickness", "Food and plague", "a no-fur skin melting")

/obj/item/bedsheet/cmo
	name = "Clan Pestilence Head's blanket."
	desc = "Oh sweet merciful Shallya why?! The contents of this sheet shall never be uttered least the horned rat takes notice."
	icon_state = "sheetcmo"
	inhand_icon_state = "sheetcmo"
	dream_messages = list("You cannot fathom this", "Eternal life", "Plague, BIGGER PLAGUE", "COFF", "Vomit into the food", "You can feel the blanket twitching", "Plague the city")

/obj/item/bedsheet/hos
	name = "Clan Morr Head's blanket"
	desc = "It's decorated with all of the kills from the arena, each strand a different kill!"
	icon_state = "sheethos"
	inhand_icon_state = "sheethos"
	dream_messages = list("Eat-kill-yes", "Killing elves", "Eatting Prisoners", "Stupid other-clans", "a Halberd", "Armor", "Kill, slaughter!")

/obj/item/bedsheet/hop
	name = "Clan Moulder Head's Blanket"
	desc = "Made from the freshest of rat ogre fur, guranteed"
	icon_state = "sheethop"
	inhand_icon_state = "sheethop"
	dream_messages = list("A chaos sp-", "The green moon", "Convert them all", "a hell-abomination", "a giant rat", "a rat ogre", "Mutations")

/obj/item/bedsheet/ce
	name = "Skaven Slave's Blanket"
	desc = "Your surprised they wasted skin on these blankets."
	icon_state = "sheetce"
	inhand_icon_state = "sheetce"
	dream_messages = list("authority", "Moulder", "Morr", "Skrye", "Advancement", "Pestilence", "Food")

/obj/item/bedsheet/qm
	name = "quartermaster's bedsheet"
	desc = "It is decorated with a crate emblem in silver lining.  It's rather tough, and just the thing to lie on after a hard day of pushing paper."
	icon_state = "sheetqm"
	inhand_icon_state = "sheetqm"
	dream_messages = list("a grey ID", "a shuttle", "a crate", "a sloth", "the quartermaster")

/obj/item/bedsheet/chaplain
	name = "Rat Ogre Blanket"
	desc = "You could smother a no-fur with this blanket!"
	icon_state = "sheetchap"
	inhand_icon_state = "sheetchap"
	dream_messages = list("grghr", "the gods", "HUNGER", "PAIN", "BIG")

/obj/item/bedsheet/brown
	icon_state = "sheetbrown"
	inhand_icon_state = "sheetbrown"
	dream_messages = list("brown")

/obj/item/bedsheet/black
	icon_state = "sheetblack"
	inhand_icon_state = "sheetblack"
	dream_messages = list("black")

/obj/item/bedsheet/centcom
	name = "\improper Eshin Blanket "
	desc = "Made to be practically invisible and easily lost."
	icon_state = "sheetcentcom"
	inhand_icon_state = "sheetcentcom"
	dream_messages = list("Nippon training", "Killing the clan-heads", "Stabbing a no-fur in the back", "Sneaking behind a wizard")

/obj/item/bedsheet/syndie
	name = "Adventurer's bedsheet"
	desc = "Made out of conventional materials for the long haul."
	icon_state = "sheetsyndie"
	inhand_icon_state = "sheetsyndie"
	dream_messages = list("a green moon", "Your 'friends'", "Can't trust em", "Bloody wizards...")

/obj/item/bedsheet/cult
	name = "Elven Bedsheet"
	desc = "Made out of perfected materials, never to be underestimated of course."
	icon_state = "sheetcult"
	inhand_icon_state = "sheetcult"
	dream_messages = list("Home", "Dark kin", "Widowmaker", "Politics", "*smug*")

/obj/item/bedsheet/wiz
	name = "wizard's bedsheet"
	desc = "Crafted from enchanted materials from the colleges of magic!"
	icon_state = "sheetwiz"
	inhand_icon_state = "sheetwiz"
	dream_messages = list("a book", "an explosion", "lightning", "a staff", "a skeleton", "a robe", "magic")

/obj/item/bedsheet/nanotrasen
	name = "\improper Dwarven bedsheet"
	desc = "It has the Dwarven logo on it and has an aura of duty."
	icon_state = "sheetNT"
	inhand_icon_state = "sheetNT"
	dream_messages = list("Bugsman beer", "THAT'S A GRUDGIN")

/obj/item/bedsheet/ian
	icon_state = "sheetian"
	inhand_icon_state = "sheetian"
	dream_messages = list("a dog", "a corgi", "woof", "bark", "arf")

/obj/item/bedsheet/cosmos
	name = "cosmic space bedsheet"
	desc = "Made from the dreams of those who wonder at the stars."
	icon_state = "sheetcosmos"
	inhand_icon_state = "sheetcosmos"
	dream_messages = list("the infinite cosmos", "Hans Zimmer music", "a flight through space", "the galaxy", "being fabulous", "shooting stars")
	light_power = 2
	light_range = 1.4

/obj/item/bedsheet/random
	icon_state = "random_bedsheet"
	name = "random bedsheet"
	desc = "If you're reading this description ingame, something has gone wrong! Honk!"

/obj/item/bedsheet/random/Initialize()
	..()
	var/type = pick(typesof(/obj/item/bedsheet) - /obj/item/bedsheet/random)
	new type(loc)
	return INITIALIZE_HINT_QDEL

/obj/item/bedsheet/dorms
	icon_state = "random_bedsheet"
	name = "random dorms bedsheet"
	desc = "If you're reading this description ingame, something has gone wrong! Honk!"

/obj/item/bedsheet/dorms/Initialize()
	..()
	var/type = pickweight(list("Colors" = 80, "Special" = 20))
	switch(type)
		if("Colors")
			type = pick(list(/obj/item/bedsheet,
				/obj/item/bedsheet/blue,
				/obj/item/bedsheet/green,
				/obj/item/bedsheet/grey,
				/obj/item/bedsheet/orange,
				/obj/item/bedsheet/purple,
				/obj/item/bedsheet/red,
				/obj/item/bedsheet/yellow,
				/obj/item/bedsheet/brown,
				/obj/item/bedsheet/black))
		if("Special")
			type = pick(list(/obj/item/bedsheet/patriot,
				/obj/item/bedsheet/rainbow,
				/obj/item/bedsheet/ian,
				/obj/item/bedsheet/cosmos,
				/obj/item/bedsheet/nanotrasen))
	new type(loc)
	return INITIALIZE_HINT_QDEL

/obj/structure/bedsheetbin
	name = "linen bin"
	desc = "It looks rather cosy."
	icon = 'icons/obj/structures.dmi'
	icon_state = "linenbin-full"
	anchored = TRUE
	resistance_flags = FLAMMABLE
	max_integrity = 70
	var/amount = 10
	var/list/sheets = list()
	var/obj/item/hidden = null

/obj/structure/bedsheetbin/empty
	amount = 0
	icon_state = "linenbin-empty"
	anchored = FALSE


/obj/structure/bedsheetbin/examine(mob/user)
	. = ..()
	if(amount < 1)
		. += "There are no bed sheets in the bin."
	else if(amount == 1)
		. += "There is one bed sheet in the bin."
	else
		. += "There are [amount] bed sheets in the bin."


/obj/structure/bedsheetbin/update_icon_state()
	switch(amount)
		if(0)
			icon_state = "linenbin-empty"
		if(1 to 5)
			icon_state = "linenbin-half"
		else
			icon_state = "linenbin-full"

/obj/structure/bedsheetbin/fire_act(exposed_temperature, exposed_volume)
	if(amount)
		amount = 0
		update_icon()
	..()

/obj/structure/bedsheetbin/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/bedsheet))
		if(!user.transferItemToLoc(I, src))
			return
		sheets.Add(I)
		amount++
		to_chat(user, "<span class='notice'>You put [I] in [src].</span>")
		update_icon()

	else if(default_unfasten_wrench(user, I, 5))
		return

	else if(I.tool_behaviour == TOOL_SCREWDRIVER)
		if(flags_1 & NODECONSTRUCT_1)
			return
		if(amount)
			to_chat(user, "<span clas='warn'>The [src] must be empty first!</span>")
			return
		if(I.use_tool(src, user, 5, volume=50))
			to_chat(user, "<span clas='notice'>You disassemble the [src].</span>")
			new /obj/item/stack/rods(loc, 2)
			qdel(src)

	else if(amount && !hidden && I.w_class < WEIGHT_CLASS_BULKY)	//make sure there's sheets to hide it among, make sure nothing else is hidden in there.
		if(!user.transferItemToLoc(I, src))
			to_chat(user, "<span class='warning'>\The [I] is stuck to your hand, you cannot hide it among the sheets!</span>")
			return
		hidden = I
		to_chat(user, "<span class='notice'>You hide [I] among the sheets.</span>")


/obj/structure/bedsheetbin/attack_paw(mob/user)
	return attack_hand(user)

/obj/structure/bedsheetbin/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(isliving(user))
		var/mob/living/L = user
		if(!(L.mobility_flags & MOBILITY_PICKUP))
			return
	if(amount >= 1)
		amount--

		var/obj/item/bedsheet/B
		if(sheets.len > 0)
			B = sheets[sheets.len]
			sheets.Remove(B)

		else
			B = new /obj/item/bedsheet(loc)

		B.forceMove(drop_location())
		user.put_in_hands(B)
		to_chat(user, "<span class='notice'>You take [B] out of [src].</span>")
		update_icon()

		if(hidden)
			hidden.forceMove(drop_location())
			to_chat(user, "<span class='notice'>[hidden] falls out of [B]!</span>")
			hidden = null


	add_fingerprint(user)
/obj/structure/bedsheetbin/attack_tk(mob/user)
	if(amount >= 1)
		amount--

		var/obj/item/bedsheet/B
		if(sheets.len > 0)
			B = sheets[sheets.len]
			sheets.Remove(B)

		else
			B = new /obj/item/bedsheet(loc)

		B.forceMove(drop_location())
		to_chat(user, "<span class='notice'>You telekinetically remove [B] from [src].</span>")
		update_icon()

		if(hidden)
			hidden.forceMove(drop_location())
			hidden = null


	add_fingerprint(user)

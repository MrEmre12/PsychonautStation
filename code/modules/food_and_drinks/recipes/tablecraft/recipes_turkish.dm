/datum/crafting_recipe/food/cig_kofte
	name = "Çiğ Köfte"
	reqs = list(
		/obj/item/food/grown/onion = 1,
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/grown/wheat = 1,
		/datum/reagent/consumable/lemonjuice = 1,
		/datum/reagent/consumable/nutriment/fat/oil/olive = 2,
	)
	result = /obj/item/food/cig_kofte
	category = CAT_TURKISH

/datum/crafting_recipe/food/cacik
	name = "Cacık"
	reqs = list(
		/datum/reagent/consumable/ayran = 1,
		/obj/item/food/grown/cucumber = 1,
		/obj/item/reagent_containers/cup/bowl = 1
	)
	result = /obj/item/food/cacik
	category = CAT_TURKISH

/datum/crafting_recipe/food/lahmacun
	name = "Lahmacun"
	reqs = list(
		/obj/item/food/grown/tomato = 1,
		/obj/item/food/grown/onion = 1,
		/obj/item/food/doughslice = 1,
		/obj/item/food/raw_patty = 1,
	)
	result = /obj/item/food/raw_lahmacun
	category = CAT_TURKISH

/datum/crafting_recipe/food/raw_beyti
	name = "Beyti"
	reqs = list(
		/obj/item/food/grown/tomato = 2,
		/datum/reagent/consumable/nutriment/fat/oil/olive = 2,
		/obj/item/food/grown/onion = 1,
		/obj/item/food/doughslice = 1,
		/obj/item/food/raw_patty = 1,
	)
	result = /obj/item/food/raw_beyti
	category = CAT_TURKISH

/datum/crafting_recipe/food/reaction/ayran
	reaction = /datum/chemical_reaction/drink/ayran
	category = CAT_TURKISH

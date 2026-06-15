return {
     misc = {
            challenge_names = {
                c_mm_Insanity = "Insanity",
                c_mm_POF = "Poem of Finale",
                c_mm_SP = "Sophisticated Spending",
                c_mm_BC = "Blank Canvas",
                c_mm_AC = "Animal Compainions",
                c_mm_TTF = "To The Finale",
            },

            v_text = {
                ch_c_mm_TTF = {
                    "Face only {C:attention}Wuthering Waves{} Blinds",
                },
                ch_c_mm_BC = {
                    "Start with absolutely no cards in your deck",
                },
                ch_c_mm_AC = {
                    "(This challenge was all my sister's idea lollllllll)",
                },
            },
    },
    descriptions = {
        Joker = {
            j_mm_worker = {
                name = "Sleepless Worker",
                text = {
            "Every scoring {C:attention}9{} or {C:attention}5{} gives",
            "{C:chips}+24 Chips{} and {C:mult}+7 Mult{}",
            "Earn {C:money}$10{} every {C:attention}10{} scored",
            "{C:attention}9s{} or {C:attention}5s{}",
            "{C:inactive}(#1# remaining){}"
                }
            },
            j_mm_crystalization = {
                name = "Sophisticated Crystalization",
                text = {
            "Gains {X:mult,C:white}X#1#{} Mult for every",
            "{C:money}$#2#{} you have",
            "{C:inactive}(Currently: {X:mult,C:white}X#3#{}{C:inactive}){}"
                }
            },
            j_mm_mysterious = {
                name = "Mysterious Maiden",
                text = {
            "Gains {X:mult,C:white}X#1#{} Mult for every",
            "{C:blue}Blue Seal{} in your full deck",
            "{C:inactive}(Currently: {X:mult,C:white}X#2#{}{C:inactive}){}"
                }
            },
            j_mm_pero = {
                name = "PERO",
                text = {
            "{X:mult,C:white}X#1#{} Mult if all",
            "joker slots are full",
                }
            },
            j_mm_seafaring = {
                name = "Seafaring",
                text = {
            "Gains {C:chips}+7 Chips{} permanently",
            "for each {C:blue}hand{} played",
            "{C:inactive}(Currently: {C:chips}+#1#{}{C:inactive}){}"
                }
            },
            j_mm_acolyte = {
                name = "Devoted Acolyte",
                text = {
            "All {C:attention}Boss Blind{} requirements",
            "are lowered by {C:green}25%{}",
                }
            },
            j_mm_bard = {
                name = "Common Bard",
                text = {
            "Gains {X:mult,C:white}X#1#{} for",
            "each {C:blue}Common Joker{}",
            "{C:inactive}(Currently: {X:mult,C:white}X#2#{}{C:inactive}){}",      
                }
            },
            j_mm_two_sided = {
                name = "Two-Sided Face",
                text = {
            "Retriggers the {C:attention}right-most Joker{}",
            "{C:attention}two{} additional times",
            "but has a {C:green}#1# in #2# chance{}",
            "to {C:red}DESTROY{} a random one if",
            "any blind is selected"
                }
            },
            j_mm_butterfly = {
                name = "Butterfly Memory",
                text = {
            "Creates a random {C:dark_edition}Negative{}",
            "{C:spectral}Spectral{} card when {C:attention}Boss Blind{}",
            "is selected"
                }
            },
            j_mm_lively = {
                name = "Lively Child",
                text = {
            "Retriggers all {C:attention}played{}",
            "{C:attention}Enhanced{} cards"
                }
            },
            j_mm_justice = {
                name = "Warrior Justice",
                text = {
            "Gains {X:mult,C:white}X#1#{} for every",
            "{C:attention}Boss Blind{} defeated",
            "{C:inactive}(Currently: {X:mult,C:white}X#2#{}{C:inactive}){}"
                }
            },
            j_mm_logical = {
                name = "Logical Calculation",
                text = {
            "{C:red}+5{} Mult if played hand contains",
            "a {C:attention}Flush{}",
            "{C:inactive}(Currently: {C:red}+#3#{}{C:inactive}){}"
                }
            },
            j_mm_leader = {
                name = "Driven Leader",
                text = {
            "Gains {C:red}+3{} Mult for every",
            "{C:attention}face{} card in your {C:attention}remaining deck{}", 
            "{C:inactive}(Currently: {C:red}+#1#{}{C:inactive}){}"
                }
            },
            j_mm_artist = {
                name = "Expressive Artist",
                text = {
            "When any {C:attention}Blind{} is selected,",
            "create a random enhanced {C:attention}face{} card"
                }
            },
            j_mm_monk = {
                name = "Focused Monk",
                text = {
            "{X:chips,C:white}X3{} Chips if played hand",
            "contains only {C:attention}#2#s{}",
            "{C:inactive}(Suit changes each round){}"
                }
            },
            j_mm_puppet = {
                name = "Puppet Master",
                text = {
            "{X:mult,C:white}X2{} Mult if played hand",
            "contains {C:attention}five{} cards"
                }
            },
            j_mm_photosyntheic = {
                name = "Photosynthetic Rejuvenation",
                text = {
            "Gain {C:blue}+2{} Hands and {C:red}+1{} Discard",
            "when facing {C:attention}Boss Blinds{}"
                }
            },
            j_mm_sighted = {
                name = "True Sighted",
                text = {
            "Gains {X:mult,C:white}X0.1{} Mult if played",
            "hand contains a {C:attention}Pair{}",
            "{C:inactive}(Currently: {X:mult,C:white}X#3#{}{C:inactive}){}"
                }
            },
            j_mm_gladiator = {
                name = "Ruthless Gladiator",
                text = {
            "All scoring {C:attention}face{} cards give",
            "{X:mult,C:white}X#1#{} when facing {C:attention}Boss Blinds{}"
                }
            },
            j_mm_sun = {
                name = "Solar Flares",
                text = {
            "Gives {X:mult,C:white}X3{} Mult on your",
            "{C:attention}first{} and {C:attention}last{} hand"    
            }
        },

            j_mm_moon = {
            name = "Moon Revolution",
            text = {
            "Gives {C:mult}+28{} Mult on your",
            "{C:attention}first{} and {C:attention}last{} hand"                
            }
        },
            j_mm_knight = {
            name = "Wandering Knight",
            text = {
        "Played {C:attention}Aces{} give {X:mult,C:white}X2{} Mult",
        "but you lose half your hands"
            }
        },
             j_mm_sinflame = {
            name = "Eternal Sinflame",
            text = {
            "If all Hands are used,",
            "gain {X:mult,C:white}X0.25{} Mult.",
            "{C:inactive}(Currently: {X:mult,C:white}X#1#{}{C:inactive}){}"    
        }
    },
              j_mm_swordsman = {
            name = "Lone Wayfaring Swordsman",
            text = {
            "Gain {X:chips,C:white}X0.05{} Chips for each",
            "scoring {C:attention}face{} card.",
            "{C:inactive}(Currently: {X:chips,C:white}X#1#{}{C:inactive}){}"
            }
        },

            j_mm_cutter = {
        name = "Threadcutter",
        text = {
            "Gains {C:red}+2{} Mult if {C:attention}five{}",
            "cards are discarded at the same time",
            "{C:inactive}(Currently: {C:red}+#2#{}{C:inactive}){}"
        }
    },
         j_mm_colors = {
        name = "New Colors",
        text = {
            "Other {C:attention}Edition{} Jokers",
            "give {X:mult,C:white}X1.5{} Mult"
        }
    },
        j_mm_professor = {
        name = "Star of the Professor",
        text = {
            "All consumed {C:planet}Planet{} cards",
            "upgrade their poker hand {C:attention}twice{}"
        }
    },
        j_mm_doctor = {
        name = "The Doctor",
        text = {
            "On your {C:attention}first{} hand, give the lowest",
            "rank card in hand {C:dark_edition}Polychrome{}"
        }
    },
        j_mm_soliskin = {
        name = "Soliskin",
        text = {
            "Every card played after the {C:attention}first{}",
            "hand gives {C:mult}+5{} Mult"
        }
    },
        j_mm_ghost = {
        name = "Digital Ghost",
        text = {
            "Alternates between {X:mult,C:white}X2{} Mult",
            "and {X:chips,C:white}X3{} Chips every round"
        }
    },
        j_mm_snow = {
        name = "Scarlet Snow",
        text = {
            "{C:green}#1# in #2#{} chance to apply",
            "the {C:attention}Glacio{} enhancement",
            "to scoring cards",
            "Gains {C:chips}+5{} Chips for every {C:attention}Glacio{}",
            "card in your full deck",
            "{C:inactive}(Currently: {C:chips}+#3#{}{C:inactive}){}"
        }
    },
        j_mm_head = {
        name = "Head of Startorch Academy",
        text = {
            "Every {C:attention}5{} rounds, create a",
            "{C:dark_edition}Negative{} {C:attention}Perishable{} copy of the",
            "last Joker you obtained",
            "{C:inactive}({C:attention}#1#{} {C:inactive}left{}{}{C:inactive}){}"
        }
    },
    j_mm_artificial = {
        name = "Artificial Student",
        text = {
            "After {C:attention}3{} rounds, create {C:attention}3{} random",
            "vanilla tags, {C:red}self destructs{}",
            "{C:inactive}({C:attention}#1#{} {C:inactive}left{}{}{C:inactive}){}"
        }
    },
            j_mm_chosen = {
            name = "CHOSEN ONE",
            text = {
        "All played {C:attention}Enhanced{} cards give",
        "{X:mult,C:white}X2{} Mult"
            },

        },

},

    Blind = {
        bl_mm_goat = {
            name = "The Goat",
            text = {
                "Cards with ranks 2-7",
                "are debuffed",
            },
        },

        bl_mm_melody = {
            name = "The Melody",
            text = {
                "Each card you play has a #1# in #2# chance",
                "to become debuffed.",
            },
        },

        bl_mm_play = {
            name = "The Play",
            text = {
                "One of your highest rarity",
                "Jokers is debuffed",
            },
        },

        bl_mm_corruption = {
             name = "Corrupted Leviathan",
        text = {
            "#1#"
        }
        },
    },




Back = {
		b_mm_resonator = {
			name = "Resonator Deck",
				text = {
			"Start with one random",
            "{C:attention}Balatro Waves{} Joker",
            "{C:inactive}(Excluding CHOSEN ONE){}"
				},
			},
        },

        Edition = {
            e_mm_sword = {
                name = "Sword",
                text = {
            "Gains {C:mult}+3{} Mult",
            "per blind defeated",
            "{C:inactive}(Currently: {C:red}+#1#{}{C:inactive}){}"
                },
            },
            e_mm_broadblade = {
                name = "Broadblade",
                text = {
            "Gains {X:mult,C:white}X0.1{} Mult",
            "per boss blind defeated",
            "{C:inactive}(Currently: {X:mult,C:white}X#1#{}{C:inactive}){}"
                },
            },
             e_mm_pistols = {
                name = "Pistols",
                text = {
            "Gains {C:chips}+1{} Chips",
            "per playing card triggered",
            "{C:inactive}(Currently: {C:chips}+#1#{}{C:inactive}){}"
                },
            },
              e_mm_gauntlets = {
                name = "Gauntlets",
                text = {
            "Gains {X:chips,C:white}X0.05{} Chips",
            "per hand played",
            "{C:inactive}(Currently: {X:chips,C:white}X#1#{}{C:inactive}){}"
                },
            },
              e_mm_rectifier = {
                name = "Rectifier",
                text = {
            "Gain {C:money}$3{}",
            "every round",
                },
            },
        },

        

    Enhanced = {
        m_mm_aero = {
        name = "Aero",
        text = {
            "{C:green}#1# in #2#{} chance to gain {C:money}$5{}",
            "when discarded"
        },
    },

        m_mm_fusion = {
        name = "Fusion",
        text = {
            "{C:green}#1# in #2#{} chance for {X:mult,C:white}X3{} Mult",
            "{C:green}#3# in #4#{} chance for {X:mult,C:white}/3{} Mult"
        },
    },

     m_mm_spectro = {
        name = "Spectro",
        text = {
            "Gains {C:red}+1{} Mult every time",
            "this card is triggered",
            "{C:inactive}(Currently: {C:red}+#1#{}{C:inactive}){}"
        },
    },  

     m_mm_electro = {
        name = "Electro",
        text = {
            "{X:chips,C:white}X2{} Chips if played",
            "on the {C:attention}last hand{}"
        },
    },

  m_mm_glacio = {
        name = "Glacio",
        text = {
            "This card cannot be",
            "{C:attention}debuffed{}"
        },
    },

      m_mm_havoc = {
        name = "Havoc",
        text = {
           "{X:mult,C:white}X1.5{} Mult but destroy one",
            "random card from hand"
        },
    },
},

	Tarot = {
        c_mm_bamboo = {
            name = "Bamboo Grove",
        text = {
            "Enhances {C:attention}1{} selected card",
            "with {C:green}Aero{}"
        },
    },
        c_mm_glory = {
             name = "Ruin of Glory",
        text = {
            "Enhances {C:attention}1{} selected card",
            "with {C:red}Fusion{}"
        },
    },
        c_mm_inverted = {
        name = "Inverted Tower",
        text = {
            "Enhances {C:attention}1{} selected card",
            "with {C:attention}Spectro{}"
        },
    },
        c_mm_origin = {
        name = "Origin Chamber",
        text = {
            "Enhances {C:attention}1{} selected card",
            "with {C:purple}Electro{}"
        },
    },
       c_mm_snowfall = {
       name = "Snowfall Realm",
        text = {
            "Enhances {C:attention}2{} selected card",
            "with {C:blue}Glacio{}"
        },
    },

       c_mm_crownless = {
        name = "Statue of Crownless",
        text = {
            "Enhances {C:attention}1{} selected card",
            "with {C:pink}Havoc{}"
        },
    },
},



Voucher = {
			v_mm_minor = {
				name = "Minor Pity",
				text = {
			"{C:attention}Banner Packs{} appear {C:attention}2x{}",
            "more often"
				},
			},
            v_mm_major = {
				name = "Major Pity",
				text = {
		"Adds {C:attention}+1{} new shop area dedicated",
        "to only {C:attention}Banner Packs{}",
        "{C:inactive}(Banner Packs no longer appear in the booster area{C:inactive}){}"
				},
			},
        },

ForgingTide = {
       c_mm_ForgingTide = {
				name = "Forging Tide",
				text = {
		"Equip a random {C:dark_edition}Weapon{}",
        "to a random {C:attention}Joker{}"
				},
			},
        },
Other = { 
      p_mm_jinzhou_pack = {
                name = "Jinzhou Banner",
                text = {
           "Test your luck and have a chance",
           "at getting a {C:attention}Balatro Waves{} Joker",
           "from Jinzhou",
           "{C:inactive}(Every 5 Banner Packs guarantees a {C:attention}Balatro Waves{} {C:inactive}Joker if none were found){}"
                },
            },  
    p_mm_rinascita_pack = {
                name = "Rinascita Banner",
                text = {
           "Test your luck and have a chance",
           "at getting a {C:attention}Balatro Waves{} Joker",
           "from Rinascita",
           "{C:inactive}(Every 5 Banner Packs guarantees a {C:attention}Balatro Waves{} {C:inactive}Joker if none were found){}"
                },
            },  
    p_mm_blackshores_pack = {
                name = "Black Shores Banner",
                text = {
           "Test your luck and have a chance",
           "at getting a {C:attention}Balatro Waves{} Joker",
           "from Black Shores",
           "{C:inactive}(Every 5 Banner Packs guarantees a {C:attention}Balatro Waves{} {C:inactive}Joker if none were found){}"
                },
            },
    p_mm_lahairoi_pack = {
                name = "Lahai-Roi Banner",
                text = {
           "Test your luck and have a chance",
           "at getting a {C:attention}Balatro Waves{} Joker",
           "from Lahai-Roi",
           "{C:inactive}(Every 5 Banner Packs guarantees a {C:attention}Balatro Waves{} {C:inactive}Joker if none were found){}"
                },
            },              
        },

    },
}

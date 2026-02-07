return {
     misc = {
            challenge_names = {
                c_mm_Insanity = "Insanity",
                c_mm_POF = "Poem of Finale",
                c_mm_SP = "Sophisticated Spending",
                c_mm_BC = "Blank Canvas",
                c_mm_TTF = "To The Finale",
            },

            v_text = {
                ch_c_mm_TTF = {
                    "Only {C:attention}Wuthering Waves{} Jokers can be bought",
                },
                ch_c_mm_TTF2 = {
                    "(With the exception of Jimbo)",
                },
                ch_c_mm_TTF3 = {
                    "Face only {C:attention}Wuthering Waves{} Blinds",
                },
                ch_c_mm_BC = {
                    "Start with absolutely no cards in your deck",
                },
            },
    },
    descriptions = {
        Joker = {
            j_worker = {
                name = "Sleepless Worker",
                text = {
                    "Every scoring 9 or 5 gives",
            "{C:chips}+24 Chips{} and {C:mult}+7 Mult{}"
                }
            },
            j_crystalization = {
                name = "Sophisticated Crystalization",
                text = {
            "Gains {X:mult,C:white}X#1#{} Mult for every",
            "{C:money}$#2#{} you have",
            "Currently: {X:mult,C:white}X#3#{}"
                }
            },
            j_mysterious = {
                name = "Mysterious Maiden",
                text = {
            "Gains {X:mult,C:white}X#1#{} Mult for every",
            "{C:blue}Blue Seal{} in your full deck",
            "Currently: {X:mult,C:white}X#2#{}"
                }
            },
            j_pero = {
                name = "PERO",
                text = {
            "{X:mult,C:white}X#1#{} Mult if all",
            "joker slots are full",
                }
            },
            j_seafaring = {
                name = "Seafaring",
                text = {
            "Gains {C:chips}+7 Chips{} permanently",
            "for each {C:blue}hand{} played",
            "Currently: {C:chips}+#1#{} Chips{}"
                }
            },
            j_acolyte = {
                name = "Devoted Acolyte",
                text = {
            "All {C:attention}Boss Blind{} requirements",
            "are lowered by {C:green}25%{}",
                }
            },
            j_bard = {
                name = "Common Bard",
                text = {
            "Gains {X:mult,C:white}X#1#{} for",
            "each {C:blue}Common Joker{}",
            "Currently: {X:mult,C:white}X#2#{}",      
                }
            },
            j_two_sided = {
                name = "Two-Sided Face",
                text = {
            "Retriggers the {C:attention}right-most Joker{}",
            "{C:attention}two{} additional times",
            "but has a {C:green}#1# in #2# chance{}",
            "to {C:red}DESTROY{} a random one if",
            "any blind is selected"
                }
            },
            j_butterfly = {
                name = "Butterfly Memory",
                text = {
            "Creates a random {C:dark_edition}Negative{}",
            "{C:spectral}Spectral{} card when {C:attention}Boss Blind{}",
            "is selected"
                }
            },
            j_lively = {
                name = "Lively Child",
                text = {
            "Retriggers all {C:attention}played{}",
            "{C:attention}Enhanced{} cards"
                }
            },
            j_justice = {
                name = "Warrior Justice",
                text = {
            "Gains {X:mult,C:white}X#1#{} for every",
            "{C:attention}Boss Blind{} defeated",
            "Currently: {X:mult,C:white}X#2#{}"
                }
            },
            j_logical = {
                name = "Logical Calculation",
                text = {
            "{C:red}+5{} Mult if played hand contains",
            "a {C:attention}Flush{}",
            "Currently: {C:red}+#3#{}"
                }
            },
            j_leader = {
                name = "Driven Leader",
                text = {
            "Gains {C:red}+4{} Mult for every",
            "{C:attention}face{} card in your {C:attention}remaining deck{}", 
            "Currently: {C:red}+#1#{}"
                }
            },
            j_artist = {
                name = "Expressive Artist",
                text = {
            "When any {C:attention}Blind{} is selected,",
            "create a random enhanced {C:attention}face{} card"
                }
            },
            j_monk = {
                name = "Focused Monk",
                text = {
            "{X:chips,C:white}X2{} Chips if played hand",
            "contains only {C:attention}#2#s{}",
            "{C:inactive}(Suit changes each round){}"
                }
            },
            j_puppet = {
                name = "Puppet Master",
                text = {
            "{X:mult,C:white}X2{} Mult if played hand",
            "contains {C:attention}five{} cards"
                }
            },
            j_photosynthetic = {
                name = "Photosynthetic Rejuvenation",
                text = {
            "Gain {C:blue}+1{} Hand and {C:red}+1{} Discard",
            "when facing {C:attention}Boss Blinds{}"
                }
            },
            j_sighted = {
                name = "True Sighted",
                text = {
            "Gains {X:mult,C:white}X0.1{} Mult if played",
            "hand contains a {C:attention}Pair{}",
            "Currently: {X:mult,C:white}X#3#{}"
                }
            },
            j_gladiator = {
                name = "Ruthless Gladiator",
                text = {
            "All scoring {C:attention}face{} cards give",
            "{X:mult,C:white}X1.5{} when facing {C:attention}Boss Blinds{}"
                },
            j_sun = {
                name = "Solar Flares",
                text = {
            "Gives {X:mult,C:white}X3{} Mult on your",
            "{C:attention}first{} and {C:attention}last{} hand"    
            },

            j_moon = {
            name = "Moon Revolution",
            text = {
            "Gives {C:mult}+28{} Mult on your",
            "{C:attention}first{} and {C:attention}last{} hand"                
            },
            j_knight = {
            name = "Wandering Knight",
            text = {
        "Played {C:attention}Aces{} give {X:mult,C:white}X2{} Mult",
        "but you lose half your hands"
            },
            j_cutter = {
        name = "Threadcutter",
        text = {
            "Gains {C:red}+2{} Mult if {C:attention}five{}",
            "cards are discarded at the same time",
            "{C:inactive}(Currently: {C:red}+#2#{}{C:inactive}){}"
        },
         j_colors = {
        name = "New Colors",
        text = {
            "Other {C:attention}Edition{} Jokers",
            "give {X:mult,C:white}X1.5{} Mult"
        },
        j_professor = {
        name = "Star of the Professor",
        text = {
            "All consumed {C:planet}Planet{} cards",
            "upgrade their poker hand {C:attention}twice{}"
        },
            j_chosen = {
            name = "CHOSEN ONE",
            text = {
        "All played {C:attention}Enhanced{} cards give",
        "{X:mult,C:white}X2{} Mult"
            },

        },
    },
},
},
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

        bl_melody = {
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

        bl_corruption = {
            name = "The Corruption",
            text = {
                "All non-enhanced cards",
                "are debuffed",
            },
        },
    },



Back = {
		b_mm_resonator = {
			name = "Resonator Deck",
				text = {
			"Start with one random",
            "{C:attention}Balatro Waves{} Joker",
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
            "Gains {C:red}+0.5{} Mult every time",
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
            "{X:mult,C:white}X1.5{} Mult but discard one",
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
			"{C:green}Uncommon Jokers{} appear {C:attention}2x{}",
            "more often"
				},
			},
            v_mm_major = {
				name = "Major Pity",
				text = {
			"{C:red}Rare Jokers{} appear {C:attention}4x{}",
            "more often"
				},
			},
        },
    },
},
},
}

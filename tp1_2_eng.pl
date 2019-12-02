 % STARTERS
starter(artichauts_melanie).
starter(truffes_sous_le_sel).
starter(cresson_oeuf_poche).

 % MEAT
meat(grillade_de_boeuf).
meat(poulet_au_tilleul).

 % FISH
fish(bar_aux_algues).
fish(truite_meuniere).

 % DESSERT
dessert(sorbet_aux_poires).
dessert(fraises_chantilly).
dessert(melon_surprise).

% DRINKS (25 cl)
drink(mineral_water(hepar)).
drink(red_wine(morgon)).
drink(beer(gueuze)).

% CALORIFIC VALUES
calories(artichauts_melanie, 150).
calories(truffes_sous_le_sel, 212).
calories(cresson_oeuf_poche, 202).
calories(grillade_de_boeuf,  532).
calories(poulet_au_tilleul, 400).
calories(bar_aux_algues, 292).
calories(truite_meuniere, 254).
calories(sorbet_aux_poires, 223).
calories(fraises_chantilly, 289).
calories(melon_surprise, 122).
calories(mineral_water(hepar), 0).
calories(red_wine(morgon), 175).
calories(beer(gueuze), 250).


% Regles

plat(P) :- meat(P).
plat(P) :- fish(P).

% repas_leger(R)vraie si R est une liste [Entree,Plat,Dessert,Boisson] représentant un repas de moinsde 600 calories.
repas_leger(R) :- R= [E,P,D,B],
     starter(E), plat(P), dessert(D), drink(B),
    calories(E,X), calories(P, Y), calories(D, Z), calories(B, W),
    (X+Y+Z+W)<600.

repas_leger(R, X, L) :- R= [E,P,D,B],
     starter(E), plat(P), dessert(D), drink(B),
    calories(E,V), calories(P, Y), calories(D, Z), calories(B, W),
    X is (V+Y+Z+W), X<L.










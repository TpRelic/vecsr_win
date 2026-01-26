type(bathroom).
can_open(bathroom).
rooms(bathroom).
recipient(bathroom).
readable(bathroom).

type(floor).
surfaces(floor).
floor(floor).
cover_object(floor).
recipient(floor).
readable(floor).

type(wall).
surfaces(wall).
walls(wall).
cover_object(wall).
hangable(wall).
lookable(wall).

type(ceiling).
surfaces(ceiling).
ceiling(ceiling).
cover_object(ceiling).
hangable(ceiling).

type(rug).
grabbable(rug).
sittable(rug).
movable(rug).
surfaces(rug).
decor(rug).
cover_object(rug).
furniture(rug).
props(rug).
has_paper(rug).
cuttable(rug).

type(curtains).
can_open(curtains).
movable(curtains).
decor(curtains).
cover_object(curtains).
props(curtains).
hangable(curtains).
lookable(curtains).
has_paper(curtains).
cuttable(curtains).
readable(curtains).

type(ceilinglamp).
lieable(ceilinglamp).
has_switch(ceilinglamp).
ceiling(ceilinglamp).
decor(ceilinglamp).
lamps(ceilinglamp).
props(ceilinglamp).
appliances(ceilinglamp).
hangable(ceilinglamp).

type(walllamp).
has_switch(walllamp).
decor(walllamp).
lamps(walllamp).
props(walllamp).
has_plug(walllamp).
hangable(walllamp).
readable(walllamp).

type(bathtub).
lieable(bathtub).
surfaces(bathtub).
containers(bathtub).
props(bathtub).
recipient(bathtub).
appliances(bathtub).

type(towelrack).
grabbable(towelrack).
movable(towelrack).
decor(towelrack).
hangable(towelrack).

type(wallshelf).
surfaces(wallshelf).
decor(wallshelf).
furniture(wallshelf).
containers(wallshelf).
props(wallshelf).
recipient(wallshelf).
hangable(wallshelf).

type(stall).
cover_object(stall).
has_plug(stall).
readable(stall).

type(toilet).
can_open(toilet).
appliances(toilet).

type(bathroomcabinet).
grabbable(bathroomcabinet).
movable(bathroomcabinet).
decor(bathroomcabinet).
containers(bathroomcabinet).
recipient(bathroomcabinet).
hangable(bathroomcabinet).

type(bathroomcounter).
movable(bathroomcounter).
surfaces(bathroomcounter).
decor(bathroomcounter).
containers(bathroomcounter).
props(bathroomcounter).

type(faucet).
lieable(faucet).
has_switch(faucet).
appliances(faucet).

type(door).
lieable(door).
movable(door).
decor(door).
doors(door).
props(door).
recipient(door).
hangable(door).
lookable(door).

type(doorjamb).
grabbable(doorjamb).
surfaces(doorjamb).
decor(doorjamb).
hangable(doorjamb).
readable(doorjamb).

type(towel).
grabbable(towel).
can_open(towel).
movable(towel).
surfaces(towel).
props(towel).
recipient(towel).
hangable(towel).
cuttable(towel).

type(perfume).
can_open(perfume).
movable(perfume).
containers(perfume).
pourable(perfume).

type(deodorant).
grabbable(deodorant).
can_open(deodorant).
lieable(deodorant).
readable(deodorant).

type(hairproduct).
grabbable(hairproduct).
can_open(hairproduct).
containers(hairproduct).
props(hairproduct).
hangable(hairproduct).
cuttable(hairproduct).
readable(hairproduct).

type(facecream).
can_open(facecream).
containers(facecream).
props(facecream).
cream(facecream).
readable(facecream).

type(plate).
sittable(plate).
surfaces(plate).
decor(plate).
cover_object(plate).
containers(plate).
recipient(plate).
cuttable(plate).

type(toothpaste).
containers(toothpaste).

type(painkillers).
props(painkillers).
readable(painkillers).

type(waterglass).
props(waterglass).
pourable(waterglass).

type(toothbrush).
grabbable(toothbrush).
movable(toothbrush).
props(toothbrush).
appliances(toothbrush).
hangable(toothbrush).

type(barsoap).
grabbable(barsoap).
can_open(barsoap).
lieable(barsoap).
movable(barsoap).
hangable(barsoap).

type(candle).
grabbable(candle).
movable(candle).
decor(candle).
containers(candle).
lookable(candle).
readable(candle).

type(window).
has_switch(window).
hangable(window).

type(lightswitch).
has_switch(lightswitch).
hangable(lightswitch).
readable(lightswitch).

type(washingmachine).
movable(washingmachine).
has_switch(washingmachine).
containers(washingmachine).
props(washingmachine).
has_plug(washingmachine).
electronics(washingmachine).
appliances(washingmachine).
clothes(washingmachine).
readable(washingmachine).

type(bedroom).
can_open(bedroom).
lieable(bedroom).
rooms(bedroom).
recipient(bedroom).
readable(bedroom).

type(tablelamp).
movable(tablelamp).
has_switch(tablelamp).
decor(tablelamp).
lamps(tablelamp).
furniture(tablelamp).
props(tablelamp).
has_plug(tablelamp).
appliances(tablelamp).

type(garbagecan).
movable(garbagecan).
containers(garbagecan).
recipient(garbagecan).

type(nightstand).
grabbable(nightstand).
movable(nightstand).
surfaces(nightstand).
decor(nightstand).
furniture(nightstand).
containers(nightstand).
props(nightstand).

type(bookshelf).
movable(bookshelf).
surfaces(bookshelf).
decor(bookshelf).
furniture(bookshelf).
containers(bookshelf).
recipient(bookshelf).
hangable(bookshelf).

type(chair).
sittable(chair).
movable(chair).
furniture(chair).
props(chair).
lookable(chair).

type(desk).
sittable(desk).
movable(desk).

type(bed).
movable(bed).
cover_object(bed).
furniture(bed).
props(bed).
readable(bed).

type(coffeetable).
sittable(coffeetable).
movable(coffeetable).
surfaces(coffeetable).
decor(coffeetable).
furniture(coffeetable).
containers(coffeetable).
props(coffeetable).

type(closet).
can_open(closet).
movable(closet).
cover_object(closet).
furniture(closet).
containers(closet).
recipient(closet).
hangable(closet).
readable(closet).

type(hanger).
recipient(hanger).
hangable(hanger).
cuttable(hanger).

type(closetdrawer).
movable(closetdrawer).
furniture(closetdrawer).
containers(closetdrawer).
recipient(closetdrawer).
readable(closetdrawer).

type(clothesshirt).
grabbable(clothesshirt).
can_open(clothesshirt).
movable(clothesshirt).
cover_object(clothesshirt).
recipient(clothesshirt).
hangable(clothesshirt).
clothes(clothesshirt).
has_paper(clothesshirt).
cuttable(clothesshirt).
readable(clothesshirt).

type(clothespants).
can_open(clothespants).
recipient(clothespants).
hangable(clothespants).
cuttable(clothespants).

type(clothespile).
grabbable(clothespile).
movable(clothespile).
props(clothespile).
hangable(clothespile).
cuttable(clothespile).
readable(clothespile).

type(mouse).

type(mousemat).
grabbable(mousemat).
lieable(mousemat).
movable(mousemat).
surfaces(mousemat).
decor(mousemat).
cover_object(mousemat).
furniture(mousemat).
props(mousemat).
cuttable(mousemat).

type(keyboard).
grabbable(keyboard).
movable(keyboard).
has_switch(keyboard).
has_plug(keyboard).
electronics(keyboard).
readable(keyboard).

type(computer).
lieable(computer).
movable(computer).
has_switch(computer).
has_plug(computer).
electronics(computer).
readable(computer).

type(cpuscreen).
has_switch(cpuscreen).
electronics(cpuscreen).

type(radio).
has_switch(radio).
electronics(radio).

type(wallpictureframe).
surfaces(wallpictureframe).
decor(wallpictureframe).
furniture(wallpictureframe).
props(wallpictureframe).
hangable(wallpictureframe).

type(orchid).
can_open(orchid).
decor(orchid).
hangable(orchid).
lookable(orchid).
readable(orchid).

type(pillow).
grabbable(pillow).
eatable(pillow).
movable(pillow).
surfaces(pillow).
decor(pillow).
props(pillow).
pourable(pillow).

type(cellphone).
grabbable(cellphone).
movable(cellphone).
has_switch(cellphone).
has_plug(cellphone).
electronics(cellphone).

type(photoframe).
grabbable(photoframe).
has_switch(photoframe).
decor(photoframe).
cover_object(photoframe).
furniture(photoframe).
props(photoframe).
has_plug(photoframe).
hangable(photoframe).
lookable(photoframe).

type(book).
can_open(book).
lieable(book).
movable(book).
has_paper(book).
readable(book).

type(box).
cover_object(box).
containers(box).
pourable(box).
recipient(box).

type(mug).
grabbable(mug).
movable(mug).
decor(mug).
containers(mug).
props(mug).
pourable(mug).
recipient(mug).
readable(mug).

type(cupcake).
eatable(cupcake).
props(cupcake).
cuttable(cupcake).
readable(cupcake).
food(cupcake).

type(wineglass).
grabbable(wineglass).
movable(wineglass).
surfaces(wineglass).
decor(wineglass).
containers(wineglass).
props(wineglass).
pourable(wineglass).
hangable(wineglass).
lookable(wineglass).

type(slippers).
can_open(slippers).
movable(slippers).
decor(slippers).

type(folder).
containers(folder).
recipient(folder).
hangable(folder).

type(kitchen).
rooms(kitchen).
props(kitchen).
recipient(kitchen).
lookable(kitchen).
readable(kitchen).

type(tvstand).
grabbable(tvstand).
movable(tvstand).
furniture(tvstand).
has_plug(tvstand).
electronics(tvstand).
appliances(tvstand).
hangable(tvstand).

type(kitchentable).
sittable(kitchentable).
movable(kitchentable).
surfaces(kitchentable).
has_switch(kitchentable).
furniture(kitchentable).
containers(kitchentable).
props(kitchentable).
recipient(kitchentable).
hangable(kitchentable).
lookable(kitchentable).
readable(kitchentable).

type(bench).
has_switch(bench).
has_plug(bench).
electronics(bench).

type(kitchencabinet).
lieable(kitchencabinet).
surfaces(kitchencabinet).
decor(kitchencabinet).
cover_object(kitchencabinet).
furniture(kitchencabinet).
containers(kitchencabinet).
props(kitchencabinet).
recipient(kitchencabinet).
hangable(kitchencabinet).
readable(kitchencabinet).

type(kitchencounter).
movable(kitchencounter).
surfaces(kitchencounter).
cover_object(kitchencounter).
containers(kitchencounter).
props(kitchencounter).
readable(kitchencounter).

type(kitchencounterdrawer).
grabbable(kitchencounterdrawer).
lieable(kitchencounterdrawer).
movable(kitchencounterdrawer).
surfaces(kitchencounterdrawer).
containers(kitchencounterdrawer).
recipient(kitchencounterdrawer).

type(sink).
lieable(sink).
has_switch(sink).
has_plug(sink).
appliances(sink).
readable(sink).

type(powersocket).
grabbable(powersocket).
has_plug(powersocket).
electronics(powersocket).

type(wallphone).
grabbable(wallphone).
has_switch(wallphone).
props(wallphone).
electronics(wallphone).

type(tv).
grabbable(tv).
movable(tv).
has_switch(tv).
has_plug(tv).
electronics(tv).
appliances(tv).
hangable(tv).
lookable(tv).

type(clock).
movable(clock).
has_switch(clock).
has_plug(clock).
electronics(clock).
readable(clock).

type(washingsponge).
grabbable(washingsponge).
movable(washingsponge).
surfaces(washingsponge).
decor(washingsponge).
props(washingsponge).
hangable(washingsponge).
cuttable(washingsponge).

type(dishwashingliquid).
grabbable(dishwashingliquid).
can_open(dishwashingliquid).
movable(dishwashingliquid).
pourable(dishwashingliquid).
has_paper(dishwashingliquid).
readable(dishwashingliquid).

type(fryingpan).
grabbable(fryingpan).
containers(fryingpan).
props(fryingpan).
recipient(fryingpan).
appliances(fryingpan).
readable(fryingpan).

type(cutleryknife).
can_open(cutleryknife).
movable(cutleryknife).
props(cutleryknife).
hangable(cutleryknife).
cuttable(cutleryknife).
readable(cutleryknife).

type(cutleryfork).
can_open(cutleryfork).
props(cutleryfork).
hangable(cutleryfork).
readable(cutleryfork).

type(dishbowl).
grabbable(dishbowl).
can_open(dishbowl).
movable(dishbowl).
surfaces(dishbowl).
decor(dishbowl).
cover_object(dishbowl).
containers(dishbowl).
props(dishbowl).
pourable(dishbowl).
recipient(dishbowl).
hangable(dishbowl).
readable(dishbowl).

type(condimentbottle).
grabbable(condimentbottle).
can_open(condimentbottle).
movable(condimentbottle).
surfaces(condimentbottle).
containers(condimentbottle).
props(condimentbottle).
pourable(condimentbottle).
recipient(condimentbottle).
hangable(condimentbottle).

type(condimentshaker).
grabbable(condimentshaker).
can_open(condimentshaker).
has_switch(condimentshaker).
containers(condimentshaker).
props(condimentshaker).
appliances(condimentshaker).
hangable(condimentshaker).

type(paper).
can_open(paper).
lieable(paper).
movable(paper).
hangable(paper).
has_paper(paper).

type(stovefan).
has_switch(stovefan).
props(stovefan).
has_plug(stovefan).
electronics(stovefan).
appliances(stovefan).
readable(stovefan).

type(fridge).
can_open(fridge).
movable(fridge).
has_switch(fridge).
containers(fridge).
recipient(fridge).
has_plug(fridge).
electronics(fridge).
appliances(fridge).

type(coffeemaker).
grabbable(coffeemaker).
has_switch(coffeemaker).
has_plug(coffeemaker).
electronics(coffeemaker).
appliances(coffeemaker).

type(coffeepot).
grabbable(coffeepot).
movable(coffeepot).
has_switch(coffeepot).
containers(coffeepot).
props(coffeepot).
pourable(coffeepot).
has_plug(coffeepot).
appliances(coffeepot).
hangable(coffeepot).

type(toaster).
has_switch(toaster).
has_plug(toaster).
electronics(toaster).
appliances(toaster).

type(breadslice).
surfaces(breadslice).
cuttable(breadslice).
food(breadslice).

type(stove).
has_switch(stove).
appliances(stove).

type(oventray).
grabbable(oventray).
surfaces(oventray).
has_switch(oventray).
cover_object(oventray).
containers(oventray).
recipient(oventray).
has_plug(oventray).
appliances(oventray).
hangable(oventray).
readable(oventray).

type(microwave).
grabbable(microwave).
has_switch(microwave).
has_plug(microwave).
electronics(microwave).
appliances(microwave).

type(bananas).

type(whippedcream).
decor(whippedcream).
cover_object(whippedcream).
containers(whippedcream).
props(whippedcream).
cream(whippedcream).
readable(whippedcream).

type(pie).
readable(pie).

type(bellpepper).
grabbable(bellpepper).
cuttable(bellpepper).
food(bellpepper).

type(salmon).
grabbable(salmon).
eatable(salmon).
cuttable(salmon).
readable(salmon).
food(salmon).

type(chips).
electronics(chips).
readable(chips).

type(candybar).
eatable(candybar).
can_open(candybar).
movable(candybar).
readable(candybar).
food(candybar).

type(chocolatesyrup).
cover_object(chocolatesyrup).
pourable(chocolatesyrup).
food(chocolatesyrup).

type(crackers).
movable(crackers).
surfaces(crackers).
cuttable(crackers).
food(crackers).

type(creamybuns).
props(creamybuns).
lookable(creamybuns).
readable(creamybuns).

type(cereal).
grabbable(cereal).
can_open(cereal).
props(cereal).
pourable(cereal).
hangable(cereal).
readable(cereal).
food(cereal).

type(livingroom).
sittable(livingroom).
lieable(livingroom).
has_switch(livingroom).
rooms(livingroom).
props(livingroom).
recipient(livingroom).
readable(livingroom).

type(sofa).
can_open(sofa).
sittable(sofa).
lieable(sofa).
movable(sofa).
decor(sofa).
furniture(sofa).
readable(sofa).

type(cabinet).
can_open(cabinet).
lieable(cabinet).
cover_object(cabinet).
furniture(cabinet).
recipient(cabinet).
hangable(cabinet).
readable(cabinet).

type(apple).
eatable(apple).
cuttable(apple).
food(apple).

type(lime).
pourable(lime).
drinkable(lime).

type(peach).
eatable(peach).
decor(peach).
cuttable(peach).
food(peach).

type(plum).
lieable(plum).
hangable(plum).
cuttable(plum).
readable(plum).

type(remotecontrol).
electronics(remotecontrol).
readable(remotecontrol).


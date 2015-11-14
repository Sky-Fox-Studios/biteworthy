module Ingredients

  # :fruit
  # :herb
  # :grain
  # :nut
  # :bean_legume_pulse
  # :vegetable
  # :animal_product
  # :dairy
  # :meat
  # :poultry
  # :fish

  fruits = %w(Avocado
    Abiu
    Açaí
    Acerola
    Ackee
    Almond
    Apple
    Apricot
    Araza
    Atemoya
    Babaco
    Bacupari
    Bacuri
    Bael
    Banana
    Barbadine
    Barberry
    Bearberry
    Berry
    Betel\ Nut
    Bignay
    Bilberry
    Biribi
    Black\ mulberry
    Blackberry
    Blood\ Orange
    Blueberry
    Boquila
    Boysenberry
    Brazil\ Nut
    Burmese\ grape
    Caimito
    Calamansi
    CamuCamu
    Canistel
    Cape\ Gooseberry
    Capulin\ Cherry
    Carambola
    Cardamom
    Carob
    Cashew
    Cassabanana
    Cassava
    Ceriman
    Chayote
    Cherimoya
    Cherry
    Cherry\ of\ the\ Rio
    Grande
    Chokeberry
    Chokecherry
    Citron
    Clementine
    Cloudberry
    Coco\ Plum
    Cocona
    Coconut
    Cocoplum
    Coffea
    Cola\ Nut
    Cornelian\ cherry
    Cranberry
    Crowberry
    Cupuaçu
    Cupuassu
    Currant
    Curry\ Leaf\ Tree
    Custard\ Apple
    Damson\ plum
    Date
    Dewberry
    Dragonfruit\ /\ Pitaya
    Duku
    Durian
    Elderberry
    Elephant\ Apple
    Emblica
    Falberry
    Feijoa
    Genip
    Golden\ Apple
    Gooseberry
    Goumi
    Granadilla
    Grapes
    Greengage
    Grumichama
    Guanabana
    Guava
    Hackberry
    Hog\ Plum
    Honeysuckle
    Huckleberry
    Huito
    Ice\ Cream\ Bean
    Jaboticaba
    Jackfruit
    Jambul
    Jocote
    Jujube
    Kabosu
    Kei\ Apple
    Keppel\ fruit
    Keule
    Kiwifruit
    Korlan
    Kumquat
    Langsat
    Lanzones
    Lardizabala
    Lemon
    Lingonberry
    Loganberry
    Longan
    Loquat
    Lúcuma
    Lychee
    Mabolo
    Madrono
    Malay\ Apple
    Mammee\ Apple
    Mamoncillo
    Mandarin
    Mango
    Mangosteen
    Maprang
    Maqui
    Mayapple
    Maypop
    Medlar
    Melon\ Pear
    Miracle\ Fruit
    Mombin,\ Purple
    Morinda
    Mulberry
    Mung\ Bean
    Muskmelon
    Naartjie
    Nance
    Nannyberry
    Naranjilla
    Noni
    Nutmeg
    Oil\ Palm
    Olallieberries
    Orange
    Oregon\ grape
    Oroblanco
    Papaya
    Papaya
    Passionfruit
    Pawpaw
    Pawpaw
    Peach
    Peach\ Palm
    Peanut
    Peanut\ butter\ fruit
    Pear
    Pecan
    Pepino
    Pequi
    Persimmon
    Peumo
    Pewa
    Phalsa
    Pili\ Nut
    Pindo\ Palm
    Pineapple
    Pistachio
    Plantain
    Plum
    Pois\ doux
    Pomegranate
    Pomelo
    Pommecythère
    Pond-apple
    Pulasan
    Pummelo
    Pupunha
    Purple\ Mombin
    Quince
    Rambutan
    Raspberry
    Riberry
    Rose\ hip
    Rowan
    Safou
    Salak
    Salmonberry
    Santol
    Sapodilla
    Sea\ Grape
    Sea-buckthorn
    Shipova
    Soncoya
    Soursop
    Soybean
    Spanish\ Lime
    Star\ Apple
    Strawberry
    Strawberry\ guava
    Sugar\ Apple
    Summer\ squash
    Surinam\ Cherry
    Sweet\ Lemon
    Sweetsop
    Tamarillo
    Tamarind
    Tayberry
    Thimbleberry
    Ugniberry
    Vanilla
    Wampee
    Water\ Apple
    Watermelon
    Wax\ Jambu
    White\ Sapote
    Wineberry
    Winged\ Bean
    Wolfberry
    Wood\ Apple
    Yangmei
    Yantok
    Zucchini)

  fruits.each do |fruit|
    Ingredient.find_or_create_by(name: fruit, fruit: true)
  end

  vegetables = %w(
    Ahipa
    Amaranth
    Aonori
    Arracacha
    Artichoke
    Arugula
    Asparagus
    Bamboo\ shoot
    Beet
    Beetroot
    Bell\ pepper
    Bitterleaf
    Bok\ choy
    Broadleaf
    arrowhead
    Broccoli
    Broccoli\ Rabe
    Brussels\ sprout
    Burdock
    Cabbage
    Camas
    Canna
    Cardoon
    Carola
    Carrot
    Cassava
    Catsear
    Caulerpa
    Cauliflower
    Celeriac
    Celery
    Celtuce
    Ceylon\ spinach
    Chard
    Chaya
    Chickweed
    Chicory
    Chinese\ artichoke
    Chinese\ cabbage
    Chinese\ Mallow
    Chrysanthemum
    Collard\ greens
    Corn\ salad
    Cress
    Dabberlocks\ aka
    badderlocks
    Daikon
    Dandelion
    Dulse
    Earthnut\ pea
    Elephant\ Foot\ yam
    Elephant\ Garlic
    Endive
    Ensete
    Epazote
    Fat\ hen
    Fiddlehead
    Florence\ fennel
    Fluted\ pumpkin
    Garden\ cress
    Garden\ Rocket
    Garlic
    Gim
    Ginger
    Gobo
    Golden\ samphire
    Good\ King\ Henry
    Greater\ Plantain
    Hamburg\ parsley
    Hijiki
    Iceberg\ lettuce
    Jerusalem\ artichoke
    Jícama
    Kai-lan
    Kale
    Kohlrabi
    Komatsuna
    Kombu
    Kuka
    Kurrat
    Lagos\ bologi
    Land\ cress
    Laver
    Leek
    Lettuce
    Lizard's\ tail
    Lotus\ root
    Melokhia
    Mizuna\ greens
    Mooli
    Mozuku
    Mustard
    New\ Zealand
    Spinach
    Nopal
    Nori
    Ogonori
    Onion
    Orache
    Pak\ choy
    Paracress
    Parsnip
    Pea
    Pignut
    Plectranthus
    Polk
    Potato
    Prairie\ turnip
    Prussian\ asparagus
    Radicchio
    Radish
    Rutabaga
    Salsify
    Samphire
    Scorzonera
    Sea\ beet
    Sea\ grape
    Sea\ lettuce
    Seakale
    Shallot
    Sierra\ Leone\ bologi
    Skirret
    Soko
    Sorrel
    Spinach
    Spring
    Onion/Scallion
    Squash\ blossoms
    Summer\ purslane
    Sweet
    Swiss\ chard
    Taro
    Tatsoi
    Ti
    Tigernut
    Turnip
    Ulluco
    Wakame
    Wasabi
    Water\ chestnut
    Water\ spinach
    Watercress
    Welsh\ onion
    Wild\ leek
    Winter\ purslane
    Yacón
    Yam
    Yarrow
    Yucca)

  vegetables.each do |vegetable|
    Ingredient.find_or_create_by(name: vegetable, vegetable: true)
  end

  herbs = %w(
    Ajwain
    Akudjura
    Alexanders
    Alfalfa
    Alkanet
    Alligator\ pepper
    Allspice
    Aloe
    Angelica
    Anise
    Aniseed\ myrtle
    Annatto
    Apple\ mint
    Arugula
    Asafoetida
    Asarabacca
    Avens
    Avocado\ Leaf
    Barberry
    Basil
    Basil,\ Lemon
    Bay\ Leaf
    Bergamot
    Black\ Cardamom
    Black\ Mustard
    Blue\ Fenugreek
    Boldo
    Borage
    Calabash\ Nutmeg
    Calendula
    Camphor\ Laurel
    Candle\ nut
    Capers
    Caraway
    Cardamom
    Carob
    Cassia
    Catnip
    Cayenne\ pepper
    Celery\ seed
    Chervil
    Chicory
    Chili\ pepper
    Chipotle
    Chives
    Cicely
    Cilantro
    Cinnamon
    Clary
    Clove
    Coriander
    Costmary
    Cuban\ Oregano
    Cubeb
    Cudweed
    Culantro
    Cumin
    Curry\ Leaf
    Curry\ Plant
    Dill
    Dill\ seed
    Elderflower
    Epazote
    Fennel
    Fenugreek
    Filé\ powder
    Fingerroot
    Galangal,\ greater
    Galangal,\ lesser
    Galingale
    Gambooge
    Garlic
    Garlic\ chives
    Garlic,\ Elephant
    Ginger
    Ginger,\ Torch
    Golpar
    Gotu\ Kola
    Grains\ of\ paradise
    Grains\ of\ Selim
    Ground\ ivy
    Hops
    Horseradish
    Houttuynia
    Huacatay
    Hyssop
    Indonesian\ Bay-Leaf
    Jasmine
    Jimbu
    Juniper\ berry
    Kaffir\ Lime\ Leaves
    Kala\ Jeera
    Keluak
    Kencur
    Kokam
    Korarima
    Koseret
    Lavender
    Lemon\ Balm
    Lemon\ Ironbark
    Lemon\ Myrtle
    Lemon\ Verbena
    Lemongrass
    Lesser\ Calamint
    Lime\ Flower
    Liquorice
    Lovage
    Mace
    Mahlab
    Malabathrum
    Marjoram
    Marsh\ Mallow
    Mastic
    Mesquite
    Mint
    Musk\ mallow
    Mustard\ plant
    Mustard\ seed
    Mustard,\ Black
    Mustard,\ Brown
    Mustard,\ White
    Nasturtium
    Nigella
    Njangsa
    Nutmeg
    Olida
    Oregano
    Orris\ root
    Pandan\ flower
    Pandan\ leaf
    Paprika
    Paracress
    Parsley
    Pepper
    Pepper,\ Dorrigo
    Pepper,\ Long
    Pepper,\ Mountain
    Peppermint
    Peppermint\ Gum
    Perilla
    Pink\ Pepper
    Piper\ sarmentosum
    Quassia
    Ramsons
    Rice\ Paddy\ Herb
    Rosemary
    Rue
    Safflower
    Saffron
    Sage
    Saigon\ Cinnamon
    Salad\ Burnet
    Salep
    Sassafras
    Savory,\ Summer
    Savory,\ Winter
    Silphium
    Sorrel
    Sorrel,\ French
    Sorrel,\ Sheep's
    Spearmint
    Spikenard
    Star\ anise
    Stinging\ Nettle
    Sumac
    Summer\ savory
    Sweet\ woodruff
    Szechuan\ pepper
    Tarragon
    Thyme
    Thyme,\ Lemon
    Turmeric
    Vanilla
    Vietnamese\ Balm
    Vietnamese
    Cinnamon
    Vietnamese
    Coriander
    Wasabi
    Water-pepper
    Wattleseed
    White\ Mustard
    Wild\ thyme
    Willow\ herb
    Winter\ savory
    Wintergreen
    Wood\ Avens
    Woodruff
    Wormwood
    Yellow\ Mustard
    Yerba\ Buena
    Za'atar
    Zedoary)
  herbs.each do |herb|
    Ingredient.find_or_create_by(name: herb, herb: true)
  end

  nuts = %w(
    Almond
    Beech
    Brazil\ nut
    Candlenut
    Cashew
    Cempedak
    Chestnuts
    Chilgoza\ Pine
    Chinese\ Chestnut
    Colocynth
    Colorado\ Pinyon
    Cucurbita\ ficifolia
    Cycads
    Egusi
    Euryale\ ferox
    Filbert
    Fluted\ pumpkin
    Gevuina\ avellana
    Ginkgo
    Gnetum\ gnemon
    Hazel
    Hemp
    Hickory
    Indian\ Beech
    Jackfruit
    Juniper
    Kola\ nut
    Korean\ Pine
    Lotus\ seed
    Macadamia
    Malabar\ chestnut
    Mamoncillo
    Maya\ nut
    Mexican\ Pinyon
    Mongongo
    Monkey-puzzle
    Oak\ acorns
    Ogbono\ nut
    Paradise\ nut
    Peanuts
    Pecan
    Pili\ nut
    Pine\ nuts
    Pistacia
    Podocarps
    Pumpkin\ seed
    Shagbark\ Hickory
    Single-leaf\ Pinyon
    Stone\ Pine
    Sunflower\ seed
    Sweet\ Chestnut
    Terminalia\ catappa
    Walnut
    Water\ Caltr)
  nuts.each do |nut|
    Ingredient.find_or_create_by(name: nut, nut: true)
  end

  bean_legume_pulses = %w(
    Bambara\ groundnut
    Chickpeas
    Cowpeas
    Dry\ beans,
    including\ Common
    bean
    Fava beans
    Hyacinth\ bean
    Lablab
    Lentils
    Lupins
    Moringa\ oleifera
    Peas
    Peanuts
    Pigeon\ peas
    Sterculia
    Velvet\ beans
    Winged\ beans
    Yam\ beans
    Soybeans)
  bean_legume_pulses.each do |bean_legume_pulse|
    Ingredient.find_or_create_by(name: bean_legume_pulse, bean_legume_pulse: true)
  end

  grains = %w(Barley
    Breadnut
    Buckwheat
    Cattail
    Chia
    Flax
    Fonio
    amaranth
    Kañiwa
    Maize-Corn
    Pearl\ Millet
    Oats
    Palmer's\ grass
    Pitseed\ Goosefoot
    Quinoa
    Rice
    Rye
    Sorghum
    Spelt
    Teff
    Triticale
    Wheat
    Wild\ rice
    Wattleseed-acacia\ seed)

  grains.each do |grain|
    Ingredient.find_or_create_by(name: grain, grain: true)
  end

  puts "non meats seeded"

  meats_beef = %w(
    Bison-buffalo
    Carabao
    Cattle
    Veal\ (calves)
    Yak)

  meat_lagomorphs = %w(
    Hare
    Pika
    Rabbit)

  meat_marsupials = %w(
    Kangaroo
    Opossum)

  meat_ovis_sheep = %w(
    Lamb
    Domestic\ Sheep
    (mutton)
    Bighorn\ sheep
    Caprae\ (goats)
    Domestic\ Goat
    Ibex
    Wild\ goat
    Barbary\ Sheep
    Dall\ Sheep
    Mountain\ Goat)

  meat_swine = %w(
    Domestic\ pig\ (pork)
    Peccary\ (Javelina)
    Wild\ boar
    Red\ River\ Hog
    Bushpig)

  meat_venison_cervidae = %w(
    Caribou\ (reindeer)
    Deer
    Moose
    Antelope
    Red\ deer)

  meat_rodents = %w(
    Beaver
    Guinea\ pig
    Capybara
    Muskrat
    Rat
    Squirrel
    Greater\ Cane\ Rat
    Paca\ (Agoutior\ tepezcuintle)
    Nutria
    Groundhog)

  meat_mammals = %w(
    Raccoon
    Weasel
    Camel
    Llama
    Pronghorn)

  meat_reptiles = %w(
    Lizard
    Snake
    Iguana
    Crocodile
    Alligator)

  meat_amphibians = %w(
    Frog
    Salamander
    Toad)

    # ALL MEATS
    all_meats = meats_beef
      .concat(meat_lagomorphs)
      .concat(meat_marsupials)
      .concat(meat_ovis_sheep)
      .concat(meat_swine)
      .concat(meat_venison_cervidae)
      .concat(meat_rodents)
      .concat(meat_mammals)
      .concat(meat_reptiles)
      .concat(meat_amphibians)

  all_meats.each do |meat|
    Ingredient.find_or_create_by(name: meat, meat: true)
  end

  meat_poultry_birds = %w(
    Chicken
    Duck
    Goose
    Turkey)

  meat_game_birds = %w(
    Dove
    Ostrich
    Emu
    Guineafowl
    Pheasant
    Grouse
    Partridge
    Crow
    Quail
    Pigeon
    Woodcock
    Ptarmigan)

    all_poultry = meat_poultry_birds
      .concat(meat_game_birds)

    all_poultry.each do |poultry|
      Ingredient.find_or_create_by(name: poultry, poultry: true)
    end

  meat_fish = %w(
    Anchovy
    Basa
    Bass
    Catfish
    Carp
    Cod
    Crappie
    Eel
    Flounder
    Fugu
    (Tetraodontidae,\ Blow\ fish,\ Puffer\ fish)
    Grouper
    Haddock
    Halibut
    Herring
    Kingfish
    Mackerel
    Mahi\ Mahi
    Marlin
    Perch
    Pike
    Pollock
    Salmon
    Sardine
    Shark
    Snapper
    Sole
    Swordfish
    Tilapia
    Trout
    Tuna
    Walleye)

    meat_fish.each do |fish|
      Ingredient.find_or_create_by(name: fish, fish: true, meat: true)
    end

  meat_echinoderms = %w(
    sea\ urchin)

  puts "ingredients seeded"
end

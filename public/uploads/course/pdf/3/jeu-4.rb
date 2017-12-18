j'system "cls"

class Personne
  attr_accessor :nom, :points_de_vie, :en_vie

  def initialize(nom)
    @nom = nom
    @points_de_vie = 100
    @en_vie = true
  end

  def info

    if en_vie
      return "#{nom} (#{points_de_vie}/100)" # Renvoie le nom et les points de vie si la personne est en vie
    else
      return "#{nom} (vaincu)" # Renvoie le nom et "vaincu" si la personne a été vaincue
    end

  end

  def attaque(personne)

    # On génère les dégats via la fonction "degats" de l'attaquant.
    # Le joueur tappe dur et les méchants moins pour garder un équilibre.
    bobo = degats

    puts "#{nom} attaque #{personne.nom}"

    # On exécute la fonction subit_attaque avec les dégats en paramètre
    personne.subit_attaque(bobo)

  end

  def subit_attaque(degats_recus)

    # On réduit les points de vie en fonction des dégats reçus
    @points_de_vie = @points_de_vie - degats_recus

    puts "#{nom} subit #{degats_recus}hp de dégats !"
    puts ""

    # La vie est inferieur à 1, le personnage est mort
    if @points_de_vie < 1
      @en_vie = false
      puts "#{nom} a été vaincu"
    end
    
  end
end

class Joueur < Personne
  attr_accessor :degats_bonus

  def initialize(nom)
    # Par défaut le joueur n'a pas de dégats bonus
    @degats_bonus = 0

    # Appelle le "initialize" de la classe mère (Personne)
    super(nom)
  end

  def degats

    # On initialise la variable...
    degats = 0

    # Il y a du dégat bonus à utiliser, utilisons le...
    if @degats_bonus > 0
      puts "#{nom} profite de #{@degats_bonus} de dégats bonus"
      degats = @degats_bonus

      # On remet le bonus à zéro après utilisation !
      @degats_bonus = 0
    end

    # Dégats entre 15 et 40
    degats = degats + 15 + rand(25)
    return degats
  end

  def soin

    # 4.times do
    #   puts "Mercurochrome, le pansement des héros"
    # end

    # Soins entre 5 et 30
    soins = 5 + rand(25)

    puts "#{nom} regagne de la vie !"

    # On calcule les nouveaux points de vie
    @points_de_vie = @points_de_vie + soins
  end

  def ameliorer_degats

    # Dégats bonus entre 0 et 40
    # On additionne les dégats bonus précédement engrangés aux nouveaux
    # Cela permet d'"améliorer" les dégats plusieurs fois et de faire grosse attaque à la Conan le Barbare
    @degats_bonus = @degats_bonus + rand(40)
    puts "#{nom} gagne en puissance !"

  end
end

class Ennemi < Personne
  def degats

    # Dégats entre 0 et 10, après tout c'est nous le gentil et on veut avoir une chance... :)
    degats = rand(10)
    return degats
  end
end

class Jeu
  def self.actions_possibles(monde)
    puts "ACTIONS POSSIBLES :"
    puts "0 - Se soigner"
    puts "1 - Améliorer son attaque"

    # On commence à 2 car 0 et 1 sont réservés pour les actions
    # de soin et d'amélioration d'attaque
    i = 2
    monde.ennemis.each do |ennemi|
      puts "#{i} - Attaquer #{ennemi.info}"
      i = i + 1
    end
    puts "99 - Quitter"
  end

  def self.est_fini(joueur, monde)

    # Le joueur est mort ? :-(
    if !joueur.en_vie
      return true
    end


    boucle = monde.ennemis_en_vie

    i = 0
    boucle.each do |ennemi|
      i = i + 1
    end

    # Tous les méchants sont mort !! :-)
    if i == 0
      return true
    end

  end
end

class Monde
  attr_accessor :ennemis

  def ennemis_en_vie

    # On met tous les vilains méchants qui respirent encore dans un tableau que l'on retourne
    reste_en_vie = []
    ennemis.each do |ennemi|
      reste_en_vie << ennemi if ennemi.en_vie
    end
    return reste_en_vie
  end
end

##############

# Initialisation du monde
monde = Monde.new

# Ajout des ennemis
monde.ennemis = [
  Ennemi.new("Balrog"),
  Ennemi.new("Goblin"),
  Ennemi.new("Squelette")
]

# Initialisation du joueur
joueur = Joueur.new("Jean-Michel Paladin")

# Message d'introduction. \n signifie "retour à la ligne"
puts "\n\nAinsi débutent les aventures de #{joueur.nom}\n\n"

# Boucle de jeu principale
100.times do |tour|
  puts "\n------------------ Tour numéro #{tour} ------------------"

  # Affiche les différentes actions possibles
  Jeu.actions_possibles(monde)

  puts "\nQUELLE ACTION FAIRE ?"
  # On range dans la variable "choix" ce que l'utilisateur renseigne
  choix = gets.chomp.to_i

  # En fonction du choix on appelle différentes méthodes sur le joueur
  if choix == 0
    system "cls"
    joueur.soin
  elsif choix == 1
    system "cls"
    joueur.ameliorer_degats
  elsif choix == 99
    # On quitte la boucle de jeu si on a choisi
    # 99 qui veut dire "quitter"
    break
  else
    system "cls"
    # Choix - 2 car nous avons commencé à compter à partir de 2
    # car les choix 0 et 1 étaient réservés pour le soin et
    # l'amélioration d'attaque
    ennemi_a_attaquer = monde.ennemis[choix - 2]
    joueur.attaque(ennemi_a_attaquer)
  end

  puts "\nLES ENNEMIS RIPOSTENT !"
  puts ""
  # Pour tous les ennemis en vie ...
  monde.ennemis_en_vie.each do |ennemi|
    # ... le héro subit une attaque.
    ennemi.attaque(joueur)
  end

  puts "\nEtat du héro: #{joueur.info}\n"

  # Si le jeu est fini, on interompt la boucle
  break if Jeu.est_fini(joueur, monde)
end

puts "\nGame Over!\n"

# A faire:
# - Afficher le résultat de la partie

# Note du développeur : C'est à dire ? On compte les points comme au tennis ??

if joueur.en_vie
  puts "Vous avez gagné !"
else
  puts "Vous avez perdu !"
end

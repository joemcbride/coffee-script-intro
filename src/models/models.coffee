class Sprite

    constructor: (@name)->
        @health = 50

    attack: (sprite, weapon)=>
        say = @say()
        damage = sprite.do_damage weapon
        sound = weapon.get_sound()
        console.log "#{say}, #{@name} attacking #{sprite.name} with #{weapon.name} for #{damage} damage - #{sound}"

        console.log "#{@name} has killed #{sprite.name}!" if sprite.health <= 0

    say: ()->

    do_damage: (weapon)=>
        damage = weapon.get_damage()
        @health -= damage
        damage

class Pirate extends Sprite

    say: ()->
        'arrr'

class Ninja extends Sprite

    say: ()->
        'shhh'

class Weapon
    constructor: (@name, @max_damage)->

    get_random = (min, max)->
        Math.floor(Math.random() * (max - min + 1)) + min

    get_damage: ()=>
        get_random(0, @max_damage)

    get_sound: ()->

class Katana extends Weapon
    constructor: (@max_damage)->
        super 'katana', @max_damage

    get_sound: ()->
        "swoosh!"

class Pistol extends Weapon
    constructor: (@max_damage)->
        super 'pistol', @max_damage

    get_sound: ()->
        "bang!"


module.exports.Pirate = Pirate
module.exports.Ninja = Ninja

module.exports.Katana = Katana
module.exports.Pistol = Pistol
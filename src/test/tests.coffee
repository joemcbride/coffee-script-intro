assert = require 'assert'

Ninja = require('../models/models').Ninja
Pirate = require('../models/models').Pirate

Katana = require('../models/models').Katana
Pistol = require('../models/models').Pistol

describe "weapons", ->

    describe "Katana", ->
        it "should have a max damage of 5", ->

            katana = new Katana(5)
            assert.equal katana.max_damage, 5

        it "should make a swoosh sound", ->

            katana = new Katana()
            assert.equal katana.get_sound(), 'swoosh!'

    describe "Pistol", ->
        it "should have a max damage of 6", ->

            pistol = new Pistol(6)
            assert.equal pistol.max_damage, 6

        it "should make a bang sound", ->

            pistol = new Pistol()
            assert.equal pistol.get_sound(), 'bang!'


describe "Pirates and Ninjas", ->
    it "should fight to the death", (done)->

        ninja = new Ninja 'Smoke', 'shhh'
        katana = new Katana 5

        pirate = new Pirate 'Kalag the Black', 'argh'
        pistol = new Pistol 6

        pistol.get_random()

        while ninja.health > 0 and pirate.health > 0

            ninja.attack pirate, katana
            pirate.attack ninja, pistol if pirate.health > 0

        done()
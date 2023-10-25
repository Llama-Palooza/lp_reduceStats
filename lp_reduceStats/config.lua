Config = {}

Config.settings = {
    interval = 5000,  -- loop time for checking if a player is sprinting, swimmming, or low on stamina
    staminaAmount = 80,  -- Player stamina level, for some reason, 80 = 20% player stamina left
    decrease = {
        hunger = 1,  -- Amount of hunger to reduce
        thirst = 1  -- Amount of thirst to reduce       
    }
}
Config = {}

-- Target System: 'qb' (qb-target) atau 'ox' (ox_target)
Config.Target = 'qb' 

-- Jarak interaksi 
Config.TargetDistance = 3.0

Config.MinAmount = 1      -- Minimal $1
Config.MaxAmount = 10000  -- Maksimal $10,000

-- Pesan notifikasi 
Config.Notifications = {
    NotEnoughMoney = "You don't have enough cash!",
    InvalidAmount = "Invalid amount!",
    GaveMoney = "You gave $%s to %s",
    ReceivedMoney = "You received $%s from %s",
    TargetNotFound = "Target not found!"
}

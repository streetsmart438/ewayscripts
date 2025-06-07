Config = {}

-- General Settings
Config.Debug = false -- Set to true for debug messages
Config.CheckInterval = 1000 -- How often to check if player is in vehicle (milliseconds)
Config.LicenseType = 'driver' -- License type in player metadata

-- Vehicle Classes that require license
Config.RequiredVehicleClasses = {
    [0] = true,  -- Compacts
    [1] = true,  -- Sedans
    [2] = true,  -- SUVs
    [3] = true,  -- Coupes
    [4] = true,  -- Muscle
    [5] = true,  -- Sports Classics
    [6] = true,  -- Sports
    [7] = true,  -- Super
    [8] = true,  -- Motorcycles
    [9] = true,  -- Off-road
    [10] = true, -- Industrial
    [11] = true, -- Utility
    [12] = true, -- Vans
    [17] = true, -- Service
    [18] = true, -- Emergency (if you want to restrict emergency vehicles)
    [19] = false, -- Military (usually restricted anyway)
    [20] = true, -- Commercial
}

-- Exempt Jobs (players with these jobs can drive without license)
Config.ExemptJobs = {
    'police',
    'ambulance',
    'mechanic'
}

-- Police Alert Settings
Config.PoliceAlert = {
    enabled = true,
    minPolice = 0, -- Minimum police online to send alerts
    alertRadius = 500.0, -- Radius for police alerts
    alertDuration = 30000 -- How long the alert stays on map (milliseconds)
}

-- Notification Settings
Config.Notifications = {
    type = 'qb-core', -- 'qb-core', 'ox_lib', or 'custom'
    position = 'top-right'
}

-- Grace Period (time before kicking player out of vehicle)
Config.GracePeriod = 3000 -- milliseconds

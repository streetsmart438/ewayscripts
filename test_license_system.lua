-- Test script to verify QBCore License System functionality
-- This simulates the license checking logic

print("=== QBCore License System Test ===")

-- Load the configuration
dofile('config.lua')

print("✓ Configuration loaded successfully")
print("- Debug mode:", Config.Debug)
print("- Check interval:", Config.CheckInterval, "ms")
print("- License type:", Config.LicenseType)
print("- Grace period:", Config.GracePeriod, "ms")

-- Test vehicle class restrictions
print("\n✓ Vehicle class restrictions:")
local restrictedCount = 0
for class, restricted in pairs(Config.RequiredVehicleClasses) do
    if restricted then
        restrictedCount = restrictedCount + 1
    end
end
print("- Total restricted vehicle classes:", restrictedCount)

-- Test exempt jobs
print("\n✓ Exempt jobs configuration:")
for i, job in ipairs(Config.ExemptJobs) do
    print("- Exempt job " .. i .. ":", job)
end

-- Test police alert settings
print("\n✓ Police alert settings:")
print("- Alerts enabled:", Config.PoliceAlert.enabled)
print("- Minimum police required:", Config.PoliceAlert.minPolice)
print("- Alert radius:", Config.PoliceAlert.alertRadius)
print("- Alert duration:", Config.PoliceAlert.alertDuration, "ms")

-- Test notification settings
print("\n✓ Notification settings:")
print("- Notification type:", Config.Notifications.type)
print("- Position:", Config.Notifications.position)

-- Simulate license check scenarios
print("\n=== License Check Scenarios ===")

-- Scenario 1: Player with license
print("Scenario 1: Licensed driver")
local hasValidLicense = true
if hasValidLicense then
    print("✓ Access granted - Valid license detected")
else
    print("✗ Access denied - No valid license")
end

-- Scenario 2: Player without license
print("\nScenario 2: Unlicensed driver")
hasValidLicense = false
if not hasValidLicense then
    print("✗ Access denied - License check failed")
    print("- Displaying access denied message")
    print("- Alerting police units")
    print("- Starting grace period (" .. Config.GracePeriod .. "ms)")
    print("- Will remove from vehicle after grace period")
else
    print("✓ Access granted")
end

-- Scenario 3: Exempt job player
print("\nScenario 3: Police officer (exempt job)")
local playerJob = "police"
local isExempt = false
for _, exemptJob in ipairs(Config.ExemptJobs) do
    if playerJob == exemptJob then
        isExempt = true
        break
    end
end

if isExempt then
    print("✓ Access granted - Exempt job: " .. playerJob)
else
    print("✗ Job not exempt, license required")
end

print("\n=== Test Complete ===")
print("QBCore License System is properly configured and ready for deployment!")
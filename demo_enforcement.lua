-- Demo: License Enforcement System in Action
-- This simulates what happens when an unlicensed player tries to drive

print("=== QBCore License Enforcement Demo ===")

-- Load configuration
dofile('config.lua')

-- Simulate an unlicensed player attempting to drive
print("\n🚗 SCENARIO: Unlicensed player enters vehicle as driver")
print("----------------------------------------")

-- Step 1: Player enters vehicle
print("Step 1: Player enters vehicle")
print("- System detects player in driver seat")
print("- Checking license status...")

-- Step 2: License check fails
local hasLicense = false
print("Step 2: License verification")
if hasLicense then
    print("✓ License found - Access granted")
else
    print("✗ No license found - Enforcement triggered")
end

-- Step 3: Immediate response
if not hasLicense then
    print("\nStep 3: Immediate enforcement actions")
    print("- Displaying: 'Access Denied - No Driving License'")
    print("- Sending police alert with location and vehicle info")
    print("- Starting " .. Config.GracePeriod .. "ms grace period countdown...")
    
    -- Step 4: Grace period countdown
    print("\nStep 4: Grace period")
    for i = 3, 1, -1 do
        print("- Warning: " .. i .. " seconds to exit vehicle voluntarily")
    end
    
    -- Step 5: Forced enforcement
    print("\nStep 5: Automatic enforcement")
    print("- Turning off vehicle engine")
    print("- Removing player from vehicle")
    print("- Displaying: 'You have been removed from the vehicle due to no driving license'")
    print("- Player is now standing outside the vehicle")
end

print("\n=== Enforcement Complete ===")
print("Result: Unlicensed player successfully prevented from driving")

-- Show exemption example
print("\n🚔 EXEMPTION EXAMPLE: Police officer")
print("----------------------------------------")
local playerJob = "police"
local isExempt = false

for _, exemptJob in ipairs(Config.ExemptJobs) do
    if playerJob == exemptJob then
        isExempt = true
        break
    end
end

if isExempt then
    print("✓ Player job: " .. playerJob)
    print("✓ Job is exempt from license requirements")
    print("✓ Access granted - Can drive without license")
else
    print("✗ Job requires driving license")
end

print("\n=== Demo Complete ===")
print("The system actively prevents unlicensed driving through:")
print("1. Real-time monitoring")
print("2. Immediate notifications") 
print("3. Police alerts")
print("4. Physical vehicle removal")
print("5. Job-based exemptions")
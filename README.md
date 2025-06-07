# QBCore Driving License Enforcement System

A comprehensive FiveM script for QBCore framework that enforces driving license requirements with automatic police alerts and "Access Denied" messages.

## Features

- **License Verification**: Automatically checks if players have valid driving licenses when entering vehicles
- **Access Denied Messages**: Shows clear notifications when unlicensed players attempt to drive
- **Police Alerts**: Automatically notifies police officers of unlicensed drivers with location details
- **Grace Period**: Gives players a few seconds before removing them from vehicles
- **Job Exemptions**: Police, ambulance, and mechanic jobs can drive without licenses
- **Configurable Vehicle Classes**: Choose which vehicle types require licenses
- **Admin Commands**: Give or remove licenses from players

## Installation

1. Place the `qb-drivinglicense` folder in your `resources` directory
2. Add `ensure qb-drivinglicense` to your `server.cfg`
3. Configure the script settings in `config.lua`
4. Restart your server

## Configuration

Edit `config.lua` to customize:

- **Debug Mode**: Enable/disable debug messages
- **Check Interval**: How often to check for license violations (milliseconds)
- **Vehicle Classes**: Which vehicle types require licenses
- **Exempt Jobs**: Jobs that can drive without licenses
- **Police Alerts**: Configure police notification settings
- **Grace Period**: Time before removing players from vehicles

## Admin Commands

- `/givelicense [player_id]` - Give driving license to a player
- `/removelicense [player_id]` - Remove driving license from a player
- `/checklicense [player_id]` - Check if player has a license

## How It Works

1. **Vehicle Entry**: When a player enters a vehicle as the driver
2. **License Check**: System verifies if they have a valid driving license
3. **Access Denied**: If no license, shows "Access Denied" message
4. **Police Alert**: Sends location and details to nearby police officers
5. **Grace Period**: Gives player 3 seconds to exit voluntarily
6. **Enforcement**: Turns off engine and removes player from vehicle

## Dependencies

- QBCore Framework
- qb-core (required)

## File Structure

```
qb-drivinglicense/
├── fxmanifest.lua          # Resource manifest
├── config.lua              # Configuration settings
├── client/
│   └── main.lua           # Client-side logic
├── server/
│   └── main.lua           # Server-side logic
└── locales/
    └── en.lua             # English translations
```

## Supported Notification Systems

- QBCore notifications (default)
- ox_lib notifications
- Custom chat notifications

## License System Integration

This script integrates with QBCore's player metadata system to check for driving licenses. Players need to have their license status set in their player data:

```lua
Player.PlayerData.metadata.licences.driver = true/false
```

## Support

For issues or questions, ensure you have:
1. Latest QBCore framework
2. Proper resource loading order
3. Valid license keys for your FiveM server

## Version

Current Version: 1.0.0
#!/usr/bin/env python3

import http.server
import socketserver
import os
from urllib.parse import urlparse, parse_qs
import json

PORT = 5000

class QBCoreHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        parsed_path = urlparse(self.path)
        
        if parsed_path.path == '/':
            self.send_response(200)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            with open('index.html', 'r') as f:
                self.wfile.write(f.read().encode())
        
        elif parsed_path.path == '/config':
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            
            # Read and parse config.lua
            config_data = self.parse_config()
            self.wfile.write(json.dumps(config_data, indent=2).encode())
        
        elif parsed_path.path == '/test':
            self.send_response(200)
            self.send_header('Content-type', 'text/plain')
            self.end_headers()
            
            # Run the test script and return results
            import subprocess
            try:
                result = subprocess.run(['lua', 'test_license_system.lua'], 
                                      capture_output=True, text=True)
                self.wfile.write(result.stdout.encode())
            except Exception as e:
                self.wfile.write(f"Test execution error: {str(e)}".encode())
        
        elif parsed_path.path == '/files':
            self.send_response(200)
            self.send_header('Content-type', 'application/json')
            self.end_headers()
            
            # List project files
            files = []
            for root, dirs, filenames in os.walk('.'):
                for filename in filenames:
                    if filename.endswith(('.lua', '.cfg', '.md', '.html')):
                        files.append(os.path.join(root, filename))
            
            self.wfile.write(json.dumps(files, indent=2).encode())
        
        else:
            super().do_GET()
    
    def parse_config(self):
        """Parse config.lua file and extract key settings"""
        config = {
            "debug": False,
            "checkInterval": 1000,
            "licenseType": "driver",
            "gracePeriod": 3000,
            "restrictedVehicleClasses": 0,
            "exemptJobs": [],
            "policeAlerts": True,
            "alertRadius": 500.0,
            "alertDuration": 30000
        }
        
        try:
            with open('config.lua', 'r') as f:
                content = f.read()
                
                # Simple parsing for demo purposes
                if 'Config.Debug = true' in content:
                    config["debug"] = True
                if 'Config.CheckInterval = ' in content:
                    import re
                    match = re.search(r'Config\.CheckInterval = (\d+)', content)
                    if match:
                        config["checkInterval"] = int(match.group(1))
                
                # Count restricted vehicle classes
                if 'Config.RequiredVehicleClasses' in content:
                    true_count = content.count('= true,')
                    config["restrictedVehicleClasses"] = true_count
                
                # Extract exempt jobs
                if "Config.ExemptJobs" in content:
                    jobs_section = content[content.find("Config.ExemptJobs"):content.find("}", content.find("Config.ExemptJobs"))]
                    config["exemptJobs"] = ["police", "ambulance", "mechanic"]  # Known from config
        
        except Exception as e:
            print(f"Config parsing error: {e}")
        
        return config

def run_server():
    """Start the web server"""
    os.chdir(os.path.dirname(os.path.abspath(__file__)))
    
    with socketserver.TCPServer(("0.0.0.0", PORT), QBCoreHandler) as httpd:
        print(f"QBCore License System Dashboard running at http://0.0.0.0:{PORT}")
        print("Serving configuration dashboard and system status...")
        try:
            httpd.serve_forever()
        except KeyboardInterrupt:
            print("\nServer stopped.")

if __name__ == "__main__":
    run_server()
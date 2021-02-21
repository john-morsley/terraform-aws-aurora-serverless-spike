/*
 _____                                    _     
|  __ \                                  | |    
| |__) |_ _ ___ _____      _____  _ __ __| |___ 
|  ___/ _` / __/ __\ \ /\ / / _ \| '__/ _` / __|
| |  | (_| \__ \__ \\ V  V / (_) | | | (_| \__ \
|_|   \__,_|___/___/ \_/\_/ \___/|_|  \__,_|___/
                                                
*/

resource "random_password" "master_password" {

  length      = 25
  min_numeric = 5
  min_lower   = 5
  min_upper   = 5
  special     = false

}
# motiongame

WORK IN PROGRESS

the game state machene and processsing should be kept seprate form all hardware calls. that way it can be migrated to a diffrent proccessor at a later time

Game Modes
  1. acceleration limited
    the game starts and runs without Bluetooth connections
    the player is acceleration limited, and violations will lower life in proportion to the violation.
  
  3. PvP
    use 2 balls per player. one for attack and one to be defended. the game will use rssi to find the closest ball and when a defended ball comes too close to an attacking ball damage will be delt.
        
  2. Synced mass multiplayer
    same as independent, with the addition the game is controlled by a host pc over Bluetooth
    the pc starts the game for all players at the same time and collects health statistics as well as any data applicable scoring.

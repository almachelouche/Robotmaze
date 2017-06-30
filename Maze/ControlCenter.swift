//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(_ myRobot: ComplexRobotObject) {
      
    // You may want to paste your Part 1 implementation of moveComplexRobot() here
        func isFacingWall(_ robot: ComplexRobotObject, direction: MazeDirection) -> Bool {
            
            let cell = mazeController.currentCell(robot)
            var isWall: Bool = false
            
            print("cell above robot?: \(cell.top)")
            print("cell below robot?: \(cell.bottom)")
            print("cell to left of robot?: \(cell.left)")
            print("cell to right of robot?: \(cell.right)")
            
            switch(direction) {
            case .up:
                if cell.top {
                    isWall = true
                }
            case .down :
                if cell.bottom {
                    isWall = true
                }
            case .right :
                if cell.right {
                    isWall = true
                }
            case .left :
                if cell.left {
                    isWall = true
                }
        
            }
          return isWall
            }
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
    print (checkWalls(myRobot))

        // Step 2.1c
        // TODO: Save the return value of checkWalls() to a constant called myWallInfo.
    let myWallInfo = checkWalls(myRobot)
        
        // Step 2.2a
        // Categorize the robot's current location based on the number of walls
        
        // Uncomment the line of code below
      let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
        
        // TODO: Define the constant, isTwoWayPath
        // TODO: Define the constant, isDeadEnd
       let isTwoWaypath = (myWallInfo.numberOfWalls == 2)
       let isDeadEnd = (myWallInfo.numberOfWalls == 3)
        // Step 2.2b
        // Test whether the values of the above constants are correct
        
        // print(isThreeWayJunction)
        // print(isTwoWaypath)
        // print(isDeadEnd)
        // Step 2.3a
        // Three-way Path - else-if statements
        
        // TODO: If the robot encounters a three way junction and there IS a wall ahead, it should randomly rotate right or left. Uncomment the code below.
     
       
        // TODO: If the robot encounters a three way junction and there is NO wall ahead, it should continue straight or rotate (you need to write this else-if statement)
        
        
        // Step 2.3b
        // Two-way Path - else-if statements
        
        // TODO: If the robot encounters a two way path and there is NO wall ahead it should continue forward.
        
        // TODO: If the robot encounters a two way path and there IS a wall ahead, it should randomly rotate.
        
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        }
        else if isThreeWayJunction && !robotIsBlocked {
            continueStraightOrRotate(myRobot, wallInfo: myWallInfo)
        }
        else if isTwoWaypath && !robotIsBlocked {
            myRobot.move()
        } else if isTwoWaypath && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        }
            
            // Step 2.3c
            // Dead end - else-if statements
            
            // TODO: If the robot encounters a dead end and there is NO wall ahead it should move forward.
            
            // TODO: If the robot encounters a dead end and there IS a wall ahead it should rotateRight().
        else if isDeadEnd {
            if robotIsBlocked {
                randomlyRotateRightOrLeft(myRobot)
            } else if !robotIsBlocked {
                myRobot.move()
            }
        
        }
        
    }

    func previousMoveIsFinished(_ robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
    
}


import Foundation

func numIslands(_ grid: [[Character]]) -> Int {
    var land_poses = [[[Int]]]()
    var water_pos = [Int]()
    
    var num_of_isl = 0
    
    for m in 0...grid.count-1{
        var arr_lands = [[Int]]()
        //var arr_lands = [Int]()
        
        var arr_ = [Int]()
        
        for n in 0...grid[m].count-1{
            (m == 0) ? (grid[m][n] == "0" ? (water_pos.append(n+(m*grid[m].count))) : (arr_.append(n))) : (grid[m][n] == "0" ? (water_pos.append(n+(m*grid[m].count))) : (arr_.append(n+(m*grid[m].count))))
        }
        
        arr_lands.append(arr_)
        
        land_poses.append(arr_lands)
        
    }
        
    //var counter = 1
    
    //Counting grouped ones or alone ones.
    func regroup(){
        for a in 0...land_poses.count-1{
            for b in 0...land_poses[a].count-1 {
                guard !land_poses[a][b].isEmpty else{
                    continue
                }
                
                for c in 0...land_poses[a][b].count-1{
                    guard c < land_poses[a][b].count-1 else{
                        continue
                    }
                    
                    var arr_ = [Int]()
                    
                    if land_poses[a][b][c]-land_poses[a][b][c+1] != -1{
                        for d in (c+1)...land_poses[a][b].count-1{
                            arr_.append(land_poses[a][b][d])
                        }
                        
                        land_poses[a].append(arr_)
                        land_poses[a][b].removeAll { arr_.contains($0) }
                        
                        regroup()
                        break
                    }
                }
            }
        }
    }
    
    regroup()

    
    //Sorting
    for a in 0...land_poses.count-1{
        for b in 0...land_poses[a].count-1{
            guard land_poses[a][b].isEmpty == false else{
                continue
            }
            
            var didHave = false
            
            for c in 0...land_poses[a][b].count-1{
                let c_s = land_poses[a][b][c]
                
                if c_s <= grid[0].count-1{
                    if grid.count > 1{
                        //print(c_s+(grid[0].count))
                        if !(water_pos.contains(c_s+(grid[0].count))){
                            didHave = false
                        }
                    }
                } else{
                    if !(water_pos.contains(c_s-(grid[0].count))){
                        didHave = true
                    }
                }
                
                
                
                if c == land_poses[a][b].count-1{
                    //print(a, b, c, didHave)
                    didHave == false ? num_of_isl+=1 : nil
                }
            }
        }
    }

    
    return num_of_isl
}



print(numIslands([
    ["1","1","1","1","1","1","1","1","1","1"],
    ["1","1","1","1","1","0","0","1","1","1"],
    ["1","1","1","1","1","1","1","1","1","1"],
    ["1","1","1","1","1","1","1","1","1","1"]

    ]))

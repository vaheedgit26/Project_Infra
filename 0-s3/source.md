## 🔹 Diagram: Sourced vs Executed Script     
```sql
Scenario A: Script executed directly   
------------------------------------
Command: ./create-s3-bucket.sh   

Current Shell (parent) ──▶ child process (script runs)   
                           │   
                           │ Inside script:   
                           │  BASH_SOURCE[0] = ./create-s3-bucket.sh   
                           │  $0             = ./create-s3-bucket.sh   
                           │   
Result: Both equal → script is executed directly   


Scenario B: Script sourced       
--------------------------
Command: source create-s3-bucket.sh      
Current Shell ───────────────▶ script runs IN the same shell      
                               │   
                               │ Inside script:   
                               │  BASH_SOURCE[0] = ./create-s3-bucket.sh   
                               │  $0               = bash   
                               │      
Result: Not equal → script is sourced
```  

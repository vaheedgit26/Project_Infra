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
##
## 🔹 Key Points from Diagram   
**1. $0**
- Shows **how the shell/script was started.**
- If you sourced, `$0` is your **interactive shell** (bash, zsh, etc)
- If you executed the script, `$0` is the **script filename**.

**2. BASH_SOURCE[0]**     
- Always points to **the actual script file being executed or sourced**.
- Doesn’t care whether it’s sourced or executed.

**3. Comparison**  
```bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    echo "Script is sourced"
else
    echo "Script is executed"
fi
```
- ✅ Unequal → sourced   
- ✅ Equal → executed

## 🔹 Why This Is Useful for Your Terraform Script   
- If sourced → use `return 1` to stop safely **without killing the shell**.   
- If executed → use `exit 1` to stop the script process.

This is exactly why we use:   
```bash
if [[ "${BASH_SOURCE[0]}" != "${0}" ]]; then
    return 1
else
    exit 1
fi
```

Perfect! Let’s make a complete cheat sheet for $0 vs BASH_SOURCE[0] with all the common scenarios you’ll run into in Bash scripting. This is super handy for Terraform automation scripts, sourcing, and CI/CD pipelines.   

🔹 **`$0` vs `BASH_SOURCE[0]` Cheat Sheet**   

| Scenario                                   | Command                               | `$0`                    | `BASH_SOURCE[0]` | Script Status / Use Case                        |   
| ------------------------------------------ | ------------------------------------- | ----------------------- | ---------------- | ----------------------------------------------- |   
| **1. Script executed directly**            | `./script.sh`                         | `./script.sh`           | `./script.sh`    | Both equal → script is executed                 |   
| **2. Script executed with bash**           | `bash script.sh`                      | `bash`                  | `script.sh`      | Different → still considered executed directly  |   
| **3. Script sourced in interactive shell** | `source script.sh` or `. script.sh`   | `bash` (or your shell)  | `script.sh`      | Not equal → script is sourced, safe to `return` |   
| **4. Script sourced from another script**  | `source script.sh` inside `parent.sh` | `parent.sh` (or `bash`) | `script.sh`      | Not equal → sourced                             |   
| **5. Script executed via `bash -c`**       | `bash -c './script.sh'`               | `bash`                  | `./script.sh`    | Different → executed in new shell               |   
| **6. Script sourced with env var**         | `ENV_VAR=1 source script.sh`          | `bash`                  | `script.sh`      | Sourced → variables persist in current shell    |   




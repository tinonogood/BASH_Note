#!bin/bash                              
                                        
function setup() {                      
          trap "cleanup" SIGTERM SIGQUIT
          trap ctrl_c SIGINT            
          echo "PID of script is $$"    
}                                       
                                        
function cleanup() {                    
          echo "cleaning up"            
          exit 1                        
}                                       
                                        
function ctrl_c(){                      
        echo "hello trap"               
        exit 1                          
}                                       
                                        
setup                                   
                                        
for i in `seq 1 50`; do                 
        sleep 1                         
        echo -n "."                     
done                                    

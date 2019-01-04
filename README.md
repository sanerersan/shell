# shell
## sc.sh   
sc.sh can be used to search packages by component file name.   
for example:   
./sc.sh xml2-config will output:   
        candidate:libxml2-dev    
./sc.sh ssl will output:   
        candidate:foxeye [arm64]   
        candidate:foxeye [armhf]   
        candidate:foxeye [i386]   
        candidate:picolisp [not s390x]   
        candidate:foxeye [ppc64el]   
        candidate:foxeye [s390x]   
        candidate:foxeye [amd64]   
        candidate:fex   
        candidate:tinymux   
        candidate:epic4-help  
        

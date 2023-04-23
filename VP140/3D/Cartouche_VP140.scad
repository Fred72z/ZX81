$fn=50;



partie_inferieure();
*partie_superieure();



module partie_inferieure()
{
union()
    {
        difference(){
union(){
difference(){
box (59,50,9,2);
stries();
    
difference()
{    
union()
    {translate ([2.5,11,1.5]) cube ([54,37,9]);   
translate ([3,-1,1.5]) cube ([53,13.5,9]);   
    }
translate ([2,12.5,0]) cube ([55,1.5,5.5]);      
translate ([2,13,0]) cube ([5,20,5.5]);       
translate ([52,13,0]) cube ([5,20,5.5]);      
 
//fixation pcb
difference()
{    
  union()
  {
  hull()
    {
        translate ([22,43,0]) cube ([15,5,5.5]);  
        translate ([24.5,38.5,0]) cube ([10,0.1,5.5]);
    }      
  translate ([29.5,38,0]) cylinder (d=10,h=5.5); 
  }
translate ([29.5,38,0]) cylinder (d=2.3,h=6);  
} 
 
//fixation coque
difference()
{ 
   union()
   { 
    translate ([11.7,38.5,0]) cylinder (d=8,h=5.5);         
    translate ([11.7,38.5,0]) cylinder (d1=13,d2=8,h=4);
   }
    translate ([11.7,38.5,0]) cylinder (d=3.2,h=6);   
}    

difference()
{
    union()
   {
    translate ([47.3,38.5,0]) cylinder (d=8,h=5.5);  
    translate ([47.3,38.5,0]) cylinder (d1=13,d2=8,h=4);  
   }
    translate ([47.3,38.5,0]) cylinder (d=3.2,h=6);  
}
   
}}
}
// passage têtes des vis
translate ([11.7,38.5,-0.1]) cylinder (d1=7,d2=3.2,h=2.5);
translate ([47.3,38.5,-0.1]) cylinder (d1=7,d2=3.2,h=2.5);


// clé

translate ([24,-1,0]) cube ([12,10,3]);  

}
translate ([2.5,15,0]) cube ([2.5,18,11]);  
translate ([54,15,0]) cube ([2.5,18,11]);
translate ([22,45,2]) cube ([15,3,9]);
}

}

  


module partie_superieure()
{
union(){
difference()
{
translate ([0,0,16.5]) mirror ([0,0,1]) box (59,50,7.5,2);
translate ([0,0,8]) stries();

union()
{   
translate ([2.5,13,8.5]) cube ([54,35,6.5]);   
translate ([3,2,8]) cube ([53,11,7]);
translate ([3,-1,7]) cube ([53,13.5,5]);    
    
}

}

translate ([2.5,12.5,9]) cube ([54,1.5,6]);  
translate ([3.5,12.5,7.5]) cube ([52,1.5,7.5]);  


//fixation coque
difference()
{ 
   union()
   { 
    translate ([11.7,38.5,7]) cylinder (d=8,h=9);         
    translate ([11.7,38.5,10]) cylinder (d2=13,d1=8,h=5);
   }
    translate ([11.7,38.5,7]) cylinder (d=2.3,h=7.5);   
}    

difference()
{
    union()
   {
    translate ([47.3,38.5,7]) cylinder (d=8,h=9);  
    translate ([47.3,38.5,10]) cylinder (d2=13,d1=8,h=5);  
   }
    translate ([47.3,38.5,7]) cylinder (d=2.3,h=7.5);  
}



    
}
}


module box (long,larg,haut,r)
{
    hull(){
    translate ([r,r,r]) sphere (r=r);
    translate ([r,r,r]) cylinder (r=r,h=haut-r);
    translate ([long-r,r,r]) sphere (r=r);
    translate ([long-r,r,r]) cylinder (r=r,h=haut-r);
    translate ([r,larg-r,r]) sphere (r=r);
    translate ([r,larg-r,r]) cylinder (r=r,h=haut-r);        
    translate ([long-r,larg-r,r]) sphere (r=r);    
     translate ([long-r,larg-r,r]) cylinder (r=r,h=haut-r);    
      
    }
}

module stries()
{
difference(){
translate ([0,30,0]) cube ([1,15,15]);
for (i=[0:5]) translate ([1.25,30+2.93*i,0]) cylinder (d=2.5,h=15);
}

difference(){
translate ([58,30,0]) cube ([1,15,15]);
for (i=[0:8]) translate ([57.75,30+2.93*i,0]) cylinder (d=2.5,h=15);
}
}
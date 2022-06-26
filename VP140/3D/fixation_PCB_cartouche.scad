$fn=50;


difference()
{

union()
{
cube ([15,3,80]);
cube ([15,5,15]);
translate ([0,0,65]) cube ([15,5,15]);

hull()
    {
translate ([-10,-16+5,16]) rotate ([0,90,0]) cylinder (d=16,h=25);
translate ([0,0,8]) cube ([15,3,15]);
    }
hull()
    {
translate ([-10,-16+5,16+58]) rotate ([0,90,0]) cylinder (d=16,h=25);
translate ([0,0,65]) cube ([15,3,15]);
    }

hull()
    {
translate ([-19,-16+5,16]) rotate ([0,90,0]) cylinder (d=10,h=34);
translate ([-19,-16+3,16]) rotate ([0,90,0]) cylinder (d=10,h=34); }   
hull()
    {
translate ([-19,-16+5,16+58]) rotate ([0,90,0]) cylinder (d=10,h=34);
translate ([-19,-16+3,16+58]) rotate ([0,90,0]) cylinder (d=10,h=34);
    }    
    
hull()
    {
cube ([15,3,80]);    
translate ([20,3,45]) rotate ([90,0,0]) cylinder (d=28,h=3);   
    }

translate ([20,3,45]) rotate ([90,0,0]) cylinder (d=28,h=16);  



    
}


translate ([7.5,-1,6]) rotate ([-90,0,0]) cylinder (d=2.3,h=8);
translate ([7.5,-1,6+64]) rotate ([-90,0,0]) cylinder (d=2.3,h=8);

hull()
{
translate ([-20,-16+5,16]) rotate ([0,90,0]) cylinder (d=3.2,h=25);
translate ([-20,-16+3,16]) rotate ([0,90,0]) cylinder (d=3.2,h=25);
}
hull()
{
translate ([-20,-16+5,16+58]) rotate ([0,90,0]) cylinder (d=3.2,h=25);
translate ([-20,-16+3,16+58]) rotate ([0,90,0]) cylinder (d=3.2,h=25);
}

hull()
{
translate ([-5,-16+6,16]) rotate ([0,90,0])  rotate ([0,0,30])  cylinder (d=6.8,h=3,$fn=6);
translate ([-5,-16-2,16]) rotate ([0,90,0]) rotate ([0,0,30]) cylinder (d=6.8,h=3,$fn=6);
}
hull()
{
translate ([-5,-16+6,16+58]) rotate ([0,90,0])  rotate ([0,0,30])  cylinder (d=6.8,h=3,$fn=6);
translate ([-5,-16-2,16+58]) rotate ([0,90,0]) rotate ([0,0,30]) cylinder (d=6.8,h=3,$fn=6);
}

translate ([20,0,45]) rotate ([90,0,0]) cylinder (d=22.5,h=16);  

}
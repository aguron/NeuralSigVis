%Position Vector Generator function for nicely labeling sliders and using with
 %guiSlider.m

 %This function inputs the "position vector" for a new slider being created , and desired "gap factor" for spacing purposes
 %and outputs the proper "position vectors" needed for neatly labeling and being able to read the values of the new
 % slider at the appropriate locations relative to the slider.
 
 
 %Inputs:
            %LS: numerical value for pixel distance from left edge of figure window to the left edge of the slider box
            %BS: numerical value for pixel distance from bottom edge of figure window to the bottom edge of the slider box
            %WS: numerical value for pixel width of slider 
            %HS: numerical value for pixel Height of slider
            %gf: "gap factor" intended to be some decimal number
                  %much less than 1 (I used .1 for testing) that is used to set a gap distance from slider box and it's labels
                  
 %Outputs: 
         
          
          %-The function outputs a 5x4 matrix containing 5 rows of "position vectors".
          %-Each row is a [Left Bottom Width Height] vector intended for use
          %with guislider2.m and dictates location of a specific label
          %relative to the slider box.
          
          %Row1=zSlider, the position vector describing the size and location of the slider from the input
          %Row2=zLeftLabel, the position vector for minnimum value label (on left of slider) 
          %Row3=zRightLabel, the position vector for max label (on right of slider)
          %Row4=zTitleLabel, the position vector for slider title label (on top of slider)
          %Row5=zBottomLabel, theposition vector for current value label (on bottom of slider)
       
        

function PosVecGen = PosVecGen(LS,BS,WS,HS,gf) 


zSlider=[LS,BS,WS,HS];%slider position vector generated from inputs of function

gap=gf*HS; %sets gap distance as some gap factor (gf) times the sliders height(HS)

hl=(.75)*HS; %75 height of slider is height of min and max labels

wl= 3*HS; % set width of max and min labels as 2* Height of Slider **for now**
wb=wl; % set width of current value label as the 2* Height of Slider **for now**

zLeftLabel=[LS-gap-wl , BS+(HS-hl)/2 , wl , hl]; %position vector for min label (on left of slider) 

zRightLabel=[LS+gap+WS , BS+(HS-hl)/2 , wl , hl]; %position vector for max label (on right of slider)

zTitleLabel=[LS,BS+HS+gap,WS,.55*HS]; %position vector for slider title label (on top of slider)

zBottomLabel=[LS+(WS-wb)/2 , BS-HS-gap , wl , HS]; %position vector for current value label (on bottom of slider)

PosVecGen=[zSlider;zLeftLabel;zRightLabel;zTitleLabel;zBottomLabel];


end
01 - fulldatabase
All the lego bricks in our data base

02 - remove30withLuma
The database after we removed the 15 darkest and 15 brightest bricks 
EXCEPT the very darkest and brightest one

03 - afterChroma
The database after 30 pixels has also been removed based on chroma channels
using kmeans


This approach bad idead.
Luma optimization (removing darkest and brightest) if done in big numbers,
tend to remove important colors. And if done in smaller numbers, focusing on the dark colors, 
because those were less significant (we didnt seem to be able to tell the difference between 
the dark pieces so well), then the chroma omptimization done afterwards didnt take note that some pieces were
dark, and then we lost all the dark ones. 
 Plus, if we only have gray scale legos, what happens then in the chroma optimization?
All have the same chroma value... So a black brick will be classified as same as a white brick. 

04 - kmeansOnFullLAB
This is when kmeans was used on all three channels at once. 
Then dark pixels are prevailed. And, seem to have better spread of colors too.

05 - image after using the general optimization

06 - image when using no optimization

07 - image when taking 50 most used legos in the pic with no optimization. 
Can be problematic if: big area of image is lets say... blue 
(maybe sky) and varies between many shades of blue. Then those will get "high points"
and crucial colors that might not cover a big area of the image, will get removed.

08 - Same algorithm for image based optimization. Both image based and general uses 20 bricks
Here u can clearly see batman compared to general optimization

09 - same as above but 50 bricks

10 - the image based optimization is instead made with kmeans!

08-2 Also kmeans and only 20 bricks

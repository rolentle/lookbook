## LookBook

Production: (http://rolen-lookbook.herokuapp.com/)

### Design Decisions

**Database Structure**
In my database, I have stored the entire urls even though they are very similar.
(i.e. low resolution: "http://distilleryimage3.s3.amazonaws.com/a559b76ab06c11e3afd612c1253656db_6.jpg", thumbnail:"http://distilleryimage3.s3.amazonaws.com/a559b76ab06c11e3afd612c1253656db_5.jpg", high resolution:"http://distilleryimage3.s3.amazonaws.com/a559b76ab06c11e3afd612c1253656db_8.jpg")
Because there is no explicit documentation that says there is a distinct pattern for all 3 urls, I would want to refrain from making an algorithm to predict the urls.

### Future Iterations
**Infinite X-Axis Scrolling**
It could be interesting to create an iframe or use webkits to make the thumbnails in the bottom be flat.

 

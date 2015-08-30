table color : {
  Id : int, 
  Nam : string
}
  PRIMARY KEY Id,
  CONSTRAINT Nam UNIQUE Nam,
  CONSTRAINT Id CHECK Id >= 0

table size : {
  Id : int, 
  Nam : string
}
  PRIMARY KEY Id,
  CONSTRAINT Nam UNIQUE Nam,
  CONSTRAINT Id CHECK Id >= 0

table thing : {
  Id : int, 
  Nam : string,
  Color : int,
  Size : int
}
  PRIMARY KEY Id,
  CONSTRAINT Id CHECK Id >= 0,
  CONSTRAINT Thing_isof_Color FOREIGN KEY Color REFERENCES color(Id),
  CONSTRAINT Thing_isof_Size FOREIGN KEY Size REFERENCES size(Id)


structure COLOR = struct

sequence seq

fun listRows_addNew() =

  rows_xml <- 
    queryX1
      ( SELECT * FROM color ORDER BY color.Nam )
      ( fn r => <xml> <tr> 
                  <td> {[r.Id]} </td> 
                  <td> {[r.Nam]} </td> 
                  <td> <a link={update     r.Id}>[Update]</a> 
                       <a link={delete r.Id}>[Delete]</a> 
                  </td>
                </tr> </xml> )
  ;

  return 
  <xml>
    <table border={1}>
      <tr> <th>Id</th> <th>Nam</th> </tr>

      {rows_xml}

    </table>
    <br/> <hr/> <br/>

    <form>
      <h2>Add a Color:</h2>
      <table>
        <tr> <th>Name:</th> <td> <textbox{#Nam}/> </td> </tr>
        <tr> <th/> <td> <submit action={create} value="Add Color !"/> </td> </tr>
      </table>
    </form>
  </xml>

and create r  =

  id <- nextval seq
  ;

  dml ( INSERT INTO color (
      Id, 
      Nam ) 
    VALUES (
      {[id]}, 
      {[r.Nam]} ) )
  ;

  ls <- listRows_addNew()
  ;

  return 
  <xml> <body>
    <a href="/ColorSize/main">Home</a> <br/>
    <br/> <hr/> <br/>

    <p>Color with Name = "{[r.Nam]}" inserted!</p>

    {ls}

  </body> </xml>

and update( old_Id : int ) =
  let
    fun update' r =

      dml( UPDATE color 
           SET Nam = {[r.New_Nam]}
           WHERE Id = {[old_Id]} )
      ;

      ls <- listRows_addNew()
      ;

      return 
      <xml> <body>
        <a href="/ColorSize/main">Home</a> <br/>
        <br/> <hr/> <br/>

        <p>Color with Id = {[old_Id]} updated!</p>

        {ls}

      </body> </xml>
  in

    old_Nam <- oneRowE1( SELECT (color.Nam) FROM color WHERE color.Id = {[old_Id]} )
    ;

    return 
    <xml> <body>
      <a href="/ColorSize/main">Home</a> <br/>
      <br/> <hr/> <br/>
      <form>
        <table>
          <tr> <th>Name:</th>
            <td> <textbox{#New_Nam} value=

            {old_Nam}

            /> 
          </td> </tr>
          <tr> <th/> <td> <submit action={update'} value="Update Color !"/> </td> </tr>
        </table>
      </form> 
    </body> </xml>
  end (* let ... in ... *)

and delete( id : int ) =
  let
    fun delete'() =

      old_Nam <- oneRowE1( SELECT (color.Nam) FROM color WHERE color.Id = {[id]} )
      ;

      dml( DELETE FROM color WHERE Id = {[id]} )
      ;

      ls <- listRows_addNew()
      ;

      return 
      <xml> <body>
        <a href="/ColorSize/main">Home</a> <br/>
        <br/> <hr/> <br/>

        <p>Color with Name = "{[old_Nam]}" deleted!</p>

        {ls}

      </body> </xml>
  in

    old_Nam <- oneRowE1( SELECT (color.Nam) FROM color WHERE color.Id = {[id]} )
    ;

    return 
    <xml> <body>
      <a href="/ColorSize/main">Home</a> <br/>
      <br/> <hr/> <br/>

      <p>Are you sure you want to delete the Color with Name = "{[old_Nam]}" ?</p>

      <form> <submit action={delete'} value="Yes!"/> </form>
    </body> </xml>
  end (* let ... in ... *)

and main() =
  ls <- listRows_addNew()
  ;
  return 
  <xml> <body>
    <a href="/ColorSize/main">Home</a> <br/>
    <br/> <hr/> <br/>
    <h1>Colors</h1>

    {ls}

  </body> </xml>
end (* structure COLOR = struct ... *)

structure SIZE = struct

sequence seq

fun listRows_addNew() =
  rows_xml <- 
    queryX1
      ( SELECT * FROM size ORDER BY size.Nam)
      ( fn r => <xml> <tr> 
                  <td> {[r.Id]} </td> 
                  <td> {[r.Nam]} </td> 
                  <td> <a link={update     r.Id}>[Update]</a> 
                       <a link={delete r.Id}>[Delete]</a> 
                  </td>
                </tr> </xml>)
  ;
  return 
  <xml>
    <table border={1}>
      <tr> <th>Id</th> <th>Nam</th> </tr>

      {rows_xml}

    </table>
    <br/> <hr/> <br/>
    <form>
      <h2>Add a Size:</h2>
      <table>
        <tr> <th>Name:</th> <td> <textbox{#Nam}/> </td> </tr>
        <tr> <th/> <td> <submit action={create} value="Add Size !"/> </td> </tr>
      </table>
    </form>

  </xml>

and create r  =
  id <- nextval seq
  ;
  dml( INSERT INTO size (
      Id, 
      Nam ) 
    VALUES (
      {[id]}, 
      {[r.Nam]} ) )
  ;
  ls <- listRows_addNew()
  ;
  return 
  <xml> <body>
    <a href="/ColorSize/main">Home</a> <br/>
    <br/> <hr/> <br/>

    <p>Size with Name = "{[r.Nam]}" inserted!</p>

    {ls}

  </body> </xml>

and update( old_Id : int ) =
  let
    fun update' r =

      dml( UPDATE size 
           SET Nam = {[r.New_Nam]}
           WHERE Id = {[old_Id]} )
      ;

      ls <- listRows_addNew()
      ;

      return 
      <xml> <body>
        <a href="/ColorSize/main">Home</a> <br/>
        <br/> <hr/> <br/>

        <p>Size with Id = {[old_Id]} updated!</p>

        {ls}

      </body> </xml>
  in

    old_Nam <- oneRowE1( SELECT (size.Nam) FROM size WHERE size.Id = {[old_Id]} )
    ;

    return 
    <xml> <body>
      <a href="/ColorSize/main">Home</a> <br/>
      <br/> <hr/> <br/>
      <form>
        <table>
          <tr> <th>Name:</th>   <td> <textbox{#New_Nam} value=

            {old_Nam}

          /> </td> </tr>
          <tr> <th/> <td> <submit action={update'} value="Update Size !"/> </td> </tr>
        </table>
      </form> 
    </body> </xml>

  end (* let ... in ... *)

and delete (id : int) =
  let
    fun delete'() =

      old_Nam <- oneRowE1( SELECT (size.Nam) FROM size WHERE size.Id = {[id]} )
      ;

      dml( DELETE FROM size WHERE Id = {[id]} )
      ;

      ls <- listRows_addNew()
      ;

      return 
      <xml> <body>
        <a href="/ColorSize/main">Home</a> <br/>
        <br/> <hr/> <br/>

        <p>Size with Name = "{[old_Nam]}" deleted!</p>

        {ls}

      </body> </xml>
  in

    old_Nam <- oneRowE1( SELECT (size.Nam) FROM size WHERE size.Id = {[id]} )
    ;

    return 
    <xml> <body>
      <a href="/ColorSize/main">Home</a> <br/>
      <br/> <hr/> <br/>

      <p>Are you sure you want to delete the Size with Name = "{[old_Nam]}" ?</p>

      <form>
        <submit action={delete'} value="Yes!"/>
      </form>
    </body> </xml>
  end (* let ... in ... *)

and main() =

  ls <- listRows_addNew()
  ;

  return 
  <xml> <body>
    <a href="/ColorSize/main">Home</a> <br/>
    <br/> <hr/> <br/>
    <h1>Sizes</h1>

    {ls}

  </body> </xml>

end (* structure SIZE = struct ... *)


structure THING = struct

sequence seq

fun listRows_addNew() =

  rows_xml <- 
    queryX 
      ( SELECT thing.Id, thing.Nam, color.Nam, size.Nam 
         FROM  thing, color, size 
         WHERE thing.Color = color.Id 
         AND   thing.Size  = size.Id
         ORDER BY thing.Id)
      ( fn r => <xml> <tr> 
                  <td> {[r.Thing.Id]} </td> 
                  <td> {[r.Thing.Nam]} </td> 
                  <td> {[r.Color.Nam]} </td> 
                  <td> {[r.Size.Nam]} </td> 
                  <td> <a link={update r.Thing.Id}>[Update]</a> 
                       <a link={delete r.Thing.Id}>[Delete]</a> 
                  </td>
                </tr> </xml>)
  ;

  color_options_xml <- 
    queryX1 
      ( SELECT * FROM color ORDER BY color.Nam)
      ( fn r => <xml> <option> {[r.Nam]} </option> </xml> )
  ;

  size_options_xml <- 
    queryX1 
      ( SELECT * FROM size ORDER BY size.Nam )
      ( fn r => <xml> <option> {[r.Nam]} </option> </xml> )
  ;

  return 
  <xml>
    <table border={1}>
      <tr> <th>Id</th> <th>Nam</th> <th>Color</th> <th>Size</th> </tr>

      {rows_xml}

    </table>
    <br/> <hr/> <br/>
    <form>
      <h2>Add a Thing:</h2>
      <table>
        <tr> <th>Name:</th>  <td> <textbox {#Nam} /> </td> </tr>
        <tr> <th>Color:</th> <td> <select  {#ColorNam} >

          {color_options_xml}

        </select> </td> </tr>
        <tr> <th>Size:</th>  <td> <select  {#SizeNam} >

          {size_options_xml}

        </select> </td> </tr>
        <tr> <th/> <td> <submit action={create} value="Add Thing !"/> </td> </tr>
      </table>
    </form>
  </xml>

and create r  =

  id <- nextval seq

  (** TO DO: provide `parse` functions for these - pair (txn,sgnl) ? **)  ;
  color_Id <- oneRowE1( SELECT (color.Id) FROM color WHERE color.Nam = {[r.ColorNam]} )
  ;

  size_Id <- oneRowE1( SELECT (size.Id) FROM size WHERE size.Nam = {[r.SizeNam]} )
  ;

  dml ( INSERT INTO thing (
      Id, 
      Nam, 
      Color,
      Size
    ) 
    VALUES (
      {[id]}, 
      {[r.Nam]}, 

      {[color_Id]},
      {[size_Id]} 

    ) )
  ;

  ls <- listRows_addNew()
  ;

  return 
  <xml> <body>
    <a href="/ColorSize/main">Home</a> <br/>
    <br/> <hr/> <br/>

    <p>
      Thing with Name = "{[r.Nam]}"
        and  Color Name = "{[r.ColorNam]}" 
        and  Size Name = "{[r.SizeNam]}"
        inserted!
    </p>

    {ls}

  </body> </xml>

and update( old_Id : int ) =
  let

    fun update' r =

      color_Id <- oneRowE1( SELECT (color.Id) FROM color WHERE color.Nam = {[r.New_color_Nam]} )
      ;

      size_Id <- oneRowE1( SELECT (size.Id) FROM size WHERE size.Nam = {[r.New_size_Nam]} )
      ;

      dml ( UPDATE thing SET 
        Nam = {[r.New_Nam]},

        Color = {[color_Id]},
        Size = {[size_Id]}

        WHERE Id = {[old_Id]} 
      )
      ;
      ls <- listRows_addNew()
      ;
      return 
      <xml> <body>
        <a href="/ColorSize/main">Home</a> <br/>
        <br/> <hr/> <br/>

        <p>Thing with Id = {[old_Id]} updated!</p>

        {ls}

      </body> </xml>

  in

    old_Nam <- oneRowE1( SELECT (thing.Nam) FROM thing WHERE thing.Id = {[old_Id]} )
    ;

    color_Id <- oneRowE1( SELECT (thing.Color) FROM thing WHERE thing.Id = {[old_Id]} )    
    ;

    color_optionsPopulated_xml <- 
      queryX1 
        ( SELECT * FROM color ORDER BY color.Nam )
        ( fn r => 
          if r.Id = color_Id 
            then <xml> <option selected>  {[r.Nam]} </option> </xml>
            else <xml> <option>           {[r.Nam]} </option> </xml> )
    ;

    size_Id <- oneRowE1( SELECT (thing.Size) FROM thing WHERE thing.Id = {[old_Id]} )    
    ;

    size_optionsPopulated_xml <- 
      queryX1 
        ( SELECT * FROM size ORDER BY size.Nam )
        ( fn r => 
          if r.Id = size_Id 
            then <xml> <option selected>  {[r.Nam]} </option> </xml>
            else <xml> <option>           {[r.Nam]} </option> </xml> )
    ;

    return 
    <xml> <body>
      <a href="/ColorSize/main">Home</a> <br/>
      <br/> <hr/> <br/>
      <form>
        <table>
          <tr> <th>Name:</th>   <td> <textbox {#New_Nam} value=

            {old_Nam} 

          /> </td> </tr>
          <tr> <th>Color:</th>  <td> <select  {#New_color_Nam} > 

            {color_optionsPopulated_xml} 

          </select> </td> </tr>
          <tr> <th>Size:</th>   <td> <select  {#New_size_Nam} >  

            {size_optionsPopulated_xml}  

          </select> </td> </tr>
          <tr> <th/> <td> <submit action={update'} value="Update Thing !"/> </td> </tr>
        </table>
      </form> 
    </body> </xml>

  end (* let ... in ... *)

and delete( id : int ) =
  let
    fun delete'() =

      old_Nam <- oneRowE1( SELECT (thing.Nam) FROM thing WHERE thing.Id = {[id]} )
      ;

      dml( DELETE FROM thing WHERE Id = {[id]} )
      ;

      ls <- listRows_addNew()
      ;

      return 
      <xml> <body>
        <a href="/ColorSize/main">Home</a> <br/>
        <br/> <hr/> <br/>

        <p>Thing with Name = "{[old_Nam]}" deleted!</p>

        {ls}

      </body> </xml>

  in

    old_Nam <- oneRowE1( SELECT (thing.Nam) FROM thing WHERE thing.Id = {[id]} )
    ;

    return 
    <xml> <body>
      <a href="/ColorSize/main">Home</a> <br/>
      <br/> <hr/> <br/>

      <p>Are you sure you want to delete the Thing with Name = "{[old_Nam]}"?</p>

      <form> <submit action={delete'} value="Yes !"/> </form>
    </body> </xml>

  end (* let ... in ... *)

and main() =

  ls <- listRows_addNew()
  ;

  return 
  <xml> <body>
    <a href="/ColorSize/main">Home</a> <br/>
    <br/> <hr/> <br/>
    <h1>Things</h1>

    {ls}

  </body> </xml>

end (* structure THING = struct ... *)

fun main() = 

  return 
  <xml> <body>
    Go to:<br/>

    <li> <a link = {THING.main()}>Things</a> </li>
    <li> <a link = {COLOR.main()}>Colors</a> </li>
    <li> <a link = {SIZE.main()}>Sizes</a> </li>

  </body> </xml>
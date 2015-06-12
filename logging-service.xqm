(:~
 : Simple Console logging service.
 : Author: James Wright
 : Date: 11/15
 :
 : <h1>Installation</h1>
 : Download Basex (www.basex.org) and place this in the webapp folder.
 : Launch the basexhttp batch file found in the basex\bin directory.
 :
 : By default the web service launches on port 8984. Point your logging
 : application to localhost:8984/logging/trace. 
 :
 : It will accept any json content.
 : Happy logging!
 :
 :)
module namespace trace = 'http://jw.trace';

(:~
 : Simple console logging service.  
 : @param $data Data to post
 : @param $propery Property to render from the cargo
 :)
declare 
  %rest:POST("{$data}")
  %rest:path('/logging/trace')
  %rest:consumes("application/json")
  function trace:post($data as item()) {
    let $path := request:parameter('$property') return
      if($path) then fn:trace($data//*[name() = $path]/text())
      else fn:trace(json:serialize($data))
};
  

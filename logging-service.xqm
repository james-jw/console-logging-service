module namespace trace = 'http://jw.trace';

declare 
  %rest:POST("{$data}")
  %rest:path('/logging/trace')
  %rest:consumes("application/json")
  function trace:post($data as item()) {
    fn:trace($data//renderedMessage/text())
};
  
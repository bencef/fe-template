type document // abstract type for a document object
@send external getElementById: (document, string) => option<Dom.element> = "getElementById"
@val external doc: document = "document"

module App = {
  @react.component
  let make = () => <div> {React.string("Hello from app")} </div>
}

  doc
  ->getElementById("app")->Belt.Option.map(element => ReactDOM.render(<App />, element))->ignore

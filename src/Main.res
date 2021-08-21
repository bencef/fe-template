type document // abstract type for a document object
type window // abstract type for the window global object
type event // abstract type for an event
@send external getElementById: (document, string) => option<Dom.element> = "getElementById"
@send external addEventListener: (window, string, event => unit) => unit = "addEventListener"
@val external doc: document = "document"
@val external window: window = "window"

module App = {
  @react.component
  let make = () => <div> {React.string("Hello from app")} </div>
}

window->addEventListener("DOMContentLoaded", _event => {
  doc->getElementById("app")->Belt.Option.map(element => ReactDOM.render(<App />, element))->ignore
})

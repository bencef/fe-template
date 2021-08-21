type document // abstract type for a document object
type window // abstract type for the window global object
type event // abstract type for an event
@send external getElementById: (document, string) => option<Dom.element> = "getElementById"
@send external addEventListener: (window, string, event => unit) => unit = "addEventListener"
@val external doc: document = "document"
@val external window: window = "window"

module App = {
  @react.component
  let make = () => {
    let (clicks, setClicks) = React.useState(() => 0)
    let increment = _event => setClicks(clicks => clicks+1)
    <>
      <div>{React.string("Hello from app, clicked: " ++ clicks->Belt.Int.toString)}</div>
      <button onClick=increment>{"Increment"->React.string}</button>
    </>
  }
}

window->addEventListener("DOMContentLoaded", _event => {
  doc->getElementById("app")->Belt.Option.map(element => ReactDOM.render(<App />, element))->ignore
})

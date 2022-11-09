type document // abstract type for a document object
type window // abstract type for the window global object
type event // abstract type for an event
@send external getElementById: (document, string) => option<Dom.element> = "getElementById"
@send external addEventListener: (window, string, event => unit) => unit = "addEventListener"
@val external doc: document = "document"
@val external window: window = "window"

module Button = {
  @react.component
  let make = (~setClicks) => {
    let increment = _event => setClicks(x => x+1)
    <button onClick=increment>{"Click me to increment"->React.string}</button>
  }
}

module Label = {
  @react.component
  let make = (~clicks) => {
    <div>{React.string("Hello from app, clicked: " ++ clicks->Belt.Int.toString)}</div>
  }
}

module App = {
  @react.component
  let make = () => {
    let (clicks, setClicks) = React.useState(() => 0)
    <>
      <Label clicks />
      <Button setClicks></Button>
    </>
  }
}

window->addEventListener("DOMContentLoaded", _event => {
  doc->getElementById("app")->Belt.Option.map(element => {
    open ReactDOM.Client
    let root = createRoot(element)
    root->Root.render(<App />)
  })->ignore
})

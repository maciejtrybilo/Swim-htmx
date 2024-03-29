This  package extends the [Swim](https://github.com/robb/Swim) HTML DSL with syntax sugar for [HTMX](https://htmx.org).

**Note: This package is WIP. It's not complete and not everything is properly considered. Please refrain from using it in prod for the time being. BTW, PRs welcome!**

### HTMX

HTMX defines new HTML tag attributes to allow any tag to issue network calls and swap only a part or parts of the website with the received response. It opens the possibility to create rich web experiences driven from the backend and removes the need for browser-side frameworks such as React or Angular in most use cases.

HTMX fulfills the original promise of hypermedia, allows for truly RESTful services, and relieves JavaScript from doing any heavy lifting on the frontend.

### Introduction and example

SwimHTMX combines the HTMX tags in several functions for ease of use in Swim.

In the following example of a [Vapor💧](https://github.com/vapor/vapor) controller, the `htmxAction` function is applied to a button defining:
- the endpoint called then the button is clicked
- the tag which contents will be replaced with the response

as well as disabling the button for the duration of the call.

The `GET /emoji` endpoint responds with a random emoji text (which is valid HTML) and the contents of the `<div id:"emoji">` tag is replaced with it each time the button is pressed.

```Swift
import Vapor
import SwimHTMX
import SwimVapor
import HTML

struct EmojiController: RouteCollection {

    func boot(routes: RoutesBuilder) throws {
        routes.get("", use: home)
        routes.get("emoji", use: getEmoji)
    }

    func home(req: Request) -> Node {
    
        let emojiDivId = "emoji"

        return html {
            head {
                meta(charset: "utf-8")
                meta(content: "width=device-width, initial-scale=1", name: "viewport")
                script(src: "https://unpkg.com/htmx.org@1.9.10")
                link(href: "css/style.css", rel: "stylesheet")
            }
            body {
                div(class: "center-screen") {

                    div(id: emojiDivId) { "🙂" }

                    button { "Emoji" }.htmxAction(endpoint: .get(path: "/emoji"),
                                                  target: .id(emojiDivId),
                                                  disable: .this)
                }
            }
        }
    }

    func getEmoji(req: Request) async throws -> Node {
        Node.text(String(randomEmoji()))
    }
}
```

The home page is rendered into the following HTML. You can see the included HTMX attributes.

```HTML
<html>
	<head>
		<meta charset="utf-8"/>
		<meta content="width=device-width, initial-scale=1" name="viewport"/>
		<script src="https://unpkg.com/htmx.org@1.9.10">
		</script>
		<link href="css/style.css" rel="stylesheet"/>
	</head>
	<body>
		<div class="center-screen">
			<div id="emoji">
				🙂
			</div>
			<button hx-disabled-elt="this" hx-get="/emoji" hx-swap="innerHTML" hx-target="#emoji">
				Emoji
			</button>
		</div>
	</body>
</html>
```
And that's the result:
![Screen Recording 2024-02-14 at 20 52 11](https://github.com/maciejtrybilo/Swim-htmx/assets/1718852/5f34604a-f083-435f-b6c4-a50f05bfd628)

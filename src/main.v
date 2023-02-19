module main
import regex


fn main() {
    input := "<template><body><h1 :class='title' @click='triggerFunc'>Hello world!</h1></body></template><script>alert('')</script>"
    template := extract_tag_contents(input, "template")
    script := extract_tag_contents(input, "script")
    contents := map[string]string{}
    contents["template"] = template
    contents["script"] = script
    println(contents)
}

fn extract_tag_contents(input string, tag string) string {
    start_tag := "<" + tag + ">"
    end_tag := "</" + tag + ">"
    regex := regex.new(start_tag + "(.*?)" + end_tag)
    matcher := regex.find(input)
    if matcher.is_some() {
        return matcher.unwrap().group(1)
    } else {
        return ""
    }
}

require 'unloosen'

content_script site: 'www.example.com' do
  h1_content = document.querySelector("h1")
  url = window.location.href.inspect[1...-1]
  clip_text = "[#{h1_content.textContent}](#{url})"

  # Create input element
  input = document.createElement("input")
  input.type = "text"
  input.style = "position: absolute; left: -1000px; top: -1000px;"
  input.value = clip_text

  # Create button element
  button = document.createElement("button")
  button.textContent = "Copy [title](url)"

  button.addEventListener("click") do
    input.select()
    document.execCommand("copy")
    puts "Copied!"
  end

  flagment = document.createDocumentFragment()
  flagment.appendChild(input)
  flagment.appendChild(button)

  h1_content.appendChild(flagment)
end
